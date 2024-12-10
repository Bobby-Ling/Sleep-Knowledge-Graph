import logging
import os
from datetime import datetime

class WorkerClass:
    """模拟一个工作类，使用从外部获取的logger"""
    def __init__(self, name):
        self.name = name
        # 获取与LoggingDemo相同的logger
        self.logger = logging.getLogger(__name__)

    def do_work(self):
        """模拟工作过程"""
        self.logger.debug(f'[{self.name}] 开始工作')
        self.logger.info(f'[{self.name}] 正在处理任务')
        try:
            # 模拟出错
            if self.name == "worker2":
                raise ValueError("模拟的错误")
            self.logger.debug(f'[{self.name}] 任务处理细节')
        except Exception as e:
            self.logger.exception(f'[{self.name}] 工作过程中出现错误')
        self.logger.info(f'[{self.name}] 工作完成')

class LoggingDemo:
    def __init__(self, log_level=logging.DEBUG):
        self.logger = logging.getLogger(__name__)
        self.setup_logging(log_level)

    def setup_logging(self, log_level, log_format='%(asctime)s - %(levelname)s - %(message)s'):
        """设置日志记录"""
        if not os.path.exists('logs'):
            os.makedirs('logs')

        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        log_file = f'logs/demo_{timestamp}.log'

        # 设置logger的基础级别
        self.logger.setLevel(log_level)

        # 创建控制台处理器
        console_handler = logging.StreamHandler()
        console_handler.setLevel(logging.INFO)

        # 创建文件处理器
        file_handler = logging.FileHandler(log_file, encoding='utf-8')
        file_handler.setLevel(logging.DEBUG)

        # 创建格式化器
        formatter = logging.Formatter(log_format)
        console_handler.setFormatter(formatter)
        file_handler.setFormatter(formatter)

        # 检查是否已经添加了处理器，避免重复添加
        if not self.logger.handlers:
            self.logger.addHandler(console_handler)
            self.logger.addHandler(file_handler)

    def create_worker(self, name) -> WorkerClass:
        """创建并返回一个WorkerClass实例"""
        self.logger.debug(f'创建新的worker: {name}')
        return WorkerClass(name)

    def test_worker_logging(self):
        """测试通过不同worker实例的日志记录"""
        workers = [
            self.create_worker(f"worker{i}")
            for i in range(3)
        ]

        self.logger.info("开始测试多个worker的日志记录")

        for worker in workers:
            self.logger.debug(f"调用 {worker.name}")
            worker.do_work()

        self.logger.info("worker测试完成")

def test_independent_worker():
    """测试独立创建的worker"""
    # 直接创建worker，不通过LoggingDemo
    worker = WorkerClass("independent_worker")
    # 这种情况下的日志将无法正确记录，因为没有配置logger
    worker.do_work()

if __name__ == '__main__':
    print("=== 测试场景1: 通过LoggingDemo创建的worker ===")
    demo = LoggingDemo()
    demo.test_worker_logging()

    print("\n=== 测试场景2: 独立创建的worker ===")
    test_independent_worker()

    print("\n=== 测试场景3: 在现有logger配置下创建新的worker ===")
    new_worker = WorkerClass("late_worker")
    new_worker.do_work()