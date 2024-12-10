import os
import zipfile

def zip_markdown_files(search_dir='.', output_zip='markdown_files.zip'):
    # 创建一个新的zip文件
    with zipfile.ZipFile(output_zip, 'w', zipfile.ZIP_DEFLATED) as zipf:
        # 遍历目录
        for root, dirs, files in os.walk(search_dir):
            # 筛选.md文件
            for file in files:
                if file.lower().endswith('.md'):
                    # 获取文件的完整路径
                    file_path = os.path.join(root, file)
                    # 只使用文件名（不包含路径）将文件添加到zip
                    zipf.write(file_path, file)

if __name__ == '__main__':
    zip_markdown_files()
    print("Compression completed.")