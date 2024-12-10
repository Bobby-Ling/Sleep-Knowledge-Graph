# %%
import os
import unittest
import shutil
import tempfile
import json
import time
import random
from pathlib import Path
from typing import Optional
from process import BatchProcessor

class MockChatManager:
    """模拟聊天管理器，可以模拟各种情况"""
    def __init__(self,
                 failure_rate: float = 0.1,    # 随机失败概率
                 network_delay: float = 0.5,    # 模拟网络延迟
                 quota_limit: int = 50,         # 配额限制
                 unstable_after: int = 30):     # n次请求后变得不稳定
        self.failure_rate = failure_rate
        self.network_delay = network_delay
        self.quota_limit = quota_limit
        self.unstable_after = unstable_after
        self.call_count = 0
        self.quota_used = 0

    def send_message(self, message: str) -> str:
        self.call_count += 1
        self.quota_used += 1

        # 模拟网络延迟
        time.sleep(self.network_delay)

        # 模拟配额用尽
        if self.quota_used > self.quota_limit:
            raise Exception("Quota exceeded")

        # 模拟系统不稳定
        if self.call_count > self.unstable_after:
            if random.random() < self.failure_rate * 2:
                raise Exception("System unstable")

        # 模拟随机失败
        if random.random() < self.failure_rate:
            raise Exception("Random failure")

        return f"Response for message (length={len(message)}): {message[:50]}..."

def create_test_files(base_dir: Path):
    """创建测试用的markdown文件和分块"""
    # 创建原始文件
    files = [
        "test1.md",
        "test2.md",
        "test3.md"
    ]

    for file in files:
        # 创建原始文件
        with open(base_dir / file, 'w', encoding='utf-8') as f:
            f.write(f"Original content of {file}")

        # 创建分块目录
        dir_name = file[:-3]  # 移除.md
        block_dir = base_dir / dir_name
        block_dir.mkdir(exist_ok=True)

        # 创建分块文件
        for i in range(1, 11):  # 每个文件10个块
            block_file = block_dir / f"{i:03d}-section-{i}.md"
            with open(block_file, 'w', encoding='utf-8') as f:
                f.write(f"Content of block {i} for {file}\n" * 5)

class TestBatchProcessor(unittest.TestCase):
    def setUp(self):
        """测试前创建临时目录和文件"""
        if not os.path.exists('tmp'):
            os.makedirs('tmp')
        self.test_dir = Path('tmp')
        create_test_files(self.test_dir)

    def tearDown(self):
        """测试后清理临时文件"""
        print(self.test_dir)
        # shutil.rmtree(self.test_dir)

    def test_normal_processing(self):
        """测试正常处理流程"""
        chat_manager = MockChatManager(
            failure_rate=0.0,
            network_delay=0.1,
            quota_limit=1000
        )

        processor = BatchProcessor(
            input_dir=str(self.test_dir),
            chat_session=chat_manager,
            save_interval=3
        )

        # 测试 dry run
        processor.process_all(dry_run=True)

        # 检查是否创建了状态文件
        self.assertTrue(Path(processor.state_file).exists())

        # 测试实际处理
        processor.process_all()

        # 检查是否所有文件都处理完成
        for file in processor.state.values():
            self.assertTrue(file.completed)
            self.assertEqual(file.processed_blocks, 10)  # 每个文件10个块
            self.assertEqual(len(file.responses), 10)

    def test_interrupted_processing(self):
        """测试中断后继续处理"""
        # 首先处理一部分
        chat_manager1 = MockChatManager(
            failure_rate=0.0,
            network_delay=0.1,
            quota_limit=15  # 只能处理15个块就会中断
        )

        processor1 = BatchProcessor(
            input_dir=str(self.test_dir),
            chat_session=chat_manager1,
            save_interval=3
        )

        try:
            processor1.process_all()
        except Exception as e:
            print(f"Expected interruption: {e}")

        # 检查是否保存了状态
        self.assertTrue(Path(processor1.state_file).exists())

        # 创建新的处理器继续处理
        chat_manager2 = MockChatManager(
            failure_rate=0.0,
            network_delay=0.1,
            quota_limit=1000
        )

        processor2 = BatchProcessor(
            input_dir=str(self.test_dir),
            chat_session=chat_manager2,
            save_interval=3
        )

        # 继续处理
        processor2.process_all()

        # 检查是否所有文件都处理完成
        for file in processor2.state.values():
            self.assertTrue(file.completed)

    def test_unstable_processing(self):
        """测试不稳定的处理情况"""
        chat_manager = MockChatManager(
            failure_rate=0.2,
            network_delay=0.1,
            quota_limit=1000,
            unstable_after=20
        )

        processor = BatchProcessor(
            input_dir=str(self.test_dir),
            chat_session=chat_manager,
            save_interval=2,
            retry_times=3,
            retry_delay=1
        )

        try:
            processor.process_all()
        except Exception as e:
            print(f"Processing failed as expected: {e}")

        # 检查是否有部分处理结果
        self.assertTrue(Path(processor.state_file).exists())

        # 检查日志文件
        self.assertTrue(Path("processing.log").exists())

    def test_result_saving(self):
        """测试结果保存功能"""
        chat_manager = MockChatManager(
            failure_rate=0.0,
            network_delay=0.1,
            quota_limit=1000
        )

        processor = BatchProcessor(
            input_dir=str(self.test_dir),
            chat_session=chat_manager,
            save_interval=3
        )

        processor.process_all()

        # 检查每个文件是否都有对应的响应文件
        for original_file in processor.state:
            response_file = self.test_dir / f"{original_file}.responses.json"
            self.assertTrue(response_file.exists())

            # 检查响应内容
            with open(response_file, 'r', encoding='utf-8') as f:
                responses = json.load(f)
                self.assertEqual(len(responses), 10)  # 每个文件应该有10个响应

# %%
def run_tests():
    """运行所有测试"""
    unittest.main(argv=[''], verbosity=2)

# %%
if __name__ == "__main__":
    run_tests()
# %%