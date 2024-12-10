# %%
from datetime import datetime
import os
import json
import toml
import logging
import random
import time
from typing import Any, List, Dict, Optional
from dataclasses import dataclass
from pathlib import Path

from chat_manager import PoeChatManager, ChatSession, get_token_from_browser_cookies
from prompts_template import INIT_MSG, INSTRUCT_MSG, COMMAND_TEMPLATE

def retry_on_exception(max_retries: Optional[int] = None, retry_interval: float = 1.0):
    """
    装饰器: 在遇到任意异常时重试函数执行
    
    :param max_retries: 最大重试次数,None表示无限重试
    :param retry_interval: 重试间隔时间(秒)
    """
    def decorator(func):
        def wrapper(*args, **kwargs):
            attempt = 1
            while True:
                try:
                    return func(*args, **kwargs)
                except Exception as e:
                    if max_retries and attempt > max_retries:
                        logging.error(f"达到最大重试次数{max_retries},停止重试")
                        raise e

                    logging.error(f"第{attempt}次执行失败: {str(e)}")
                    logging.info(f"等待{retry_interval}秒后重试...")
                    time.sleep(retry_interval)
                    attempt += 1
                    logging.info(f"开始第{attempt}次重试")
        return wrapper
    return decorator

class DummyChatSession:
    def send_message(self, message: str) -> str:
        return f"Response for: {message[:50]}..."

@dataclass
class ProcessingState:
    """处理状态"""
    file_name: str          # 原始markdown文件名
    block_files: List[str]  # 分块后的文件列表
    processed_blocks: int   # 已处理的块数
    responses: List[str]    # 已获得的响应
    completed: bool         # 是否处理完成
    cypher_file: str = ""

