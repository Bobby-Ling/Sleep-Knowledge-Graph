import json
from typing import Any, Dict, List, Optional, Union
from flask import Flask, request, jsonify
from flask_cors import CORS
import numpy as np

from analyze_scale import predict_diagnosis
from logger import logging
from neo4j_import import importer

from neo4j_utils import generate_submit_query
from scale_dataset import Schema, SleepDisorderScaleDataset

app = Flask(__name__)
CORS(app)  # 允许跨域请求

logger = app.logger
logger.setLevel(logging.INFO)

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
        # "PSQI": [1350, 3, 390, 4, 3, 3, 3, 0, 0, 0, 0, 2, 0, 2, 3, 1, 1], 
        "PSQI": [0, 3, 0, 4, 3, 3, 3, 0, 0, 0, 0, 2, 0, 2, 3, 1, 1], 
        "RBDSQ": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
        "StopBang": [0, 0, 0, 0, 0, 1, 0, 1]
    } 
    """
    try:
        data: Dict[str, List[int]] = request.get_json()

        """response:
        {
            "summary": "",
            "scales": {
                "AISI": "",
                "ESS": "",
                "HAMA": "",
                "HAMD": "",
                "IRLSSG": "",
                "PSQI": "",
                "RBDSQ": "",
                "StopBang": ""
            },
            "predict": [
                {
                    "diagnosis": ""
                    "probability": ""
                }
            ]
        }
        """
        response: Dict[str, Union[str, Dict[str, str], List]] = {
            "summary": "",
            "scales": {},
            "predict": []
        }

        patient_scale = []
        for schema in Schema:
            if schema is Schema.UNIMPLEMENTED:
                continue
            if schema.value in data:
                logger.info(schema.value)
                result = np.array(data[schema.value]).sum()
            else:
                result = np.nan
            patient_scale.append(result)

        logger.info(np.array([patient_scale]))
        predicted_label, labels_probabilities = predict_diagnosis(np.array([patient_scale]))

        n = 3
        response["predict"] = [
            {"diagnosis": label, "probability": f"{prob:.2f}"}
            for label, prob in labels_probabilities[:n]
        ]
        response["summary"] = predicted_label # type: ignore

        for scale_cls in SleepDisorderScaleDataset.SCALE_CLASSES:
            schema = scale_cls.schema
            if schema.value not in data:
                continue
            response["scales"][schema.value] = schema.value # type: ignore

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