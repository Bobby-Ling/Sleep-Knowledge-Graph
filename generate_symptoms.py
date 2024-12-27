# %%
import json
from neo4j_import import importer
from sentence_transformers import SentenceTransformer
from scale_dataset import Schema
from openai_chat import client1
# model = SentenceTransformer('paraphrase-MiniLM-L6-v2')
# sim = model.similarity(model.encode("日间嗜睡"), model.encode("日间过度思睡"))

# %%
result = importer.execute("MATCH (s:Symptom)-[r:INDICATES*..3]->(d:Disease) RETURN s.name AS name, s.description AS description, COUNT(d) AS count ORDER BY COUNT(d) DESC")[0]
# symptoms = [symptom["name"] for symptom in result if symptom["count"] >=4 ]
symptoms = [symptom for symptom in result if symptom["count"] >=4 ]

scales = [scale.json_file.replace('.json', '') for scale in Schema if scale is not Schema.UNIMPLEMENTED]
# %%
symptom_template=[
    {
        "category": "睡眠结构症状",
        "symptoms": [
            {
                "name": "入睡困难",
                "alias": ["人睡困难"],
                "description": "",
                "related_scales": ["PSQI", "AISI"]
            },
            {
                "name": "频繁醒来",
                "alias": ["夜间觉醒"],
                "description": "",
                "related_scales": ["PSQI", "AISI"]
            },
            {
                "name": "日间思睡",
                "alias": ["日间过度嗜睡", "日间嗜睡", "白天疲乏", "白天瞌睡", "白天没精神", "白天思睡"],
                "description": "",
                "related_scales": ["ESS", "PSQI"]
            }
        ]
    },
    {
        "category": "呼吸相关症状",
        "symptoms": []
    },
    {
        "category": "精神情绪症状",
        "symptoms": []
    },
    {
        "category": "异常行为症状",
        "symptoms": []
    },
    {
        "category": "肢体症状",
        "symptoms": []
    }
]

# %%
completion = client1.chat.completions.create(
    model='gpt-4o',
    messages=[
        {"role": "system", "content": """
        请你根据我提供的[症状列表]和[量表列表], 分析同义词和根据症状推荐的睡眠量表, 仿照[症状json示例], 输出完整的[症状json], 不包含注释等额外部分, 不使用markdown语法, 
        允许适当删去症状以使得name适合最终用户(患者)
        需要你补全symptoms的name、alias、description和related_scales部分, 
        其中related_scales是根据症状推荐的睡眠量表, 不能为空
        description也需要适合最终用户(患者)
        根据情况可能需要额外添加分类(category)
        """},
        {"role": "user", "content": f"""
        [症状列表]
        {symptoms}
        [量表列表]
        {scales}
        [症状json示例]
        {symptom_template}
        """}
    ]
)
result = completion.choices[0].message.content
symptom_schema = json.loads(str(result))

# %%
for group in symptom_schema:
    for symptom in group['symptoms']:
        symptom['internal_name'] = symptom['name']

# %%
open('./assets/symptoms.json', 'w').write(json.dumps(symptom_schema, indent=4, ensure_ascii=False))
# %%

