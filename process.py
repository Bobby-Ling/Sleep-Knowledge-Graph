# %%
from datetime import datetime
import os
import json
import textwrap
import toml
import logging
import random
import time
from typing import Any, List, Dict, Optional, Tuple
from dataclasses import dataclass
from pathlib import Path
import tiktoken

from chat_manager import PoeChatManager, ChatSession
from prompts_template import INIT_MSG, INSTRUCT_MSG, COMMAND_TEMPLATE, PREPROCESS_INIT_MSG, PREPROCESS_MSG

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

@dataclass
class MessagePair:
    """消息对"""
    content: str          # 原始文本块
    message: str           # 发送的消息
    response: str         # 收到的响应
    timestamp: str        # 处理时间戳

@dataclass
class ProcessingState:
    """处理状态"""
    file_name: str          # 原始markdown文件名
    block_files: List[str]  # 分块后的文件列表
    processed_blocks: int   # 已处理的块数
    message_pairs: List[MessagePair]  # 消息对列表
    completed: bool         # 是否处理完成
    cypher_file: str = ""

class DummyChatSession:
    def __init__(self):
        self.chat_manager = {}
        pass
    def send_message(self, message: str) -> str:
        return f"Response for: {message[:50]}..."

LOGGER_NAME = "process"

class BatchProcessor:
    def __init__(self,
                 input_dir: str,
                 chat_session: ChatSession,
                 preprocess_session: ChatSession,
                 state_file: str = "processing_state.json",
                 log_level = logging.INFO,
                 cypher_dir: str = "cyphers",
                 save_interval: int = 5,
                 retry_times: int = 5,
                 retry_delay: int = 5,
                 dry_run: bool = False):
        self.input_dir = Path(input_dir)
        self.chat_session = chat_session
        self.preprocess_session = preprocess_session
        self.state_file = state_file
        self.save_interval = save_interval
        self.retry_times = retry_times
        self.retry_delay = retry_delay
        self.cypher_dir = Path(cypher_dir)
        self.dry_run = dry_run

        # LLM价格配置 (每1K tokens的美元价格)
        self.price_config = {
            "claude-3-opus": {"prompt": 0.015, "completion": 0.075},
            "claude-3-sonnet": {"prompt": 0.015, "completion": 0.045},
            "claude-2": {"prompt": 0.008, "completion": 0.024},
            "gpt-4": {"prompt": 0.03, "completion": 0.06},
            "gpt-3.5-turbo": {"prompt": 0.0005, "completion": 0.0015}
        }

        self.logger = logging.getLogger(LOGGER_NAME)
        self.cypher_dir.mkdir(exist_ok=True)
        self.setup_logging(log_level)
        self.state: Dict[str, ProcessingState] = {}
        self.load_state()

    def setup_logging(self, log_level):
        """设置日志"""
        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        log_file = f'logs/processing_{timestamp}.log'

        self.logger.setLevel(logging.INFO)

        console_handler = logging.StreamHandler()
        console_handler.setLevel(log_level)

        file_handler = logging.FileHandler(log_file, encoding='utf-8')
        file_handler.setLevel(logging.INFO)

        formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
        console_handler.setFormatter(formatter)
        file_handler.setFormatter(formatter)

        if not self.logger.handlers:
            self.logger.addHandler(console_handler)
            self.logger.addHandler(file_handler)

    def load_state(self):
        """加载处理状态"""
        if os.path.exists(self.state_file):
            with open(self.state_file, 'r', encoding='utf-8') as f:
                state_dict = json.load(f)
                self.state = {}
                for k, v in state_dict.items():
                    # 转换message_pairs
                    message_pairs = [
                        MessagePair(**pair) if isinstance(pair, dict) else
                        MessagePair(pair[0], pair[1], pair[2], datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
                        for pair in v.pop('message_pairs', [])
                    ]
                    self.state[k] = ProcessingState(**v, message_pairs=message_pairs)
            self.logger.info(f"Loaded existing state with {len(self.state)} files")
        else:
            self.logger.info("No existing state found, starting fresh")

    def save_state(self):
        """保存处理状态"""
        state_dict = {
            k: {
                **{key: value for key, value in vars(v).items() if key != 'message_pairs'},
                'message_pairs': [vars(pair) for pair in v.message_pairs]
            }
            for k, v in self.state.items()
        }
        with open(self.state_file, 'w', encoding='utf-8') as f:
            json.dump(state_dict, f, ensure_ascii=False, indent=2)
        self.logger.info("Saved current processing state")

    def get_all_files(self) -> Dict[str, List[str]]:
        """获取所有需要处理的文件及其分块"""
        all_files = {}
        for path in self.input_dir.iterdir():
            if path.is_dir():
                original_file = path.name + '.md'
                if (self.input_dir / original_file).exists():
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
                dummy_response = f"DRY RUN response for {block_path}"
                # 创建消息对
                self.state[original_file].message_pairs.append(
                    MessagePair(
                        content=f"raw: \n{content}",
                        message=content,
                        response=dummy_response,
                        timestamp=datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                    )
                )
                return dummy_response

            # 尝试发送消息
            for attempt in range(self.retry_times):
                try:
                    self.logger.info("\n\n//////---------------------------------------------------------------")
                    self.logger.info(f"[content]: \n{content}")

                    preprocessed_content = self.preprocess_session.send_message(PREPROCESS_MSG.format(content))
                    self.logger.info(f"[preprocessed_content]: \n{preprocessed_content}")

                    message = COMMAND_TEMPLATE.format(original_file, block_path, preprocessed_content)
                    self.logger.info(f"[message]: {message}")

                    response = self.chat_session.send_message(message)
                    self.logger.info(textwrap.dedent(f"[response]: \n{response}"))
                    self.logger.info("\n---------------------------------------------------------------//////\n\n")
                    # 创建消息对
                    self.state[original_file].message_pairs.append(
                        MessagePair(
                            content=content,
                            message=message,
                            response=response,
                            timestamp=datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                        )
                    )

                    time.sleep(0 if self.dry_run else random.uniform(0, 1))
                    return response
                except Exception as e:
                    if not self.dry_run:
                        self.chat_session.chat_manager.update_tokens()
                    if attempt < self.retry_times - 1:
                        self.logger.warning(f"Attempt {attempt + 1} failed for {block_path}: {e}")
                        time.sleep(self.retry_delay)
                    else:
                        raise

        except Exception as e:
            self.logger.error(f"Error processing {block_path}: {e}")
            raise

    def save_responses(self, file_name: str):
        """保存单个文件的所有响应，支持JSON和TOML格式"""
        state = self.state[file_name]
        if not state.message_pairs:
            return

        base_path = self.input_dir / file_name

        # 1. 保存JSON格式
        json_data = {
            "metadata": {
                "file_name": file_name,
                "processed_at": datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
                "total_pairs": len(state.message_pairs)
            },
            "message_pairs": [vars(pair) for pair in state.message_pairs]
        }

        json_file = f"{base_path}.responses.json"
        with open(json_file, 'w', encoding='utf-8') as f:
            json.dump(json_data, f, ensure_ascii=False, indent=2)
        self.logger.info(f"Saved responses as JSON to {json_file}")

        # 2. 保存TOML格式
        toml_file = f"{base_path}.responses.toml"
        toml_content = [
            "[metadata]",
            f'file_name = "{file_name}"',
            f'processed_at = "{datetime.now().strftime("%Y-%m-%d %H:%M:%S")}"',
            f'total_pairs = {len(state.message_pairs)}',
            ""
        ]

        for i, pair in enumerate(state.message_pairs, 1):
            toml_content.extend([
                f"[[message_pairs]]",
                f'timestamp = "{pair.timestamp}"',
                "message = '''",
                pair.message,
                "'''",
                "response = '''",
                pair.response,
                "'''",
                ""
            ])

        with open(toml_file, 'w', encoding='utf-8') as f:
            f.write('\n'.join(toml_content))
        self.logger.info(f"Saved responses as TOML to {toml_file}")

        # 3. 保存Cypher格式
        if not state.cypher_file:
            base_name = Path(file_name).stem
            state.cypher_file = str(self.cypher_dir / f"{base_name}.cypher")

        last_saved = 0
        if os.path.exists(state.cypher_file):
            with open(state.cypher_file, 'r', encoding='utf-8') as f:
                last_saved = sum(1 for line in f if line.strip() and not line.startswith('//'))

        new_responses = state.message_pairs[last_saved:]
        if new_responses:
            with open(state.cypher_file, 'a', encoding='utf-8') as f:
                for pair in new_responses:
                    f.write(f"{pair.response.strip()};\n")
                    f.write(f"// Processed at {pair.timestamp}\n\n")

            self.logger.info(f"Appended {len(new_responses)} Cypher statements to {state.cypher_file}")

    @retry_on_exception(max_retries=10, retry_interval=2.0)
    def process_all(self):
        """处理所有文件"""
        all_files = self.get_all_files()
        self.logger.info(f"Found {len(all_files)} files to process")

        try:
            # 初始化新文件的状态
            for original_file, block_files in all_files.items():
                if original_file not in self.state:
                    cypher_file = str(self.cypher_dir / f"{Path(original_file).stem}.cypher")
                    self.state[original_file] = ProcessingState(
                        file_name=original_file,
                        block_files=block_files,
                        processed_blocks=0,
                        message_pairs=[],
                        completed=False,
                        cypher_file=cypher_file
                    )

                    if not self.dry_run:
                        with open(cypher_file, 'w', encoding='utf-8') as f:
                            f.write(f"// Cypher statements for {original_file}\n")
                            f.write(f"// Generated at {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
                            f.write("// Source: Knowledge Graph Generation from Medical Literature\n")
                            f.write("// Each statement ends with a semicolon\n\n")

            # 处理每个文件
            for original_file, state in self.state.items():
                if state.completed:
                    self.logger.info(f"Skipping completed file: {original_file}")
                    continue

                self.logger.info(f"Processing {original_file}")

                for i in range(state.processed_blocks, len(state.block_files)):
                    block_path = state.block_files[i]
                    self.logger.info(f"Processing block {i + 1}/{len(state.block_files)}: {block_path}")

                    response = self.process_block(original_file, block_path)
                    if response:
                        state.processed_blocks = i + 1

                        if (i + 1) % self.save_interval == 0:
                            self.logger.info(f"Periodic save at block {i + 1}")
                            self.save_state()
                            self.save_responses(original_file)

                state.completed = True
                self.save_state()
                self.save_responses(original_file)

                self.logger.info(f"Completed processing {original_file}")
                self.logger.info(f"Total blocks processed: {len(state.block_files)}")
                self.logger.info(f"Total message pairs: {len(state.message_pairs)}")

        except Exception as e:
            self.logger.error(f"Processing interrupted: {e}")
            self.save_state()
            if not self.dry_run:
                self.chat_session.chat_manager.update_tokens()
            raise

        finally:
            encoding = tiktoken.get_encoding("cl100k_base")

            # 计算所有消息的token数
            total_prompt_tokens = 0
            total_completion_tokens = 0
            total_cost = 0

            # 获取当前使用的模型
            model_name = getattr(self.chat_session, 'bot_name', 'claude-3-sonnet').lower()

            # 找到匹配的价格配置
            price_config = None
            for model_key, config in self.price_config.items():
                if model_key in model_name:
                    price_config = config
                    break

            if not price_config:
                price_config = self.price_config["claude-3-sonnet"]

            # 统计每个文件的token使用情况
            file_stats = {}
            for file_name, state in self.state.items():
                file_prompt_tokens = 0
                file_completion_tokens = 0

                for pair in state.message_pairs:
                    prompt_tokens = len(encoding.encode(pair.message))
                    completion_tokens = len(encoding.encode(pair.response))

                    file_prompt_tokens += prompt_tokens
                    file_completion_tokens += completion_tokens

                total_prompt_tokens += file_prompt_tokens
                total_completion_tokens += file_completion_tokens

                file_cost = (file_prompt_tokens / 1000 * price_config["prompt"] +
                            file_completion_tokens / 1000 * price_config["completion"])
                total_cost += file_cost

                file_stats[file_name] = {
                    "prompt_tokens": file_prompt_tokens,
                    "completion_tokens": file_completion_tokens,
                    "total_tokens": file_prompt_tokens + file_completion_tokens,
                    "cost": file_cost
                }

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

            self.logger.info("\n=== Token Usage ===")
            self.logger.info(f"Model: {model_name}")
            self.logger.info(f"Total prompt tokens: {total_prompt_tokens:,}")
            self.logger.info(f"Total completion tokens: {total_completion_tokens:,}")
            self.logger.info(f"Total tokens: {total_prompt_tokens + total_completion_tokens:,}")
            self.logger.info(f"Estimated cost: ${total_cost:.4f}")

            self.logger.info("\n=== Per File Statistics ===")
            for file_name, stats in file_stats.items():
                self.logger.info(f"{file_name}:")
                self.logger.info(f"  Prompt tokens: {stats['prompt_tokens']:,}")
                self.logger.info(f"  Completion tokens: {stats['completion_tokens']:,}")
                self.logger.info(f"  Total tokens: {stats['total_tokens']:,}")
                self.logger.info(f"  Cost: ${stats['cost']:.4f}")

# %%
if __name__ == "__main__":
    DRY_RUN = False
    if not DRY_RUN:
        # gql_POST
        tokens = {}
        preprocess_bot_name = "Assistant"
        # bot_name = "Assistant"
        bot_name = "claude-3.5-sonnet-200k"
        chat_manager = PoeChatManager(tokens=tokens, log_level=logging.INFO, dry_run=False)

        # preprocess_session = chat_manager.create_session(bot_name=preprocess_bot_name, initial_message=PREPROCESS_INIT_MSG)
        preprocess_session = chat_manager.get_session(bot_name=bot_name, chat_code='2y405esrum7wlw8cria')

        # session = chat_manager.create_session(bot_name=bot_name, initial_message=INIT_MSG)
        session = chat_manager.get_session(bot_name=bot_name, chat_code='2y406tqjs31ldhr5zzs')
        # session.send_message(INSTRUCT_MSG)


    processor = BatchProcessor(
        input_dir="dataset",
        preprocess_session=DummyChatSession() if DRY_RUN else preprocess_session,
        chat_session=DummyChatSession() if DRY_RUN else session,
        save_interval=5
    )

    try:
        # 执行处理,遇到异常会自动重试
        processor.process_all()
    except Exception as e:
        logging.error(f"处理最终失败: {str(e)}")

# %%