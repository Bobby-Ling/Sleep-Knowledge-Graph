import json
import os
import time

import requests
from sentence_transformers import SentenceTransformer

def parse(response):
    disease = []
    treatment = []
    for res in response["result"][0]:
        disease.append(res["Disease"]["name"])
        for t in res["DrugTreatments"]:
            treatment.append(t["name"])
        for t in res["NonDrugTreatments"]:
            treatment.append(t["name"])
        for t in res["RequiredExaminations"]:
            treatment.append(t["method"])
    return disease, treatment

def hit(a, b, thresh=0.5):
    hits = 0
    for i in a:
        hit = False
        for j in b:
            sim = model.similarity(model.encode(i), model.encode(j))
            if sim.item() > thresh:
                hit = True
                break
        if hit:
            hits += 1
    return hits

# 加载预训练的 Sentence-BERT 模型
model = SentenceTransformer('paraphrase-MiniLM-L6-v2')

with open("eval_result3.txt", "w+", encoding='utf-8') as wf:
    for _, _, filenames in os.walk("output"):
        for i, filename in enumerate(filenames):
            with open(f'output/{filename}', "r", encoding='utf-8') as f:
                data = eval(f.read())
            data["response"] = data["response"].replace("null", "None")
            data["response"] = eval(data["response"])
            disease_pred, treatment_pred = parse(data["response"])
            disease = data["label_disease"]
            treatment = data["label_treatment"]

            total_disease = len(disease)
            hit_disease = hit(disease, disease_pred)
            score_disease = hit_disease / total_disease

            total_treatment = len(treatment)
            hit_treatment = hit(treatment, treatment_pred)
            score_treatment = hit_treatment / total_treatment

            result = f"{i}: score_disease: {score_disease:.2f}, score_treatment: {score_treatment:.2f}"
            print(result)
            wf.write(result)
            wf.write("\n")



