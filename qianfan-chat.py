# %%
import json
import os
import qianfan
from prompts_template import *

os.environ["QIANFAN_ACCESS_KEY"] = "ALTAKa2sTBbGKGLjufDopsh9mx"
os.environ["QIANFAN_SECRET_KEY"] = "57c8514ba5f24c2c83138edd57c2c905"

chat_comp = qianfan.ChatCompletion()

resp = chat_comp.do(model="ERNIE-3.5-8K", messages=[{
    "role": "user",
    "content": DEMO_API_COMMAND
}])
result = resp["body"]['result']
print(json.dumps(resp["body"], indent=4))
print(result)
# %%
from openai import OpenAI

client = OpenAI(
    api_key="bce-v3/ALTAK-dz2T9w26uHBTw3DWWeNp2/8094ad4d9033ce35390cd6bece585e47a7bd0893",  # 千帆ModelBuilder平台bearer token
    base_url="https://qianfan.baidubce.com/v2",  # 千帆ModelBuilder平台域名
    default_headers={
        # "appid": "app-Mu***q6"
        }   # 千帆ModelBuilder平台应用ID，非必传
)

completion = client.chat.completions.create(
    model="ernie-3.5-8k", # 预置服务请查看支持的模型列表
    messages=[{'role': 'system', 'content': 'You are a helpful assistant.'},
              {'role': 'user', 'content': 'Hello！'}]
)

print(completion.choices[0].message)
# %%
