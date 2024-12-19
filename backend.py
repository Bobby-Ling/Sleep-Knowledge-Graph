import json
from typing import Any, Dict, List, Optional, Union
from flask import Flask, request, jsonify
from flask_cors import CORS

from logger import logging
from neo4j_import import importer

from scale_dataset import Schema, SleepDisorderScaleDataset

app = Flask(__name__)
CORS(app)  # 允许跨域请求

@app.route('/get_scales', methods=['GET'])
def get_scales():
    response = []
    for schema in Schema:
        if schema is Schema.UNIMPLEMENTED:
            continue
        response.append({
            "name": schema.value,
            "content": schema.scale_schema_data
        })
    return jsonify(response)

@app.route('/submit_scales', methods=['POST'])
def submit_scales():
    """
    {
        "AISI": [1, 1, 1, 1, 1, 1, 1, 0], 
        "ESS": [0, 0, 0, 0, 0, 0, 0, 0], 
        "HAMA": [2, 2, 2, 2, 0, 1, 1, 2, 0, 0, 0, 0, 0, 1], 
        "HAMD": [1, 1, 0, 1, 1, 1, 2, 3, 1, 2, 1, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1, 1, 2, 0, 0], 
        "IRLSSG": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
        "RBDSQ": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
        "StopBang": [0, 0, 0, 0, 0, 1, 0, 1]
    }
    """
    try:
        data: Dict[str, List[int]] = request.get_json()
        response: Dict[str, Union[str, Dict[str, str]]] = {
            "summary": "Are you OK?",
            "scales": {}
        }

        for scale_cls in SleepDisorderScaleDataset.SCALE_CLASSES:
            schema = scale_cls.schema
            if schema.value not in data:
                continue
            response["scales"][schema.value] = schema.value

        if not data:
            return jsonify({"error": "No JSON data provided"}), 400

        result = response
        return jsonify(result)

    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route('/get_symptoms', methods=['GET'])
def get_symptoms():
    symptoms = json.loads(open('./assets/symptoms.json', 'r').read())
    return jsonify(symptoms)


def generate_submit_query(symptoms_data: list[str]):
    """
    生成渐进式匹配的查询语句，确保返回最相关的结果
    匹配策略：
    1. 先尝试完全匹配所有症状
    2. 如果没有结果，则查找匹配大部分症状的疾病（至少75%）
    3. 如果仍没有结果，则查找匹配部分症状的疾病（至少50%）
    4. 最后确保至少返回与最严重症状相关的疾病
    """
    # 收集所有选中的症状
    all_symptoms = symptoms_data

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

@app.route('/submit_query', methods=['POST'])
def submit_query():
    try:
        data: list[str] = request.get_json()

        if not data:
            return jsonify({"error": "No JSON data provided"}), 400

        query = generate_submit_query(data)
        result = importer.execute(query)

        if not result:
            return jsonify({"error": "No matching items found"}), 404

        return jsonify(result)

    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, port=5000)