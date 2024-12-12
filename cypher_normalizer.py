# %%
import os
import tomli
import tomli_w
from pathlib import Path
from dataclasses import dataclass, asdict
from typing import Iterator, List, Optional
import logging
from tqdm import tqdm

from cypher_transform import transform_cypher_block

@dataclass
class MessagePair:
    timestamp: str
    message: str
    response: str

@dataclass
class Metadata:
    file_name: str
    processed_at: str
    total_pairs: int

@dataclass
class TomlData:
    metadata: Metadata
    message_pairs: List[MessagePair]

class CypherTomlIterator:
    def __init__(self, dataset_dir: str):
        self.dataset_dir = Path(dataset_dir)
        self.files = list(self.dataset_dir.glob("*.toml"))
        self.current = 0

    def __iter__(self):
        return self

    def __next__(self):
        if self.current >= len(self.files):
            raise StopIteration

        toml_path = self.files[self.current]
        self.current += 1

        with open(toml_path, "rb") as f:
            data = tomli.load(f)

        metadata = Metadata(**data["metadata"])
        pairs = [MessagePair(**pair) for pair in data["message_pairs"]]
        return TomlData(metadata, pairs)

class CypherTomlResponseIterator:
    """包装CypherTomlIterator，每次返回一个response"""

    def __init__(self, dataset_dir: str, toml_iterator: CypherTomlIterator = None):
        self.toml_iterator = toml_iterator or CypherTomlIterator(dataset_dir)
        self.current_data: TomlData | None = None
        self.current_pair = 0

    def __iter__(self):
        return self

    def __next__(self) -> str:
        # 如果当前TomlData不存在或已处理完所有pairs
        while self.current_data is None or self.current_pair >= len(self.current_data.message_pairs):
            # 获取下一个TomlData
            self.current_data = next(self.toml_iterator)
            self.current_pair = 0

        # 获取当前response并移动到下一个pair
        response = self.current_data.message_pairs[self.current_pair].response
        self.current_pair += 1

        return response

    def __len__(self) -> int:
        """计算所有response的总数"""
        total = 0
        for toml_data in CypherTomlIterator(self.toml_iterator.dataset_dir):
            total += len(toml_data.message_pairs)
        return total

def setup_logging(log_level=logging.INFO, log_file=None):
    """配置日志系统"""
    log_format = '%(asctime)s - %(levelname)s - %(message)s'

    if log_file:
        logging.basicConfig(
            level=log_level,
            format=log_format,
            handlers=[
                logging.FileHandler(log_file),
                logging.StreamHandler()
            ]
        )
    else:
        logging.basicConfig(
            level=log_level,
            format=log_format
        )

def cypher_normalize(dataset_dir: str, transform_fn, cypher_output_dir: str, toml_output_dir: str,
                    log_level=logging.INFO, log_file=None):
    # 设置日志
    setup_logging(log_level, log_file)

    # 创建输出目录
    os.makedirs(cypher_output_dir, exist_ok=True)
    os.makedirs(toml_output_dir, exist_ok=True)
    logging.info(f"Processing files from {dataset_dir}")
    logging.info(f"Outputting Cypher to {cypher_output_dir}")
    logging.info(f"Outputting TOML to {toml_output_dir}")

    iterator = CypherTomlIterator(dataset_dir)
    total_files = len(iterator.files)

    # 主进度条 - 文件级
    with tqdm(total=total_files, desc="Processing files") as file_pbar:
        for toml_data in iterator:
            logging.debug(f"Processing file: {toml_data.metadata.file_name}")
            cypher_path = Path(cypher_output_dir) / f"{toml_data.metadata.file_name}.cypher"
            toml_path = Path(toml_output_dir) / f"{toml_data.metadata.file_name}.toml"

            # 创建新的消息对列表用于TOML输出
            transformed_pairs = []

            with open(cypher_path, "w", encoding="utf-8") as f:
                # 写入文件元数据
                f.write(f"// File: {toml_data.metadata.file_name}\n")
                f.write(f"// Processed at: {toml_data.metadata.processed_at}\n")
                f.write(f"// Total pairs: {toml_data.metadata.total_pairs}\n\n")

                # 处理每个消息对，使用嵌套进度条
                for i, pair in enumerate(tqdm(toml_data.message_pairs,
                                           desc=f"Processing responses in {toml_data.metadata.file_name}",
                                           leave=False), 1):
                    f.write(f"/* Response #{i}\n")
                    f.write(f"   Timestamp: {pair.timestamp}\n*/\n")

                    try:
                        # 转换响应
                        transformed = transform_fn(pair.response)
                        # 写入Cypher文件
                        f.write(transformed)

                        # 创建转换后的消息对
                        transformed_pair = MessagePair(
                            timestamp=pair.timestamp,
                            message=pair.message,
                            response=transformed
                        )
                        transformed_pairs.append(transformed_pair)

                        logging.debug(f"Successfully transformed response #{i}")
                    except Exception as e:
                        logging.error(f"Error transforming response #{i} in {toml_data.metadata.file_name}: {str(e)}")
                        raise

                    f.write("\n\n// =====================================\n\n")

            # 写入TOML文件
            toml_output = {
                "metadata": asdict(toml_data.metadata),
                "message_pairs": [asdict(pair) for pair in transformed_pairs]
            }

            with open(toml_path, "wb") as f:
                tomli_w.dump(toml_output, f, multiline_strings=True)

            file_pbar.update(1)
            logging.info(f"Completed processing {toml_data.metadata.file_name}")

# %%
if __name__ == "__main__":
    cypher_normalize(
        dataset_dir='dataset',
        transform_fn=transform_cypher_block,
        cypher_output_dir='cypher_parsed/cypher',
        toml_output_dir='cypher_parsed/toml',
        log_level=logging.INFO,
        log_file='cypher_normalizer.log'
    )
# %%