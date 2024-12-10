# %%
# from magic_pdf.data.read_api import *
# dataset_path = '/mnt/c/Users/bobby/DATA/文档/项目/知识图谱/算法专项赛-睡眠知识图谱'
# datasets = read_local_pdfs(dataset_path)

# %%

import os
import subprocess
import argparse
import logging
from concurrent.futures import ThreadPoolExecutor
from datetime import datetime

# 配置常量
MAX_WORKERS = 1
LOG_FORMAT = '%(asctime)s - %(levelname)s - %(message)s'
DATASET_PATH = '/mnt/c/Users/bobby/DATA/文档/项目/知识图谱/算法专项赛-睡眠知识图谱'

class CommandRunner:
    def __init__(self, dry_run=False, log_level=logging.DEBUG):
        self.dry_run = dry_run
        self.setup_logging(log_level)

    def setup_logging(self, log_level):
        """设置日志记录"""
        if not os.path.exists('logs'):
            os.makedirs('logs')
        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        log_file = f'logs/command_execution_{timestamp}.log'
        logging.basicConfig(
            level=log_level,
            format=LOG_FORMAT,
            handlers=[
                logging.FileHandler(log_file),
                logging.StreamHandler()  # 同时输出到控制台
            ]
        )
        logging.info(f"log_level: {log_level}")

    def run_commands(self, file):
        logging.info(f"Processing file: {file}")
        commands = [
            ['magic-pdf', '-p', f'{file}', '-o', './output'],
        ]

        for cmd in commands:
            cmd_str = ' '.join(cmd)
            if self.dry_run:
                logging.info(f"[DRY RUN] Would execute: {cmd_str}")
                continue

            try:
                logging.info(f"Executing: {cmd_str}")
                result = subprocess.run(
                    cmd,
                    check=True,
                    capture_output=True,
                    text=True
                )
                logging.debug(f"Command output of {cmd_str}:\n{result.stdout}")
                if result.stderr:
                    logging.warning(f"Command stderr: {result.stderr}")
            except subprocess.CalledProcessError as e:
                logging.error(f"Error running {cmd_str}: {e}")
                logging.error(f"Error output: {e.stderr}")
            except Exception as e:
                logging.error(f"Unexpected error running {cmd_str}: {e}")

    def process(self, dir_path):
        try:
            # 列出目录中的所有文件（包含路径）
            files = [os.path.join(dir_path, file) for file in os.listdir(dir_path) if os.path.isfile(os.path.join(dir_path, file))]

            # 使用线程池并行处理文件
            with ThreadPoolExecutor(max_workers=MAX_WORKERS) as executor:
                # 提交任务并等待完成
                futures = {executor.submit(self.run_commands, file): file for file in files}
                for future in futures:
                    try:
                        # 等待任务完成
                        future.result()
                    except Exception as e:
                        logging.error(f"Error processing file {futures[future]}: {e}", exc_info=True)

        except Exception as e:
            logging.error(f"An error occurred while processing directory: {e}", exc_info=True)

# main 函数保持不变
def main():
    global TRACE_FILE_SUFFIX, MAX_WORKERS
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--dry-run',
        action='store_true',
        help='Show commands that would be executed without actually running them'
    )
    parser.add_argument(
        '--workers',
        type=int,
        default=MAX_WORKERS,
        help=f'Number of parallel workers (default: {MAX_WORKERS})'
    )
    parser.add_argument(
        '--log-level',
        default='INFO',
        choices=['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL'],
        help='Set the logging level (default: INFO)'
    )
    args = parser.parse_args()

    MAX_WORKERS = args.workers
    runner = CommandRunner(dry_run=args.dry_run, log_level=args.log_level)
    runner.process(DATASET_PATH)

if __name__ == "__main__":
    main()
