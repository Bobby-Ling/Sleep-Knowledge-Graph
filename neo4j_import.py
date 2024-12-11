# %%
import json
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

URI = "neo4j+s://78717f6d.databases.neo4j.io:7687"
USER = "neo4j"
PASSWORD = "v6_ajT8EJU_naZWZjijqP7rySyaOYK7hl9oKJw74TQg"
class Neo4jImporter:
    def __init__(self, uri = URI, user = USER, password = PASSWORD):
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
    def execute(self, query: str):
        """执行单条 Cypher 查询并返回结果。"""
        self.logger.info("Executing query: %s", query)
        with self.driver.session() as session:
            try:
                result = session.run(query)
                # 将结果转换为列表（或其他合适的格式）
                # result_list = [record for record in result]
                # self.logger.info("Query executed successfully, returned %d records.", len(result_list))
                # return result_list
                return result.single().data()
            except CypherSyntaxError as e:
                self.logger.error("Query failed: %s", e)
                return {"error": str(e)}
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
importer = Neo4jImporter(URI, USER, PASSWORD)
# %%
if __name__ == "__main__":
    # 从字符串导入
    # importer.import_cypher("MATCH (n) DETACH DELETE n;")
    cypher_script = """
    MERGE (d:Disease {name: "阻塞性睡眠呼吸暂停低通气综合征", description: "OSAHS"})
    MERGE (t1:Treatment {name: "体质量管理", type: "非药物", description: "包括饮食控制和适度的体育锻炼, 旨在减轻体质量. "})
    MERGE (t2:Treatment {name: "生活方式改变", type: "非药物", description: "包括戒烟、限制酒精摄入、避免晚餐过量饮食、规律作息和改进睡眠环境等. "})
    MERGE (t3:Treatment {name: "持续气道正压通气(CPAP)", type: "药物", description: "通过面罩或鼻罩提供气道正压, 防止气道坍塌, 确保患者在夜间呼吸通畅. "})
    MERGE (t4:Treatment {name: "自动调节压力正压通气(APAP)", type: "药物", description: "可以根据患者的呼吸情况进行调整, 以提供更个性化的治疗. "})
    MERGE (d)-[:TREATED_BY]->(t1)
    MERGE (d)-[:TREATED_BY]->(t2)
    MERGE (d)-[:TREATED_BY]->(t3)
    MERGE (d)-[:TREATED_BY]->(t4);
    """
    result = importer.import_cypher(cypher_script)
    logging.info("Result: %s", result)
    result = importer.execute("""
MATCH (d:Disease {name: "阻塞性睡眠呼吸暂停低通气综合征"})-[:TREATED_BY]->(t:Treatment)
WITH d, 
     COLLECT(CASE WHEN t.type = '药物' THEN t.name END) as drug_treatments,
     COLLECT(CASE WHEN t.type = '非药物' THEN t.name END) as non_drug_treatments,
     COLLECT(CASE WHEN t.type = '药物' THEN t.description END) as drug_descriptions,
     COLLECT(CASE WHEN t.type = '非药物' THEN t.description END) as non_drug_descriptions
RETURN d.name as DiseaseName,
       d.description as DiseaseDescription,
       [x IN drug_treatments WHERE x IS NOT NULL] as DrugTreatments,
       [x IN drug_descriptions WHERE x IS NOT NULL] as DrugTreatmentDescriptions,
       [x IN non_drug_treatments WHERE x IS NOT NULL] as NonDrugTreatments,
       [x IN non_drug_descriptions WHERE x IS NOT NULL] as NonDrugTreatmentDescriptions
                              """)
    logging.info("Result: \n%s", json.dumps(result, indent=4, ensure_ascii=False))

    # # 从文件导入
    # file_path = "path/to/cypher_file.cql"
    # try:
    #     file_result = importer.import_from_file(file_path)
    #     logging.info("File import result: %s", file_result)
    # except Exception as e:
    #     logging.error("Failed to import file: %s", e)

    # 从目录导入
    # directory_path = "cyphers"
    # try:
    #     dir_result = importer.import_from_directory(directory_path)
    #     logging.info("Directory import result: %s", dir_result)
    # except Exception as e:
    #     logging.error("Failed to import directory: %s", e)

    # importer.close()

# %%
