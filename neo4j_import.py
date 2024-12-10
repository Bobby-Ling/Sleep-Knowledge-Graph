# %%
import os
import logging
from neo4j import GraphDatabase
from neo4j.exceptions import *

# 配置日志
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
    handlers=[logging.StreamHandler()]
)

class Neo4jImporter:
    def __init__(self, uri, user, password):
        self.logger = logging.getLogger(self.__class__.__name__)
        try:
            self.driver = GraphDatabase.driver(uri, auth=(user, password))
            self.logger.info("Successfully connected to Neo4j database.")
        except AuthError as e:
            self.logger.error("Authentication failed: %s", e)
            raise

    def close(self):
        self.driver.close()
        self.logger.info("Closed connection to Neo4j database.")

    def import_cypher(self, cypher: str):
        """导入单条或多条 Cypher 语句（可以是分号分隔的字符串）。"""
        self.logger.info("Starting to import Cypher...")
        successful_queries = 0
        failed_queries = 0
        errors = []

        # 按分号拆分多个语句并去掉空白
        queries = [query.strip() for query in cypher.split(";") if query.strip()]

        with self.driver.session() as session:
            for idx, query in enumerate(queries, start=1):
                try:
                    session.run(query)
                    successful_queries += 1
                    self.logger.info("Executed query %d/%d successfully.", idx, len(queries))
                except CypherSyntaxError as e:
                    failed_queries += 1
                    errors.append((query, str(e)))
                    self.logger.warning("Query %d failed: %s", idx, e)

        self.logger.info(
            "Import completed: %d successful, %d failed.",
            successful_queries, failed_queries
        )
        if errors:
            self.logger.debug("Failed queries: %s", errors)
        return {"successful": successful_queries, "failed": failed_queries, "errors": errors}

    def import_from_file(self, file_path: str):
        """从文件中导入 Cypher 语句。"""
        try:
            with open(file_path, "r", encoding="utf-8") as file:
                cypher = file.read()
            self.logger.info("Successfully read Cypher file: %s", file_path)
            return self.import_cypher(cypher)
        except FileNotFoundError as e:
            self.logger.error("File not found: %s", e)
            raise
        except IOError as e:
            self.logger.error("IO error reading file: %s", e)
            raise

    def import_from_directory(self, directory_path: str):
        """从目录中批量导入所有 `.cypher` 文件。"""
        self.logger.info("Starting to import Cypher files from directory: %s", directory_path)
        if not os.path.isdir(directory_path):
            self.logger.error("Provided path is not a directory: %s", directory_path)
            raise NotADirectoryError(f"{directory_path} is not a valid directory.")

        successful_files = 0
        failed_files = 0
        total_results = {"successful": 0, "failed": 0, "errors": []}

        for file_name in os.listdir(directory_path):
            if file_name.endswith(".cypher"):
                file_path = os.path.join(directory_path, file_name)
                try:
                    self.logger.info("Importing file: %s", file_path)
                    result = self.import_from_file(file_path)
                    successful_files += 1
                    total_results["successful"] += result["successful"]
                    total_results["failed"] += result["failed"]
                    total_results["errors"].extend(result["errors"])
                except Exception as e:
                    failed_files += 1
                    self.logger.error("Failed to import file %s: %s", file_path, e)

        self.logger.info(
            "Directory import completed: %d files successful, %d files failed.",
            successful_files, failed_files
        )
        return total_results

# %%
if __name__ == "__main__":
    URI = "neo4j+s://78717f6d.databases.neo4j.io:7687"
    USER = "neo4j"
    PASSWORD = "v6_ajT8EJU_naZWZjijqP7rySyaOYK7hl9oKJw74TQg"

    importer = Neo4jImporter(URI, USER, PASSWORD)

    # # 从字符串导入
    # cypher_script = """
    # CREATE (n:TestNode {name: 'Node1'});
    # CREATE (n:TestNode {name: 'Node2'});
    # """
    # result = importer.import_cypher(cypher_script)
    # logging.info("Result: %s", result)

    # # 从文件导入
    # file_path = "path/to/cypher_file.cql"
    # try:
    #     file_result = importer.import_from_file(file_path)
    #     logging.info("File import result: %s", file_result)
    # except Exception as e:
    #     logging.error("Failed to import file: %s", e)

    # 从目录导入
    directory_path = "cyphers"
    try:
        dir_result = importer.import_from_directory(directory_path)
        logging.info("Directory import result: %s", dir_result)
    except Exception as e:
        logging.error("Failed to import directory: %s", e)

    importer.close()
