import os
import re
import jieba
from pathlib import Path
from dataclasses import dataclass
from typing import Dict, List

@dataclass
class FileStats:
    path: str
    size: int
    basic_count: int
    with_punct_count: int
    cn_split_count: int
    cn_only_count: int
    en_only_count: int

class MarkdownStats:
    def __init__(self, directory='.'):
        self.directory = directory
        self.stats: Dict[str, FileStats] = {}

    def get_markdown_files(self) -> List[str]:
        """获取所有markdown文件路径"""
        return [str(path) for path in Path(self.directory).rglob('*.md')]

    def analyze_file(self, file_path: str) -> FileStats:
        """分析单个文件的所有统计数据"""
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()

            # 基础统计(不含标点)
            clean_content = re.sub(r'[^\w\s]', '', content)
            basic_count = len(clean_content.split()) + len(re.findall(r'[\u4e00-\u9fff]', clean_content))

            # 包含标点统计
            with_punct_count = len(content.split()) + len(re.findall(r'[\u4e00-\u9fff]', content))

            # 中文分词统计
            words = list(jieba.cut(content))
            cn_split_count = len([w for w in words if w.strip()])

            # 仅中文统计
            cn_content = re.sub(r'[^\u4e00-\u9fff]', '', content)
            cn_only_count = len(cn_content)

            # 仅英文统计
            en_content = re.sub(r'[^a-zA-Z\s]', '', content)
            en_only_count = len(en_content.split())

            return FileStats(
                path=file_path,
                size=os.path.getsize(file_path),
                basic_count=basic_count,
                with_punct_count=with_punct_count,
                cn_split_count=cn_split_count,
                cn_only_count=cn_only_count,
                en_only_count=en_only_count
            )

    def analyze_all(self):
        """分析所有markdown文件"""
        for file_path in self.get_markdown_files():
            self.stats[file_path] = self.analyze_file(file_path)

def format_size(size: int) -> str:
    """格式化文件大小"""
    units = ['B', 'KB', 'MB', 'GB']
    size_float = float(size)
    unit_index = 0

    while size_float >= 1024 and unit_index < len(units) - 1:
        size_float /= 1024
        unit_index += 1

    return f"{size_float:.2f} {units[unit_index]}"

def print_stats(stats: Dict[str, FileStats]):
    """打印统计结果"""
    # 计算总计
    total_size = sum(stat.size for stat in stats.values())
    total_basic = sum(stat.basic_count for stat in stats.values())
    total_with_punct = sum(stat.with_punct_count for stat in stats.values())
    total_cn_split = sum(stat.cn_split_count for stat in stats.values())
    total_cn_only = sum(stat.cn_only_count for stat in stats.values())
    total_en_only = sum(stat.en_only_count for stat in stats.values())

    # 打印表头
    # print("\nSize\t\tBasic\t\tWith Punct\tCN Split\tCN Only\t\tEN Only\t\tFile")
    print("\n"
        f"{'Size':<10}\t"
        f"{'Basic':<10}\t"
        f"{'With Punct':<10}\t"
        f"{'CN Split':<10}\t"
        f"{'CN Only':<10}\t"
        f"{'EN Only':<10}"
        f"{'File':<40}\t"
        )
    print("-" * 100)

    # 打印每个文件的统计
    for file_path, stat in stats.items():
        print(""
              f"{format_size(stat.size):<10}\t"
              f"{stat.basic_count:<10}\t"
              f"{stat.with_punct_count:<10}\t"
              f"{stat.cn_split_count:<10}\t"
              f"{stat.cn_only_count:<10}\t"
              f"{stat.en_only_count:<10}"
              f"{os.path.basename(file_path):<40}\t"
              )

    # 打印总计
    print("-" * 100)
    print(f"Total\t\t\t\t"
          f"{format_size(total_size):<10}\t"
          f"{total_basic:<10}\t"
          f"{total_with_punct:<10}\t"
          f"{total_cn_split:<10}\t"
          f"{total_cn_only:<10}\t"
          f"{total_en_only:<10}")

if __name__ == '__main__':
    stats = MarkdownStats(directory='dataset')
    stats.analyze_all()
    print_stats(stats.stats)