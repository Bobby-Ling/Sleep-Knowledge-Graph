# %%
from toolz import pipe, curry
import os
import re
import jieba
import tiktoken
from dataclasses import dataclass
from typing import Dict, List, Tuple
from pathlib import Path

from prompts_template import API_COMMAND_MSG, API_PAYLOAD_TEMPLATE

# 常量定义
MAX_TOKEN = 16384  # gpt-4o-mini的最大token限制
RESERVE_TOKEN = 3000  # 预留token数

@dataclass
class TokenCost:
    model: str
    input_price: float
    output_price: float

@dataclass
class TextBlock:
    title: str
    content: str
    tokens: int
    level: int  # 标题层级

@dataclass
class FileStats:
    path: str
    content: str
    size: int
    basic_count: int
    with_punct_count: int
    cn_split_count: int
    cn_only_count: int
    en_only_count: int
    tokens: int
    estimated_cost: float
    blocks: List[TextBlock]

MODEL_COSTS = {
    # $0.150 / 1M input tokens
    # $0.600 / 1M output tokens
    'gpt-4o-mini': TokenCost('gpt-4o-mini', 0.15, 0.6),
}

@curry
def read_file(file_path: str) -> Tuple[str, str]:
    with open(file_path, 'r', encoding='utf-8') as f:
        return (file_path, f.read())

@curry
def convert_to_half_width(file_content: Tuple[str, str]) -> Tuple[str, str]:
    path, content = file_content
    import unicodedata
    return (path, unicodedata.normalize('NFKC', content))

@curry
def remove_links(file_content: Tuple[str, str]) -> Tuple[str, str]:
    """移除markdown文档中的链接"""
    path, content = file_content
    # 移除 [文本](链接) 格式的链接，保留文本
    content = re.sub(r'\[([^\]]+)\]\([^\)]+\)', r'\1', content)
    # 移除 <链接> 格式的链接
    content = re.sub(r'<(https?:\/\/[^>]+)>', '', content)
    # 移除裸露的 URL
    content = re.sub(r'https?:\/\/\S+', '', content)
    # 移除可能残留的空行
    content = re.sub(r'\n\s*\n\s*\n', '\n\n', content)
    return (path, content)

@curry
def remove_references(file_content: Tuple[str, str]) -> Tuple[str, str]:
    path, content = file_content
    pattern = r'# 参考文献[\s\S]*?(?=\n#|$)'
    return (path, re.sub(pattern, '', content))

def estimate_tokens(text: str) -> int:
    """使用tiktoken准确计算token数量"""
    encoding = tiktoken.encoding_for_model("gpt-4")  # gpt-4o-mini使用与gpt-4相同的分词器
    return len(encoding.encode(text))

@curry
def analyze_stats(file_content: Tuple[str, str]) -> FileStats:
    path, content = file_content

    clean_content = re.sub(r'[^\w\s]', '', content)
    basic_count = len(clean_content.split()) + len(re.findall(r'[\u4e00-\u9fff]', clean_content))

    with_punct_count = len(content.split()) + len(re.findall(r'[\u4e00-\u9fff]', content))

    words = list(jieba.cut(content))
    cn_split_count = len([w for w in words if w.strip()])

    cn_content = re.sub(r'[^\u4e00-\u9fff]', '', content)
    cn_only_count = len(cn_content)

    en_content = re.sub(r'[^a-zA-Z\s]', '', content)
    en_only_count = len(en_content.split())

    tokens = estimate_tokens(content)
    cost = (tokens / 1000000) * MODEL_COSTS['gpt-4o-mini'].input_price

    return FileStats(
        path=path,
        content=content,
        size=os.path.getsize(path),
        basic_count=basic_count,
        with_punct_count=with_punct_count,
        cn_split_count=cn_split_count,
        cn_only_count=cn_only_count,
        en_only_count=en_only_count,
        tokens=tokens,
        estimated_cost=cost,
        blocks=[]
    )

@curry
def split_into_blocks(max_tokens: int, file_stats: FileStats) -> FileStats:
    """将文档按标题分块，只有当累计token超过限制时才分块"""
    content = file_stats.content
    blocks = []

    # 按标题分割文本
    sections = re.split(r'(^#{1,6}\s+.+$)', content, flags=re.MULTILINE)

    current_block = []
    current_title = "开始"
    current_level = 0
    current_tokens = 0

    def save_current_block():
        if current_block:
            block_content = '\n'.join(current_block)
            block_tokens = estimate_tokens(block_content)
            blocks.append(TextBlock(
                title=current_title,
                content=block_content,
                tokens=block_tokens,
                level=current_level
            ))

    i = 0
    while i < len(sections):
        section = sections[i].strip()
        if not section:
            i += 1
            continue

        # 检查是否是标题
        title_match = re.match(r'^(#{1,6})\s+(.+)$', section)

        if title_match:
            level = len(title_match.group(1))
            title = title_match.group(2).strip()

            # 获取标题后的内容（如果存在）
            content_section = sections[i + 1].strip() if i + 1 < len(sections) else ""

            # 计算这个部分的token
            section_tokens = estimate_tokens(section + "\n" + content_section)

            # 如果当前累积的token加上新section会超过限制，保存当前块
            if current_tokens + section_tokens > MAX_TOKEN - RESERVE_TOKEN:
                save_current_block()
                current_block = []
                current_tokens = 0

            # 添加新的section
            if current_block:
                current_block.extend([section, content_section])
            else:
                current_title = title
                current_level = level
                current_block = [section, content_section]
            current_tokens += section_tokens

            i += 2  # 跳过内容部分
        else:
            # 处理无标题的内容
            section_tokens = estimate_tokens(section)
            if current_tokens + section_tokens > MAX_TOKEN - RESERVE_TOKEN:
                save_current_block()
                current_block = []
                current_tokens = 0

            current_block.append(section)
            current_tokens += section_tokens
            i += 1

    # 保存最后一个块
    save_current_block()

    # 如果总token数小于MAX_TOKEN-RESERVE_TOKEN，合并所有块
    total_tokens = sum(block.tokens for block in blocks)
    if total_tokens <= MAX_TOKEN - RESERVE_TOKEN:
        combined_content = '\n'.join(block.content for block in blocks)
        blocks = [TextBlock(
            title="完整文档",
            content=combined_content,
            tokens=total_tokens,
            level=0
        )]

    file_stats.blocks = blocks
    return file_stats

