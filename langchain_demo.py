

# %%
import os
from typing import List

from langchain_core.chat_history import (BaseChatMessageHistory,
                                         InMemoryChatMessageHistory)
from langchain_core.messages import AIMessage, HumanMessage, SystemMessage
from langchain_core.prompts import ChatPromptTemplate, MessagesPlaceholder
from langchain_core.runnables.history import RunnableWithMessageHistory
from langchain_openai import ChatOpenAI

from prompts_template import CHAT_PAYLOAD_MSG, CHAT_SYSTEM_MSG


# %%
class SerializableMessageHistory(InMemoryChatMessageHistory):
    def to_dict(self) -> List[dict]:
        return [
            {
                "type": "Human" if isinstance(msg, HumanMessage) else "AI",
                "content": msg.content
            }
            for msg in self.messages
        ]

    @classmethod
    def from_dict(cls, data: List[dict]) -> 'SerializableMessageHistory':
        history = cls()
        for msg in data:
            if msg["type"] == "Human":
                history.messages.append(HumanMessage(content=msg["content"]))
            else:
                history.messages.append(AIMessage(content=msg["content"]))
        return history

history = SerializableMessageHistory()

def get_session_history(session_id: str) -> BaseChatMessageHistory:
    print(session_id)
    print(history)
    return history

os.environ["OPENAI_API_KEY"] = 'sk-v6b21de09961ae981a677f1d02c1f2ade61a1d01c4c9JHN4'
os.environ["OPENAI_API_BASE"] = 'https://api.gptsapi.net/v1'
model = ChatOpenAI(
    temperature=0.7,
    model="gpt-4o-mini"
)

# %%

prompt_template = ChatPromptTemplate.from_messages([
    # SystemMessage(content="你是一个聊天机器人, 具备记忆能力"),
    # SystemMessage(content="接下来无论我发送什么, 都请输出1"),
    SystemMessage(content=CHAT_SYSTEM_MSG),
    HumanMessage(content=CHAT_PAYLOAD_MSG.format("{knowledges}")),
    # ("system", CHAT_PAYLOAD_MSG.format("{knowledges}")),
    MessagesPlaceholder(variable_name="history"),
    ("human", "{input}"),
])


# %%
chain = RunnableWithMessageHistory(
    prompt_template | model, # type: ignore
    get_session_history,
    input_messages_key="input",
    history_messages_key="history"
)

# %%
def send(input):
    return chain.invoke(
        input = {
            "input": input,
            "knowledges": "患者资料。\n 1\n一、病例特点：\n1、患者XX，女，62岁。因失眠伴脑鸣、头晕3年，加重2月余入院\n2、患者失眠、脑鸣3年余，之前症状不频繁，近2、3个月脑鸣，脑内有电流声，时有头晕，伴胸闷、恶心，无呕吐。否认胸痛，时有心慌。今头晕明显、行走不稳、视物旋转、恶心无呕吐。否认新发肢体无力、视物成双、口齿不清、意识不清。否认头痛。曾在我院门诊长期治疗失眠，目前夜间只能睡2、3个小时。为求进一步诊治，门诊拟“焦虑抑郁状态”收住入院。\n3、既往史及个人史无特殊。\n4、查体：T 36.4℃ P 70次/分 R 18次/分 BP 121/72mmHg，表面皮肤无皮疹及出血点，全身皮肤粘膜无黄染，无肝掌、蜘蛛痣，全身浅表淋巴结不大，眼睑无浮肿，结膜无充血，外耳道无分泌物，鼻无畸形，咽无充血，扁桃体不大，胸廓无畸形，两肺叩诊呈清音，两肺未及湿啰音，心律齐，未及病理性杂音，腹部软，未及包块，无压痛反跳痛，肝脾肋下未及肿大，双下肢无浮肿。\n神经系统专科查体：神志清，紧张不安。双侧瞳孔等大等圆，直径约3.0mm，光反射灵敏，眼球活动正常，面部感觉正常，角膜反射正常，张口居中，双侧额纹对称，双侧眼裂对称，双侧鼻唇沟对称，口角无歪斜，伸舌居中。肌营养正常，四肢肌力5°，肌张力正常，腱反射（+），双巴氏征（-），共济运动与浅感觉检查未见异常。\n二、拟诊讨论：\n1、初步诊断：1、焦虑抑郁状态\n2、睡眠障碍\n3、后循环缺血\n2、诊断依据：患者XX，女，62岁。因失眠伴脑鸣、头晕3年，加重2月余入院，患者情绪紧张，结合病史做出诊断。\n3、鉴别诊断（诊断分析）：1.前庭神经元炎：发病常较突然，头晕发作前多有感冒病史，眩晕和自发性眼球震颤为主要表现，重者可伴有恶心、呕吐，但无耳鸣、耳聋，眩晕持续时间较短，常在几天内逐渐恢复，该患者发病前曾有感冒病史，头晕呈持续性，需考虑该疾病，拟完善相关检查进一步明确；\n三、诊疗"
        },
        config = {
            "configurable": {
                "session_id": "1",
            }
        }
    ).content

print(send("我是Bobby; 我失眠和脑鸣已经有3年多了，之前这些症状还不算频繁。但最近2、3个月，脑鸣变得严重了，感觉脑子里像有电流声一样，有时候还会头晕。同时，我还会觉得胸闷、恶心，不过没有吐过。我没有胸痛的情况，但偶尔会觉得心慌。今天头晕特别厉害，走路都不稳，眼前的东西还在打转，一直觉得恶心，但还是没有吐。"))
print(send("回答我一个除了医疗之外的问题: 我是谁?"))

# %%