# %%
from datetime import datetime
import json
import os
import logging
import sys
from typing import Iterator
from neo4j import GraphDatabase
from neo4j.exceptions import *
from tqdm import tqdm

from prompts_template import CYPHER_CONSTRAINT_SCHEMA
from cypher_normalizer import CypherTomlResponseIterator

URI = "neo4j+s://78717f6d.databases.neo4j.io:7687"
USER = "neo4j"
PASSWORD = "v6_ajT8EJU_naZWZjijqP7rySyaOYK7hl9oKJw74TQg"

class Neo4jImporter:
    def __init__(self, uri=URI, auth=(USER, PASSWORD), log_level=logging.INFO):
        self.logger = logging.getLogger(self.__class__.__name__)
        self.setup_logging(log_level)
        try:
            self.driver = GraphDatabase.driver(uri, auth=auth)
            self.logger.info("Successfully connected to Neo4j database.")
        except AuthError as e:
            self.logger.error("Authentication failed: %s", e)
            raise

    def setup_logging(self, log_level):
        """设置日志"""
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        log_file = f"logs/import_{timestamp}.log"

        # XXX 临时改一下
        # self.logger.setLevel(logging.DEBUG)
        self.logger.setLevel(logging.INFO)

        console_handler = logging.StreamHandler(sys.stdout)
        console_handler.setLevel(log_level)

        file_handler = logging.FileHandler(log_file, encoding="utf-8")
        file_handler.setLevel(logging.DEBUG)

        formatter = logging.Formatter("%(asctime)s - %(levelname)s - %(message)s")
        console_handler.setFormatter(formatter)
        file_handler.setFormatter(formatter)

        self.logger.handlers.clear()
        self.logger.addHandler(console_handler)
        self.logger.addHandler(file_handler)
        self.logger.debug(f"debug{self.logger.handlers}")

    def close(self):
        self.driver.close()
        self.logger.info("Closed connection to Neo4j database.")

    def execute(self, query: str):
        """执行一条或多条 Cypher 查询并返回所有结果。"""
        self.logger.debug("Executing queries: %s", query)

        queries = [q.strip() for q in query.split(";") if q.strip()]
        results = []

        with self.driver.session() as session:
            for idx, single_query in enumerate(queries, start=1):
                try:
                    result = session.run(single_query) # type: ignore
                    records = list(result)
                    if records:
                        # 将所有记录转换为字典列表
                        result_data = [record.data() for record in records]
                        self.logger.debug(
                            "Query %d/%d result:\n%s",
                            idx,
                            len(queries),
                            json.dumps(result_data, indent=4, ensure_ascii=False),
                        )
                        results.append(result_data)
                    else:
                        self.logger.debug(
                            "Query %d/%d returned no results", idx, len(queries)
                        )
                        results.append([])

                except CypherSyntaxError as e:
                    self.logger.error("Query %d/%d failed: %s", idx, len(queries), e)
                    results.append({"error": str(e)})
        return results

    def dump_execute(self, query: str):
        return json.dumps(self.execute(query), indent=4, ensure_ascii=False)

    def execute_iter(self, iterator: Iterator) -> tuple[int, int]:
        """
        从迭代器中获取数据并执行Cypher语句
        """
        success_count = 0
        error_count = 0
        current_batch = 0

        self.logger.info("Starting Cypher statements execution")

        # 使用tqdm创建进度条
        pbar = tqdm(iterator, total=len(iterator), desc="Executing Cypher statements") # type: ignore

        for block in pbar:
            current_batch += 1
            try:
                self.execute(block)
                self.logger.debug("\n\n////////------------------------------------\n")
                self.logger.debug(block)
                self.logger.debug("\n------------------------------------////////\n\n")
                success_count += 1

            except Exception as e:
                error_count += 1
                self.logger.error(f"Failed to process block: {str(e)}")

        self.logger.info(f"Execution completed. Total processed: {current_batch}")
        self.logger.info(
            f"Final results - Success: {success_count}, Errors: {error_count}"
        )

        return success_count, error_count


# %%
# importer = Neo4jImporter(URI, (USER, PASSWORD))
importer = Neo4jImporter("bolt://localhost:7687", None)
# %%
if __name__ == "__main__":
    # 从字符串导入
    result = importer.execute("MATCH (n) DETACH DELETE n;")
    result = importer.execute(CYPHER_CONSTRAINT_SCHEMA)
    # cypher_script = """"""
    # result = importer.execute(cypher_script)

    # # 从文件导入
    # file_path = "path/to/cypher_file.cql"
    # try:
    #     file_result = importer.import_from_file(file_path)
    #     logging.info("File import result: %s", file_result)
    # except Exception as e:
    #     logging.error("Failed to import file: %s", e)

    # 从目录导入
    toml_dir = "cypher_parsed/toml"
    try:
        importer.execute_iter(CypherTomlResponseIterator(toml_dir))
    except Exception as e:
        logging.error("Failed to import directory: %s", e)

    importer.close()
    sys.exit()
    pass
# %%
