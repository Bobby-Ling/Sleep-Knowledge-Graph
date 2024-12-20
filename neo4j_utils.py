# %%
import json
from neo4j_import import importer

# %%
# result = importer.execute("MATCH (n:Symptom) RETURN n")
# result = importer.execute("MATCH (s:Symptom)-[r:INDICATES]->(d:Disease) RETURN DISTINCT s")
# internal_symptoms = [node["s"]["name"] for node in result[0]]

# %%
# def generate_get_symptoms(symptoms_data: list[dict]):
#     # 为每个类别生成单独的查询语句
#     queries = []

#     for category in symptoms_data:
#         # 获取该类别下所有症状的internal_name
#         category_symptoms = [
#             symptom["internal_name"] for symptom in category["symptoms"]
#         ]

#         # 构建该类别的WHERE子句条件
#         where_conditions = " OR ".join(
#             [f"symptom.name = '{symptom}'" for symptom in category_symptoms]
#         )

#         # 构建该类别的查询语句
#         category_query = f"""
#         /* {category['category']} */
#         MATCH (symptom:Symptom)-[indicates:INDICATES]->(disease:Disease)
#         WHERE {where_conditions}
#         RETURN symptom, indicates, disease"""

#         queries.append(category_query)

#     # 使用分号连接所有查询语句
#     final_query = ";\n".join(queries)

#     return final_query


symptom_mapping = json.loads(open("assets/symptoms.json", "r").read())
internal_symptoms = [symptom['internal_name'] for item in symptom_mapping for symptom in item['symptoms']]
# query = generate_get_symptoms(symptom_mapping)
# # print(query)
# result = importer.execute(query)
# print(importer.dump_execute(query))

# %%
# symptom_query = [
#     {"category": "睡眠问题", "symptoms": ["入睡困难", "早醒", "多梦"]},
#     {"category": "日间症状", "symptoms": ["白天嗜睡"]},
#     {"category": "呼吸症状", "symptoms": ["打鼾", "夜间呼吸困难"]},
#     {"category": "异常行为", "symptoms": ["磨牙", "梦游"]},
# ]
symptom_query = [
    "入睡困难",
    "早醒",
    "多梦",
    "白天嗜睡",
    "呼吸症状",
    "打鼾",
    "夜间呼吸困难",
    "异常行为",
    "磨牙",
    "梦游"
]

QUERY_TEMPLATE_v1 = """
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
    OPTIONAL MATCH (d)-[rt:TREATED_BY]->(dt:DrugTreatment)
    OPTIONAL MATCH (d)-[rt:TREATED_BY]->(ndt:NonDrugTreatment)
    
    // 收集相关疾病
    WITH 
        matched_symptoms,
        d,
        match_ratio,
        d.severity as severity,
        collect(distinct e) as exams,
        collect(distinct dt) as drug_treatments,
        collect(distinct ndt) as non_drug_treatments
    
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
        drug_treatments,
        non_drug_treatments
    
    // 返回结果，优先返回匹配度高的
    RETURN 
        matched_symptoms as Symptoms,
        related_diseases as Diseases,
        match_ratio as MatchRatio,
        severity as Severity,
        exams as RequiredExaminations,
        drug_treatments as DrugTreatment,
        non_drug_treatments as NonDrugTreatment
    
    // 按匹配率和严重程度排序
    ORDER BY match_ratio DESC, severity DESC
    LIMIT 1"""

QUERY_TEMPLATE_v2 = """
// ['打鼾', '头痛', '乏力']
WITH [{symptoms_list}] as symptomList
MATCH (s:Symptom)
WHERE any(symptom in symptomList WHERE s.name =~ '.*' + symptom + '.*')
WITH collect(s) as symptoms, symptomList

// 主查询
MATCH (s:Symptom)-[r:INDICATES]->(d:Disease)
WHERE s IN symptoms
WITH d, symptoms, symptomList,
     collect(s) as matchedSymptoms,
     count(DISTINCT s) as matchCount,
     size(symptomList) as totalSymptoms

// 计算匹配率
WITH d, symptoms, matchedSymptoms, matchCount, totalSymptoms,
     round(100.0 * matchCount / totalSymptoms) as matchPercentage
WHERE matchCount > 0  // 至少匹配一个症状

// 获取相关检查和治疗信息
OPTIONAL MATCH (d)-[re:REQUIRES_EXAM]->(e:Examination)
OPTIONAL MATCH (d)-[rt1:TREATED_BY]->(dt:DrugTreatment)
OPTIONAL MATCH (d)-[rt2:TREATED_BY]->(ndt:NonDrugTreatment)

// 返回结果，包含匹配详情
RETURN matchedSymptoms as MatchedSymptoms,
       matchCount as MatchedSymptomCount,
       totalSymptoms as TotalSymptoms,
       matchPercentage as MatchPercentage,
       d as Disease,
       d.severity as Severity,
       collect(DISTINCT e) as RequiredExaminations,
       collect(DISTINCT dt) as DrugTreatments,
       collect(DISTINCT ndt) as NonDrugTreatments
ORDER BY matchPercentage DESC, d.severity DESC
"""

def generate_submit_query(symptoms_data: list[str]):
    # 收集所有选中的症状
    # all_symptoms = []
    # for category in symptoms_data:
    #     all_symptoms.extend(category["symptoms"])
    all_symptoms = symptoms_data

    # 构建症状匹配条件
    symptom_conditions = [f"'{symptom}'" for symptom in all_symptoms]
    symptoms_list = ", ".join(symptom_conditions)

    # 构建查询语句
    query = QUERY_TEMPLATE_v2.format(symptoms_list = symptoms_list)

    return query

# %%
if __name__ == "__main__":
    query = generate_submit_query(symptom_query)
    print(query)
    result = importer.execute(query)
    print(importer.dump_execute(query))

# %%