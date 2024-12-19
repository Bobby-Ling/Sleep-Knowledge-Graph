# %%
from datetime import datetime
import os
import json
import textwrap
import threading
import logging
import time
from typing import List, Dict, Optional, Tuple
from dataclasses import dataclass
from pathlib import Path
import tiktoken
from queue import Empty, Queue
from threading import Lock, Event, RLock
import asyncio
from concurrent.futures import ThreadPoolExecutor

from chat_session_interfce import ChatSessionInterface
from openai_chat import OpenAIChatSession
import openai_chat
from prompts_template import API_COMMAND_MSG, API_PAYLOAD_TEMPLATE, PREPROCESS_MSG

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

class DummyChatSession(ChatSessionInterface):
    # @override
    def _process_message(self, message: str) -> str:
        return f"Response for: {message[:50]}..."
    # @override
    def update_connection(self):
        pass

LOGGER_NAME = "process"

@dataclass
class ParallelConfig:
    """并行处理配置"""
    enabled: bool = False           # 是否启用并行处理
    max_workers: int = 3           # 最大工作线程数
    queue_size: int = 100         # 消息队列大小
    batch_size: int = 5           # 批处理大小

class BatchProcessor:
    def __init__(self,
                 input_dir: str,
                 chat_session: ChatSessionInterface,
                 preprocess_session: ChatSessionInterface,
                 state_file: str = "processing_state.json",
                 log_level = logging.INFO,
                 cypher_dir: str = "cyphers",
                 save_interval: int = 5,
                 retry_times: int = 5,
                 retry_delay: int = 5,
                 dry_run: bool = False,
                 parallel_config: Optional[ParallelConfig] = None):

        self.input_dir = Path(input_dir)
        self.chat_session = chat_session
        self.preprocess_session = preprocess_session
        self.state_file = state_file
        self.save_interval = save_interval
        self.retry_times = retry_times
        self.retry_delay = retry_delay
        self.cypher_dir = Path(cypher_dir)
        self.dry_run = dry_run
        self.parallel_config = parallel_config or ParallelConfig()

        # 并行处理相关的属性
        self.message_queue = Queue(maxsize=self.parallel_config.queue_size) if self.parallel_config.enabled else None
        # self.save_lock = Lock()
        self.state_lock = RLock()
        self.stop_event = Event()

        # 线程池
        self.executor = (ThreadPoolExecutor(max_workers=self.parallel_config.max_workers)
                        if self.parallel_config.enabled else None)

        # LLM价格配置 (每1K tokens的美元价格)
        self.price_config = {
            "gpt-4o-mini": {"prompt": 0.15/1000, "completion": 0.6/1000},
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
        log_file_debug = f'logs/processing_{timestamp}_debug.log'

        self.logger.setLevel(logging.DEBUG)

        console_handler = logging.StreamHandler()
        console_handler.setLevel(log_level)

        file_handler = logging.FileHandler(log_file, encoding='utf-8')
        file_handler.setLevel(logging.INFO)

        debug_file_handler = logging.FileHandler(log_file_debug, encoding='utf-8')
        debug_file_handler.setLevel(logging.DEBUG)

        formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
        console_handler.setFormatter(formatter)
        file_handler.setFormatter(formatter)
        debug_file_handler.setFormatter(formatter)

        if not self.logger.handlers:
            self.logger.addHandler(console_handler)
            self.logger.addHandler(file_handler)
            self.logger.addHandler(debug_file_handler)

    # 修改self.state
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

    # 保存.json, 不用锁
    def save_state(self):
        """保存处理状态"""
        self.logger.info("Saving current processing state")
        state = self.state.copy()
        # with self.save_lock:  # 使用锁确保并发安全
        state_dict = {
            k: {
                **{key: value for key, value in vars(v).items() if key != 'message_pairs'},
                'message_pairs': [vars(pair) for pair in v.message_pairs]
            }
            for k, v in state.items()
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
                # if (self.input_dir / original_file).exists():
                block_files = sorted([
                    str(f.relative_to(self.input_dir))
                    for f in path.glob('*.md')
                ])
                if block_files:
                    all_files[original_file] = block_files
        return all_files

    # 修改self.state
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
                    self.logger.debug(f"[content]: \n{content}")

                    preprocessed_content = content
                    # preprocessed_content = self.preprocess_session.send_message(PREPROCESS_MSG.format(content))
                    # self.logger.debug(f"[preprocessed_content]: \n{preprocessed_content}")

                    # message = COMMAND_TEMPLATE.format(original_file, block_path, preprocessed_content)
                    # message = API_COMMAND_MSG + API_PAYLOAD_TEMPLATE.format(original_file, block_path, preprocessed_content)
                    message = API_PAYLOAD_TEMPLATE.format(original_file, block_path, preprocessed_content)
                    self.logger.debug(f"[message]: {message}")

                    response = self.chat_session.send_message(message, )
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

                    # time.sleep(0 if self.dry_run else random.uniform(0, 1))
                    return response
                except Exception as e:
                    if not self.dry_run:
                        self.chat_session.update_connection()
                    if attempt < self.retry_times - 1:
                        self.logger.warning(f"Attempt {attempt + 1} failed for {block_path}: {e}")
                        time.sleep(self.retry_delay)
                    else:
                        raise

        except Exception as e:
            self.logger.error(f"Error processing {block_path}: {e}")
            raise

    # 修改self.state
    async def process_message_async(self, original_file: str, block_path: str) -> Optional[str]:
        """异步处理单个消息"""
        try:
            response = await asyncio.get_event_loop().run_in_executor(
                self.executor,
                self.process_block,
                original_file,
                block_path
            )
            return response
        except Exception as e:
            self.logger.error(f"Error processing message async {block_path}: {e}")
            raise

    # 修改self.state
    async def process_batch_async(self, batch: List[Tuple[str, str]]) -> List[Optional[str]]:
        """异步处理一批消息"""
        tasks = []
        for original_file, block_path in batch:
            task = self.process_message_async(original_file, block_path)
            tasks.append(task)

        responses = await asyncio.gather(*tasks, return_exceptions=True)
        return responses

    # 修改self.state
    def parallel_processor(self):
        """并行处理工作线程"""
        while not self.stop_event.is_set():
            try:
                batch = []
                # 收集一批待处理的消息
                for _ in range(self.parallel_config.batch_size):
                    try:
                        item = self.message_queue.get(timeout=1)
                        batch.append(item)
                    except Empty:
                        break

                if not batch:
                    continue

                self.logger.info(f"收集了一批待处理的消息: {batch}")

                # 异步处理这一批消息
                loop = asyncio.new_event_loop()
                asyncio.set_event_loop(loop)
                try:
                    responses = loop.run_until_complete(self.process_batch_async(batch))

                    for (original_file, block_path), response in zip(batch, responses):
                        if isinstance(response, Exception):
                            self.logger.error(f"Error processing {block_path}: {response}")
                            continue

                        if response:
                            # 更新处理状态
                            self.logger.info("尝试获取self.state_lock")
                            with self.state_lock:
                                self.logger.info("已获取self.state_lock")
                                state = self.state[original_file]
                                state.processed_blocks += 1

                                # if state.processed_blocks % self.save_interval == 0:
                                    # with self.save_lock:
                                self.save_state()
                                    # self.save_responses(original_file)
                finally:
                    loop.close()

            except Exception as e:
                self.logger.error(f"Error in parallel processor: {e}")

        self.logger.info("Parallel processor stopped")

    def prepare_parallel_processing(self):
        """准备并行处理环境"""
        if not self.parallel_config.enabled:
            return

        # 启动工作线程
        self.workers = []
        for _ in range(self.parallel_config.max_workers):
            worker = threading.Thread(target=self.parallel_processor)
            worker.daemon = True
            worker.start()
            self.workers.append(worker)

    def cleanup_parallel_processing(self):
        """清理并行处理资源"""
        if not self.parallel_config.enabled:
            return

        self.stop_event.set()
        for worker in self.workers:
            worker.join()

        if self.executor:
            self.executor.shutdown()

    def _get_queue_status(self) -> str:
        """获取队列状态信息"""
        if not self.parallel_config.enabled:
            return "Sequential mode - No queue"

        queue_size = self.message_queue.qsize()
        queue_maxsize = self.message_queue.maxsize
        return f"Queue: {queue_size}/{queue_maxsize} ({(queue_size/queue_maxsize)*100:.1f}% full)"

    def _print_progress_summary(self, all_files: Dict[str, List[str]], force_full_stats: bool = False):
        """打印处理进度摘要"""
        total_files = len(all_files)
        completed_files = sum(1 for state in self.state.values() if state.completed)
        total_blocks = sum(len(state.block_files) for state in self.state.values())
        processed_blocks = sum(state.processed_blocks for state in self.state.values())

        self.logger.info("\n=== Progress Summary ===")
        self.logger.info(f"Files: {completed_files}/{total_files} completed")
        self.logger.info(f"Blocks: {processed_blocks}/{total_blocks} ({(processed_blocks/total_blocks)*100:.1f}% complete)")
        self.logger.info(f"Processing rate: {self._get_processing_rate()}")

        if self.parallel_config.enabled:
            self.logger.info(f"Active workers: {self.executor._work_queue.qsize()}/{self.parallel_config.max_workers}")
            self.logger.info(self._get_queue_status())

        # 如果强制输出完整统计，则调用完整统计方法
        if force_full_stats:
            self._print_processing_statistics(all_files)

    def _print_processing_statistics(self, all_files):
        """打印处理统计信息"""
        encoding = tiktoken.get_encoding("cl100k_base")

        # 计算所有消息的token数
        total_prompt_tokens = 0
        total_completion_tokens = 0
        total_cost = 0

        # 获取当前使用的模型
        model_name = getattr(self.chat_session, 'bot_name', 'gpt-4o-mini').lower()

        # 找到匹配的价格配置
        price_config = None
        for model_key, config in self.price_config.items():
            if model_key in model_name:
                price_config = config
                break

        if not price_config:
            price_config = self.price_config["gpt-4o-mini"]

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
    @retry_on_exception(max_retries=10, retry_interval=2.0)
    def process_all(self):
        """处理所有文件"""
        all_files = self.get_all_files()
        self.logger.info(f"Found {len(all_files)} files to process")

        try:
            # 初始化新文件的状态
            self._initialize_files_state(all_files)

            if self.parallel_config.enabled:
                self._process_all_parallel(all_files)
            else:
                self._process_all_sequential(all_files)

        except Exception as e:
            self.logger.error(f"Processing interrupted: {e}")
            self.save_state()
            if not self.dry_run:
                self.chat_session.update_connection()
            raise

        finally:
            self._print_processing_statistics(all_files)

    def _initialize_files_state(self, all_files):
        """初始化文件处理状态"""
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
                    self._initialize_cypher_file(original_file, cypher_file)

    def _initialize_cypher_file(self, original_file: str, cypher_file: str):
        """初始化cypher文件"""
        with open(cypher_file, 'w', encoding='utf-8') as f:
            f.write(f"// Cypher statements for {original_file}\n")
            f.write(f"// Generated at {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write("// Source: Knowledge Graph Generation from Medical Literature\n")
            f.write("// Each statement ends with a semicolon\n\n")

    def _process_all_sequential(self, all_files):
        """顺序处理所有文件"""
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
                        # with self.save_lock:
                        self.save_state()
                        self.save_responses(original_file)

            state.completed = True
            # with self.save_lock:
            self.save_state()
            self.save_responses(original_file)

    def _process_all_parallel(self, all_files):
        """并行处理所有文件"""
        try:
            # 准备并行处理环境
            self.prepare_parallel_processing()

            # 提交所有任务到队列
            for original_file, state in self.state.items():
                if state.completed:
                    self.logger.info(f"Skipping completed file: {original_file}")
                    continue

                self.logger.info(f"Queueing {original_file} for processing")

                for i in range(state.processed_blocks, len(state.block_files)):
                    block_path = state.block_files[i]
                    self.message_queue.put((original_file, block_path))

            # 等待所有任务完成
            self.message_queue.join()

        finally:
            # 标记所有文件为完成
            # with self.state_lock:
            for state in self.state.values():
                if state.processed_blocks == len(state.block_files):
                    state.completed = True
                    # self.save_responses(state.file_name)
            # with self.save_lock:
            self.save_state()
            # 清理并行处理资源
            for state in self.state.values():
                # if state.processed_blocks == len(state.block_files):
                self.save_responses(state.file_name)
            self.cleanup_parallel_processing()

    # 保存单个文件的结果, 互不冲突, 不用锁
    def save_responses(self, file_name: str):
        """保存单个文件的所有响应，支持JSON和TOML格式"""
        self.logger.info(f"Saving responses of {file_name}")
        # with self.save_lock:  # 使用锁确保并发安全
        state_copy = self.state.copy()
        state = state_copy[file_name]
        # state = self.state[file_name]
        if not state.message_pairs:
            return

        base_path = self.input_dir / file_name

        # 保存JSON格式
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

        self.logger.info(f"Savd responses of {file_name}")

# %%
if __name__ == "__main__":
    DRY_RUN = False
    ENABLE_PARALLEL = True

    # 配置并行处理参数
    parallel_config = ParallelConfig(
        enabled=ENABLE_PARALLEL,
        max_workers=20,
        queue_size=40,
        batch_size=40
    ) if ENABLE_PARALLEL else None

    if not DRY_RUN:
        session = OpenAIChatSession(openai_chat.client1, logger_name=LOGGER_NAME)
        preprocess_session = OpenAIChatSession(openai_chat.client2, logger_name=LOGGER_NAME)

        """         
        session = QianfanChatSession()
        preprocess_session = session 
        """
        pass
        """
        preprocess_bot_name = "gpt4_o_mini"
        bot_name = "gpt4_o_mini"
        chat_manager = PoeChatManager(tokens={}, log_level=logging.INFO, dry_run=False)

        preprocess_session = chat_manager.create_session(bot_name=preprocess_bot_name, initial_message=PREPROCESS_INIT_MSG)
        # preprocess_session = chat_manager.get_session(bot_name=bot_name, chat_code='2y405esrum7wlw8cria')

        session = chat_manager.create_session(bot_name=bot_name, initial_message=INIT_MSG)
        # session = chat_manager.get_session(bot_name=bot_name, chat_code='2y406tqjs31ldhr5zzs')
        # session.send_message(INSTRUCT_MSG)
        """
        pass

        """
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
        
        """


    processor = BatchProcessor(
        input_dir="dataset",
        preprocess_session=DummyChatSession() if DRY_RUN else preprocess_session,
        chat_session=DummyChatSession() if DRY_RUN else session,
        save_interval=5,
        parallel_config=parallel_config
    )

    try:
        # 执行处理,遇到异常会自动重试
        processor.process_all()
    except Exception as e:
        logging.error(f"处理最终失败: {str(e)}")

# %%