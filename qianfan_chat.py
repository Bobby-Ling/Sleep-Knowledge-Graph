# %%
import json
import os
from langchain_core._api import deprecated
from langchain_core.messages import BaseMessage
from langchain_core.outputs import LLMResult
from langchain_core.prompt_values import PromptValue
import qianfan
from prompts_template import *
from chat_session_interfce import ChatSessionInterface

os.environ["QIANFAN_ACCESS_KEY"] = "ALTAKa2sTBbGKGLjufDopsh9mx"
os.environ["QIANFAN_SECRET_KEY"] = "57c8514ba5f24c2c83138edd57c2c905"

class QianfanChatSession(ChatSessionInterface):
    def __init__(self, model = "ernie-3.5-8k", logger_name = __name__):
        super().__init__(logger_name)
        self.chat_comp = qianfan.ChatCompletion()
        self.model = model

    # @override
    def _process_message(self, message: str) -> str:
        resp = self.chat_comp.do(model=self.model, messages=[{
            "role": "user",
            "content": message
        }])
        result = resp["body"]['result'] # type: ignore
        return result
    # @override
    def update_connection(self):
        pass

# %%
if __name__ == "__main__":
    chat_comp = qianfan.ChatCompletion()

    resp = chat_comp.do(model="ERNIE-3.5-8K", messages=[{
        "role": "user",
        "content": DEMO_API_COMMAND
    }])
    result = resp["body"]['result'] # type: ignore
    print(json.dumps(resp["body"], indent=4, ensure_ascii=False)) # type: ignore
    print(result)

    exit

    # from openai import OpenAI

    # client = OpenAI(
    #     api_key="bce-v3/ALTAK-dz2T9w26uHBTw3DWWeNp2/8094ad4d9033ce35390cd6bece585e47a7bd0893",  # 千帆ModelBuilder平台bearer token
    #     base_url="https://qianfan.baidubce.com/v2",  # 千帆ModelBuilder平台域名
    #     default_headers={
    #         # "appid": "app-Mu***q6"
    #         }   # 千帆ModelBuilder平台应用ID，非必传
    # )

    # completion = client.chat.completions.create(
    #     model="ernie-3.5-8k", # 预置服务请查看支持的模型列表
    #     messages=[{'role': 'system', 'content': 'You are a helpful assistant.'},
    #             {'role': 'user', 'content': 'Hello！'}]
    # )

    # print(completion.choices[0].message)

# %%