@curry
def write_blocks(output_dir: str, file_stats: FileStats) -> FileStats:
    """将分块后的内容写入单独的文件"""
    base_name = os.path.splitext(os.path.basename(file_stats.path))[0]
    block_dir = os.path.join(output_dir, base_name)
    os.makedirs(block_dir, exist_ok=True)

    for i, block in enumerate(file_stats.blocks):
        # 创建规范的文件名
        safe_title = re.sub(r'[^\w\s-]', '', block.title)
        safe_title = re.sub(r'[-\s]+', '-', safe_title).strip('-')
        filename = f"{i+1:03d}-{safe_title[:50]}.md"

        output_path = os.path.join(block_dir, filename)
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(block.content)

    return file_stats

@curry
def write_file(output_path: str, stats: FileStats) -> FileStats:
    """写入处理后的文件并返回统计信息"""
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(stats.content)
    return stats

def format_size(size: int) -> str:
    units = ['B', 'KB', 'MB', 'GB']
    size_float = float(size)
    unit_index = 0
    while size_float >= 1024 and unit_index < len(units) - 1:
        size_float /= 1024
        unit_index += 1
    return f"{size_float:.2f} {units[unit_index]}"

def print_block_stats(stats_list: List[FileStats]):
    """打印分块统计信息"""
    print("\n=== 文档分块统计 ===")
    total_blocks = 0

    for stat in stats_list:
        base_name = os.path.basename(stat.path)
        print(f"\n文件: {base_name}")
        print(f"总块数: {len(stat.blocks)}")
        print("块详情:")

        for i, block in enumerate(stat.blocks, 1):
            print(f"  {i}. {block.title[:50]}... ({block.tokens} tokens, 层级 {block.level})")

        total_blocks += len(stat.blocks)

    print(f"\n总计块数: {total_blocks}")

def print_stats(stats_list: List[FileStats]):
    total_size = sum(stat.size for stat in stats_list)
    total_basic = sum(stat.basic_count for stat in stats_list)
    total_with_punct = sum(stat.with_punct_count for stat in stats_list)
    total_cn_split = sum(stat.cn_split_count for stat in stats_list)
    total_cn_only = sum(stat.cn_only_count for stat in stats_list)
    total_en_only = sum(stat.en_only_count for stat in stats_list)
    total_tokens = sum(stat.tokens for stat in stats_list)
    total_cost = sum(stat.estimated_cost for stat in stats_list)

    print("\n"
        f"{'Size':<10}"
        f"{'Basic':<7}"
        f"{'Punct':<7}"
        f"{'Split':<7}"
        f"{'CN':<7}"
        f"{'EN':<7}"
        f"{'Tokens':<7}"
        f"{'Cost($)':<7}"
        f"{'File':<7}"
        )
    print("-" * 100)

    for stat in stats_list:
        print(
            f"{format_size(stat.size):<10}"
            f"{stat.basic_count:<7}"
            f"{stat.with_punct_count:<7}"
            f"{stat.cn_split_count:<7}"
            f"{stat.cn_only_count:<7}"
            f"{stat.en_only_count:<7}"
            f"{stat.tokens:<7}"
            f"{stat.estimated_cost:.4f}\t"
            f"{os.path.basename(stat.path)}"
        )

    print("-" * 100)
    print(
        f"Total: {format_size(total_size)}, "
        f"Tokens: {total_tokens}, "
        f"Estimated cost: ${total_cost:.4f}"
    )

    print("\nEstimated costs for different models (input only):")
    for model_name, cost_info in MODEL_COSTS.items():
        model_cost = (total_tokens / 1000000) * cost_info.input_price
        print(f"{model_name}: ${model_cost:.4f}")

def process_directory(input_dir: str, output_dir: str) -> List[FileStats]:
    stats_list = []

    for root, _, files in os.walk(input_dir):
        for file in files:
            if file.endswith('.md'):
                input_path = os.path.join(root, file)
                relative_path = os.path.relpath(root, input_dir)
                output_path = os.path.join(output_dir, relative_path, file)

                stats = pipe(
                    input_path,
                    read_file,
                    convert_to_half_width,
                    remove_references,
                    remove_links,
                    analyze_stats,
                    split_into_blocks(MAX_TOKEN),
                    write_file(output_path),
                    write_blocks(output_dir)
                )
                stats_list.append(stats)

    return stats_list

# %%
if __name__ == '__main__':
    input_directory = "dataset-origin"
    output_directory = "dataset"
    stats_list = process_directory(input_directory, output_directory)
    print_stats(stats_list)
    print_block_stats(stats_list)