class BatchProcessor:
    def __init__(self,
                 input_dir: str,
                 chat_session: ChatSession,
                 state_file: str = "processing_state.json",
                 log_file: str = "processing.log",
                 cypher_dir: str = "cyphers",  # cypher文件存储目录
                 save_interval: int = 5,
                 retry_times: int = 3,
                 retry_delay: int = 5,
                 dry_run: bool = False):
        self.input_dir = Path(input_dir)
        self.chat_session = chat_session
        self.state_file = state_file
        self.save_interval = save_interval
        self.retry_times = retry_times
        self.retry_delay = retry_delay
        self.cypher_dir = Path(cypher_dir)
        self.dry_run = dry_run

        self.logger = logging.getLogger(__name__)

        # 确保cypher目录存在
        self.cypher_dir.mkdir(exist_ok=True)

        # 设置日志
        self.setup_logging(log_file)

        # 初始化或加载处理状态
        self.state: Dict[str, ProcessingState] = {}
        self.load_state()

    def setup_logging(self, log_file: str):
        """设置日志"""
        self.logger.setLevel(logging.INFO)

        console_handler = logging.StreamHandler()
        console_handler.setLevel(logging.INFO)

        file_handler = logging.FileHandler(log_file, encoding='utf-8')
        file_handler.setLevel(logging.INFO)

        formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
        console_handler.setFormatter(formatter)
        file_handler.setFormatter(formatter)

        # 检查是否已经添加了处理器，避免重复添加
        if not self.logger.handlers:
            self.logger.addHandler(console_handler)
            self.logger.addHandler(file_handler)

    def load_state(self):
        """加载处理状态"""
        if os.path.exists(self.state_file):
            with open(self.state_file, 'r', encoding='utf-8') as f:
                state_dict = json.load(f)
                self.state = {
                    k: ProcessingState(**v) for k, v in state_dict.items()
                }
            self.logger.info(f"Loaded existing state with {len(self.state)} files")
        else:
            self.logger.info("No existing state found, starting fresh")

    def save_state(self):
        """保存处理状态"""
        state_dict = {
            k: vars(v) for k, v in self.state.items()
        }
        with open(self.state_file, 'w', encoding='utf-8') as f:
            json.dump(state_dict, f, ensure_ascii=False, indent=2)
        self.logger.info("Saved current processing state")

    def get_all_files(self) -> Dict[str, List[str]]:
        """获取所有需要处理的文件及其分块"""
        all_files = {}

        # 遍历目录
        for path in self.input_dir.iterdir():
            if path.is_dir():
                # 检查是否存在对应的原始文件
                original_file = path.name + '.md'
                if (self.input_dir / original_file).exists():
                    # 获取所有分块文件
                    block_files = sorted([
                        str(f.relative_to(self.input_dir))
                        for f in path.glob('*.md')
                    ])
                    if block_files:
                        all_files[original_file] = block_files

        return all_files

    def process_block(self, original_file: str, block_path: str) -> Optional[str]:
        """处理单个块文件"""
        full_path = self.input_dir / block_path
        dry_run = self.dry_run

        try:
            with open(full_path, 'r', encoding='utf-8') as f:
                content = f.read()

            if dry_run:
                self.logger.info(f"DRY RUN: Would process {block_path}")
                return f"DRY RUN response for {block_path}"

            # 尝试发送消息
            for attempt in range(self.retry_times):
                try:
                    message = ""
                    if dry_run:
                        message = content
                    else:
                        message = COMMAND_TEMPLATE.format(original_file, block_path, content)
                    response = self.chat_session.send_message(message)
                    time.sleep(0 if self.dry_run else random.uniform(0, 1))
                    return response
                except Exception as e:
                    self.chat_session.chat_manager.update_tokens()
                    if attempt < self.retry_times - 1:
                        self.logger.warning(f"Attempt {attempt + 1} failed for {block_path}: {e}")
                        time.sleep(self.retry_delay)
                    else:
                        raise

        except Exception as e:
            self.logger.error(f"Error processing {block_path}: {e}")
            raise

    @retry_on_exception(max_retries=None, retry_interval=2.0)  # 无限重试,间隔2秒
    def process_all(self):
        """处理所有文件"""
        dry_run = self.dry_run
        all_files = self.get_all_files()
        self.logger.info(f"Found {len(all_files)} files to process")

        # 初始化新文件的状态
        for original_file, block_files in all_files.items():
            if original_file not in self.state:
                # 初始化处理状态
                cypher_file = str(self.cypher_dir / f"{Path(original_file).stem}.cypher")
                self.state[original_file] = ProcessingState(
                    file_name=original_file,
                    block_files=block_files,
                    processed_blocks=0,
                    responses=[],
                    completed=False,
                    cypher_file=cypher_file
                )

                # 为新文件创建Cypher文件头
                if not dry_run:
                    with open(cypher_file, 'w', encoding='utf-8') as f:
                        f.write(f"// Cypher statements for {original_file}\n")
                        f.write(f"// Generated at {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
                        f.write("// Source: Knowledge Graph Generation from Medical Literature\n")
                        f.write("// Each statement ends with a semicolon\n\n")

        # 处理每个文件
        try:
            for original_file, state in self.state.items():
                if state.completed:
                    self.logger.info(f"Skipping completed file: {original_file}")
                    continue

                self.logger.info(f"Processing {original_file}")

                # 从上次中断的地方继续处理
                for i in range(state.processed_blocks, len(state.block_files)):
                    block_path = state.block_files[i]
                    self.logger.info(f"Processing block {i + 1}/{len(state.block_files)}: {block_path}")

                    response = self.process_block(original_file, block_path)
                    if response:
                        state.responses.append(response)
                        state.processed_blocks = i + 1

                        # 定期保存状态和响应
                        if (i + 1) % self.save_interval == 0:
                            self.logger.info(f"Periodic save at block {i + 1}")
                            self.save_state()
                            self.save_responses(original_file)

                # 文件处理完成
                state.completed = True
                self.save_state()
                self.save_responses(original_file)

                # 添加文件处理完成的日志
                self.logger.info(f"Completed processing {original_file}")
                self.logger.info(f"Total blocks processed: {len(state.block_files)}")
                self.logger.info(f"Total responses saved: {len(state.responses)}")
                self.logger.info(f"Results saved to:")
                self.logger.info(f"  - JSON: {self.input_dir / f'{original_file}.responses.json'}")
                self.logger.info(f"  - Cypher: {state.cypher_file}")

        except Exception as e:
            self.logger.error(f"Processing interrupted: {e}")
            self.save_state()  # 保存当前状态
            self.chat_session.chat_manager.update_tokens()
            raise

        finally:
            # 输出最终处理统计
            total_files = len(all_files)
            completed_files = sum(1 for state in self.state.values() if state.completed)
            total_blocks = sum(len(state.block_files) for state in self.state.values())
            processed_blocks = sum(state.processed_blocks for state in self.state.values())

            self.logger.info("\n=== Processing Summary ===")
            self.logger.info(f"Total files: {total_files}")
            self.logger.info(f"Completed files: {completed_files}")
            self.logger.info(f"Total blocks: {total_blocks}")
            self.logger.info(f"Processed blocks: {processed_blocks}")
            self.logger.info(f"Completion rate: {(processed_blocks/total_blocks)*100:.2f}%")

    def save_responses(self, file_name: str):
        """保存单个文件的所有响应，支持JSON和TOML格式"""
        state = self.state[file_name]
        if not state.responses:
            return

        base_path = self.input_dir / file_name

        # 1. 保存JSON格式（如果需要）
        json_file = f"{base_path}.responses.json"
        with open(json_file, 'w', encoding='utf-8') as f:
            json.dump(state.responses, f, ensure_ascii=False, indent=2)
        self.logger.info(f"Saved responses as JSON to {json_file}")

        # 2. 保存TOML格式（如果需要）
        toml_file = f"{base_path}.responses.toml"

        # 直接构建TOML文本内容
        toml_content = [
            "[metadata]",
            f'created_at = "{datetime.now().strftime("%Y-%m-%d %H:%M:%S")}"',
            f'total_responses = {len(state.responses)}',
            ""
        ]

        # 添加每个响应的内容
        for i, response in enumerate(state.responses, 1):
            toml_content.extend([
                f"[responses.response_{i}]",
                f'timestamp = "{datetime.now().strftime("%Y-%m-%d %H:%M:%S")}"',
                "content = '''",
                response,  # 直接插入响应内容，不做任何转义
                "'''",
                ""
            ])

        # 写入文件
        with open(toml_file, 'w', encoding='utf-8') as f:
            f.write('\n'.join(toml_content))

        self.logger.info(f"Saved responses as TOML to {toml_file}")

        # 3. 保存Cypher格式（原有功能）
        if not hasattr(state, 'cypher_file') or not state.cypher_file:
            base_name = Path(file_name).stem
            state.cypher_file = str(self.cypher_dir / f"{base_name}.cypher")

        last_saved = 0
        if os.path.exists(state.cypher_file):
            with open(state.cypher_file, 'r', encoding='utf-8') as f:
                last_saved = sum(1 for line in f if line.strip() and not line.startswith('//'))

        new_responses = state.responses[last_saved:]
        if new_responses:
            with open(state.cypher_file, 'a', encoding='utf-8') as f:
                for response in new_responses:
                    f.write(f"{response.strip()};\n")
                    f.write(f"// Block {state.processed_blocks} - {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")

            self.logger.info(f"Appended {len(new_responses)} Cypher statements to {state.cypher_file}")

# %%
if __name__ == "__main__":
    # gql_POST
    tokens = {}
    bot_name = "claude-3.5-sonnet-200k"
    # bot_name = "Assistant"
    chat_manager = PoeChatManager(tokens=tokens, dry_run=False)
    session = chat_manager.create_session(bot_name=bot_name, initial_message=INIT_MSG)
    # session = chat_manager.get_session(bot_name=bot_name, chat_code='2y9ur7o1f4u98sqw5hg')

    processor = BatchProcessor(
        input_dir="dataset",
        chat_session=DummyChatSession() if False else session,
        save_interval=5
    )

    try:
        # 执行处理,遇到异常会自动重试
        processor.process_all()
    except Exception as e:
        logging.error(f"处理最终失败: {str(e)}")

# %%