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

        self.logger.setLevel(logging.DEBUG)

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
                    result = session.run(single_query)
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
        pbar = tqdm(iterator, total=len(iterator), desc="Executing Cypher statements")

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
    # result = importer.execute("MATCH (n) DETACH DELETE n;")
    # result = importer.execute(CYPHER_CONSTRAINT_SCHEMA)
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
    # toml_dir = "cypher_parsed/toml"
    # try:
    #     importer.execute_iter(CypherTomlResponseIterator(toml_dir))
    # except Exception as e:
    #     logging.error("Failed to import directory: %s", e)

    # importer.close()
    # sys.exit()
    pass

# %%
# result = importer.execute("MATCH (n:Symptom) RETURN n")
result = importer.execute("MATCH (s:Symptom)-[r:INDICATES]->(d:Disease) RETURN s")
symptom_mapping = [node["s"]["name"] for node in result[0]]


# %%
def generate_get_symptoms(symptoms_data: list[dict]):
    # 为每个类别生成单独的查询语句
    queries = []

    for category in symptoms_data:
        # 获取该类别下所有症状的internal_name
        category_symptoms = [
            symptom["internal_name"] for symptom in category["symptoms"]
        ]

        # 构建该类别的WHERE子句条件
        where_conditions = " OR ".join(
            [f"symptom.name = '{symptom}'" for symptom in category_symptoms]
        )

        # 构建该类别的查询语句
        category_query = f"""
        /* {category['category']} */
        MATCH (symptom:Symptom)-[indicates:INDICATES]->(disease:Disease)
        WHERE {where_conditions}
        RETURN symptom, indicates, disease"""

        queries.append(category_query)

    # 使用分号连接所有查询语句
    final_query = ";\n".join(queries)

    return final_query


symptom_mapping = json.loads(open("assets/symptoms.json", "r").read())
query = generate_get_symptoms(symptom_mapping)
# print(query)
result = importer.execute(query)
# print(importer.dump_execute(query))

# %%
symptom_query = [
    {"category": "睡眠问题", "symptoms": ["入睡困难", "早醒", "多梦"]},
    {"category": "日间症状", "symptoms": ["白天嗜睡"]},
    {"category": "呼吸症状", "symptoms": ["打鼾", "夜间呼吸困难"]},
    {"category": "异常行为", "symptoms": ["磨牙", "梦游"]},
]


def generate_submit_query(symptoms_data):
    """
    生成渐进式匹配的查询语句，确保返回最相关的结果
    匹配策略：
    1. 先尝试完全匹配所有症状
    2. 如果没有结果，则查找匹配大部分症状的疾病（至少75%）
    3. 如果仍没有结果，则查找匹配部分症状的疾病（至少50%）
    4. 最后确保至少返回与最严重症状相关的疾病
    """
    # 收集所有选中的症状
    all_symptoms = []
    for category in symptoms_data:
        all_symptoms.extend(category["symptoms"])

    # 构建症状匹配条件
    symptom_conditions = [f"'{symptom}'" for symptom in all_symptoms]
    symptoms_list = ", ".join(symptom_conditions)

    # 构建查询语句
    query = f"""
    WITH [{symptoms_list}] as symptoms
    MATCH path = (s:Symptom)-[r:INDICATES|MAY_CAUSE*..3]-(d:Disease)
    WHERE s.name IN symptoms
    AND ALL(rel IN relationships(path) WHERE type(rel) IN ['INDICATES', 'MAY_CAUSE'])
    AND ALL(node IN nodes(path) WHERE node:Symptom OR node:Disease)
    
    // 收集每个疾病匹配的症状
    WITH d, COLLECT(DISTINCT s) as matched_symptoms, symptoms
    
    // 计算匹配率
    WITH d, 
         matched_symptoms, 
         symptoms,
         toFloat(size(matched_symptoms)) / size(symptoms) as match_ratio
    
    // 使用CASE进行渐进式匹配
    WHERE CASE
        // 完全匹配 (100%)
        WHEN match_ratio = 1.0 THEN true
        // 高度匹配 (>=75%)
        WHEN match_ratio >= 0.75 THEN true
        // 部分匹配 (>=50%)
        WHEN match_ratio >= 0.50 THEN true
        // 确保至少返回一些结果
        ELSE match_ratio > 0
    END
    
    // 获取相关检查和治疗
    OPTIONAL MATCH (d)-[re:REQUIRES_EXAM]->(e:Examination)
    OPTIONAL MATCH (d)-[rt:TREATED_BY]->(t:Treatment)
    
    // 收集相关疾病
    WITH 
        matched_symptoms,
        d,
        match_ratio,
        d.severity as severity,
        collect(distinct e) as exams,
        collect(distinct t) as treatments
    
    // 查找相关疾病
    MATCH (d2:Disease)
    WHERE d2 = d OR 
          EXISTS((d)-[:INDICATES|MAY_CAUSE*..2]-(d2)) OR
          EXISTS((d2)-[:INDICATES|MAY_CAUSE*..2]-(d))
    
    // 组织最终结果
    WITH 
        matched_symptoms,
        collect(distinct d2) as related_diseases,
        match_ratio,
        severity,
        exams,
        treatments
    
    // 返回结果，优先返回匹配度高的
    RETURN 
        matched_symptoms as Symptoms,
        related_diseases as Diseases,
        match_ratio as MatchRatio,
        severity as Severity,
        exams as RequiredExaminations,
        treatments as Treatments
    
    // 按匹配率和严重程度排序
    ORDER BY match_ratio DESC, severity DESC
    LIMIT 10"""

    return query


query = generate_submit_query(symptom_query)
print(query)
result = importer.execute(query)
print(importer.dump_execute(query))

# %%
