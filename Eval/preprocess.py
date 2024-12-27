import re
from openai import OpenAI
import json
import requests
import time

from tqdm import tqdm

with open('data/patient.txt', 'r', encoding='utf-8') as f:
    data = f.read()
    data = data.split('\n#')

with open('symptom.json', 'r', encoding='utf-8') as f:
    symptom_json = json.load(f)

symptom_list = []
for i in symptom_json:
    for j in i["symptoms"]:
        symptom_list.append(j["internal_name"])

symptom_list = ', '.join(symptom_list)

agent = OpenAI(
    base_url="https://api.gptsapi.net/v1",
    api_key="sk-v6b21de09961ae981a677f1d02c1f2ade61a1d01c4c9JHN4"
)
prompt_system = """
    你是一个睡眠医学方向的专家，请对下面的病例信息进行关键词提取。
"""
prompt_symptom = f"""
    请从用户的症状描述中提取症状关键词，且关键词必须从{symptom_list}中选择。输出使用<symptom> </symptom>包裹，其中不同症状以逗号分隔。用户的症状描述如下：\n
"""

prompt_disease = f"""
    请从医生的诊断意见中提取疾病关键词。输出使用<disease> </disease>标签包裹，其中不同疾病以逗号分隔。医生的诊断意见如下：\n
"""

prompt_treatment = f"""
    请从医生的诊断意见中提取治疗手段关键词。输出使用<treatment> </treatment>包裹，其中不同治疗手段以逗号分隔。医生的诊断意见如下：\n
"""

session_id = time.time()
url_create = f"http://113.44.52.217:5000/sessions/{session_id}"
payload = json.dumps({
   "title": "Admin Session"
})
headers = {
   'Content-Type': 'application/json'
}
requests.request("POST", url=url_create, headers=headers, data=payload)

url_query = f"http://113.44.52.217:5000/query/{session_id}"

print(symptom_list)
for i, patient in tqdm(enumerate(data)):
    first = patient.find('一、')
    second = patient.find('二、')
    thrid = patient.find('三、')
    symptom = patient[first: second]
    disease = patient[second: thrid]
    treatment = patient[thrid:]
    response = agent.chat.completions.create(
        model='gpt-4',
        messages=[
            {"role": "system", "content": f"{prompt_system}"},
            {"role": "user", "content": f"{prompt_symptom}"
                                        f"{symptom}"
                                        f"{prompt_disease}"
                                        f"{disease}"
                                        f"{prompt_treatment}"
                                        f"{treatment}"
             },
        ]
    )
    response = response.choices[0].message.content
    sample_symptom = re.findall(r'<symptom>(.*?)</symptom>', response, re.DOTALL)[0]
    label_disease = re.findall(r'<disease>(.*?)</disease>', response, re.DOTALL)[0]
    label_treatment = re.findall(r'<treatment>(.*?)</treatment>', response, re.DOTALL)[0]
    sample_symptom = sample_symptom.replace(' ', '').replace('，', ',').split(',')
    label_disease = label_disease.replace(' ', '').replace('，', ',').split(',')
    label_treatment = label_treatment.replace(' ', '').replace('，', ',').split(',')
    # print(sample_symptom, label_disease, label_treatment)
    result = requests.request("POST", url=url_query, headers=headers, data=json.dumps(sample_symptom))
    # result.encoding = 'utf-8'
    result = json.dumps(result.json(), ensure_ascii=False)
    output = {
        "sample_symptom": sample_symptom,
        "label_disease": label_disease,
        "label_treatment": label_treatment,
        "response": result
    }
    with open(f'output/{i}.txt', 'w', encoding='utf-8') as f:
        f.write(str(output))

    # break



