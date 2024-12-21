import json
import logging
import os
from dataclasses import asdict, dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Any, Dict, List, Optional, Union

import appbuilder
import numpy as np
from flask import Flask, jsonify, request
from flask_cors import CORS
from langchain_core.chat_history import (BaseChatMessageHistory,
                                         InMemoryChatMessageHistory)
from langchain_core.messages import (AIMessage, BaseMessage, HumanMessage,
                                     SystemMessage)
from langchain_core.prompts import ChatPromptTemplate, MessagesPlaceholder
from langchain_core.runnables import RunnableConfig
from langchain_core.runnables.history import RunnableWithMessageHistory
from langchain_openai import ChatOpenAI

from analyze_scale import predict_diagnosis
from neo4j_import import importer
from neo4j_utils import generate_submit_query
from prompts_template import CHAT_SYSTEM_MSG, SLEEP_ANALYZER_PAYLOAD_TEMPLATE, SLEEP_ANALYZER_SYSTEM_MSG
from scale_dataset import Schema, SleepDisorderScaleDataset
from qianfan_langchain import parse_result
from aip import AipOcr

app = Flask(__name__)
CORS(app)  # 允许跨域请求

logger = app.logger
logger.setLevel(logging.INFO)

os.environ["OPENAI_API_KEY"] = 'sk-v6b21de09961ae981a677f1d02c1f2ade61a1d01c4c9JHN4'
os.environ["OPENAI_API_BASE"] = 'https://api.gptsapi.net/v1'

os.environ["APPBUILDER_TOKEN"] = "bce-v3/ALTAK-dz2T9w26uHBTw3DWWeNp2/8094ad4d9033ce35390cd6bece585e47a7bd0893"
sleep_chatbot_app_id = "a4a01e79-a41f-47cb-b1de-d159ed499ad2"
sleep_analyzer_app_id = "98256157-5b8e-47be-a215-b54bf47b9965"
sleep_chatbot = appbuilder.AppBuilderClient(sleep_chatbot_app_id)
sleep_analyzer = appbuilder.AppBuilderClient(sleep_analyzer_app_id)

APP_ID = '116780038'
API_KEY = 'n9h8Si7uJwRScNh5QGfS0XZ2'
SECRET_KEY = 'fz6dfLXaz1mXdmAs6OJNCAHrDfqyu7k4'

ocr_client = AipOcr(APP_ID, API_KEY, SECRET_KEY)

def get_file_content(file_path):
    with open(file_path, 'rb') as fp:
        return fp.read()


@dataclass
class HistoryItem:
    timestamp: str
    request: Any
    result: Any

    @classmethod
    def from_dict(cls, data: dict) -> 'HistoryItem':
        return cls(
            timestamp=data["timestamp"],
            request=data["request"],
            result=data["result"]
        )

    def to_dict(self) -> dict:
        return asdict(self)

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

@dataclass
class Session:
    chat: SerializableMessageHistory = field(default_factory=SerializableMessageHistory)
    query: List[HistoryItem] = field(default_factory=list)
    scales: List[HistoryItem] = field(default_factory=list)
    medical_histories: List[HistoryItem] = field(default_factory=list)
    chatbot_conversation_id: str = field(default_factory=str)
    analysis: dict = field(default_factory=dict)


    def to_dict(self) -> dict:
        return {
            "chat": self.chat.to_dict(),
            "query": [item.to_dict() for item in self.query],
            "scales": [item.to_dict() for item in self.scales],
            "medical_histories": [item.to_dict() for item in self.medical_histories],
            "chatbot_conversation_id": self.chatbot_conversation_id,
            "analysis": self.analysis
        }

    @classmethod
    def from_dict(cls, data: dict) -> 'Session':
        return cls(
            chat=SerializableMessageHistory.from_dict(data["chat"]),
            query=[HistoryItem.from_dict(item) for item in data["query"]],
            scales=[HistoryItem.from_dict(item) for item in data["scales"]],
            medical_histories=[HistoryItem.from_dict(item) for item in data["medical_histories"]],
            chatbot_conversation_id=data["chatbot_conversation_id"],
            analysis=data["analysis"]
        )

class User:
    """     
    {
        "session_id": {
            "chat": InMemoryChatMessageHistory,
            "query": HistoryItem,
            "scales": HistoryItem,
            "medical_histories": HistoryItem,
            "chatbot_conversation_id": str,
            "analysis": {
                "analysis": str,
                "short_analysis": str,
                "response": {
                    "content": str,
                    "followup_query": list,
                    "references": list
                }
            }
        }
    }
    """
    def __init__(self, save_path: str = "data/chat.json"):
        self.save_path = Path(save_path)
        self.save_path.parent.mkdir(exist_ok=True)
        self.data: Dict[str, Session] = {}  # 修改为直接存储session
        self.load()

    def get_session(self, session_id: str) -> Session:
        if session_id not in self.data:
            self.data[session_id] = Session()
        return self.data[session_id]

    def get_chat_history(self, session_id: str) -> SerializableMessageHistory:
        return self.get_session(session_id).chat

    def to_dict(self):
        data_dict = {
            session_id: session.to_dict()
            for session_id, session in self.data.items()
        }
        return data_dict

    def from_dict(self, data: dict):
        self.data = {
            session_id: Session.from_dict(session_data)
            for session_id, session_data in data.items()
        }

    def save(self):
        data_dict = self.to_dict()
        with open(self.save_path, 'w', encoding='utf-8') as f:
            json.dump(data_dict, f, ensure_ascii=False, indent=4)
        logger.info(f"saved to {self.save_path}")

    def load(self):
        if not self.save_path.exists():
            logger.warning(f"{self.save_path} not exists!!!")
            return

        try:
            with open(self.save_path, 'r', encoding='utf-8') as f:
                data_dict: dict = json.load(f)

            self.from_dict(data_dict)
        except Exception as e:
            logger.warning(f"load state error :{e}")

user = User()
user.load()

model = ChatOpenAI(
    temperature=0.7,
    model="gpt-4o-mini"
)

prompt_template = ChatPromptTemplate.from_messages([
    SystemMessage(content="你是一个聊天机器人, 具备记忆能力"),
    # SystemMessage(content=CHAT_SYSTEM_MSG),
    # MessagesPlaceholder(variable_name="history"),
    ("human", "{input}"),
])

def get_session_history(session_id: str) -> BaseChatMessageHistory:
    return user.get_chat_history(session_id)

chain = RunnableWithMessageHistory(
    prompt_template | model, # type: ignore
    get_session_history,
    input_messages_key="input",
    history_messages_key="history"
)

@app.route("/sessions/<session_id>", methods=["POST"])
def create_session(session_id):
    """
    初始化新的对话

    Args:
        session_id (_type_): 由用户提供

    Returns:
        _type_: json
    """
    data: dict = request.get_json()
    title = data.get("title")

    # 初始化新的对话
    session = user.get_session(session_id)

    # 百度机器人
    session.chatbot_conversation_id = sleep_chatbot.create_conversation()

    user.save()

    return jsonify({
        "session_id": session_id,
        "title": title or f"session {session_id[:8]}",
        "created_at": datetime.utcnow().isoformat()
    })

@app.route("/chat/<session_id>/init", methods=["POST"])
def init_chat(session_id):
    session = user.get_session(session_id)

    ANALYZER_MSG = ""
    if len(session.query) == 0:
        logger.warning("session.query is empty")
    else:
        ANALYZER_MSG += f"""
        # neo4j查询结果json为
        {session.query[-1].result}
        """
    if len(session.scales) == 0:
        logger.warning("session.scales is empty")
    else:
        ANALYZER_MSG += f"""
        # 量表结果和可能性分析为
        {session.scales[-1].result}
        """
    if len(session.medical_histories) == 0:
        logger.warning("session.medical_histories is empty")
    else:
        ANALYZER_MSG += f"""
        # 患者病历信息为
        {session.medical_histories[-1].result}
        """

    # sleep_analyzer_conv_id = sleep_analyzer.create_conversation()
    # result = parse_result(sleep_analyzer.run(sleep_analyzer_conv_id, query=ANALYZER_MSG))
    neo4j_analyze_result = model.invoke([
        SystemMessage(SLEEP_ANALYZER_SYSTEM_MSG),
        HumanMessage(ANALYZER_MSG)
    ])
    logger.info(f"neo4j_analyze_result: \n{neo4j_analyze_result}\n")

    neo4j_analyze_result_short = model.invoke([
        SystemMessage("""
            缩减下面的文本至400字以下, 保留核心诊断和建议相关内容, 可以适当删减药物和治疗等罗列部分
        """),
        HumanMessage(neo4j_analyze_result.content)
    ])
    logger.info(f"neo4j_analyze_result_short: \n{neo4j_analyze_result_short}\n")

    CHATBOT_MSG = f"""我从另一个医疗Agent得到了以下信息, 
    你的角色、指令、要求等都不变, 只是在接下来的对话中的回答多了以下这些额外信息:
    # 来自 另一个Agent的信息
    {neo4j_analyze_result_short}"""

    chatbot_result = parse_result(sleep_chatbot.run(session.chatbot_conversation_id, query=CHATBOT_MSG))
    logger.info(json.dumps(chatbot_result, indent=4, ensure_ascii=False))

    session.chat.add_ai_message(AIMessage([{"response": chatbot_result}]))

    response = {
        "analysis": neo4j_analyze_result.content,
        "short_analysis": neo4j_analyze_result_short.content,
        "response": chatbot_result
    }


    session.analysis = response

    user.save()

    return jsonify(response)


@app.route("/chat/<session_id>/messages", methods=["POST"])
def send_message(session_id):
    data: dict = request.get_json()
    content: str = data["content"]
    session = user.get_session(session_id)

    # config: RunnableConfig = {
    #     "configurable": {
    #         "session_id": session_id,
    #     }
    # }

    # response = chain.invoke(
    #     {
    #         "input": [HumanMessage(content=content)],
    #     },
    #     config=config
    # )

    # 获取neo4j
    # response = model.invoke(
    #     [HumanMessage(content='')],
    #     config=config
    # )

    response = parse_result(sleep_chatbot.run(session.chatbot_conversation_id, query=content))
    session.chat.add_user_message(HumanMessage(content))
    session.chat.add_ai_message(AIMessage([{"response": response}]))

    user.save()

    return jsonify(response)

@app.route("/chat/<session_id>/messages", methods=["GET"])
def get_messages(session_id):

    session = user.get_session(session_id)
    messages = session.chat.to_dict()

    return jsonify({
        "messages": messages,
        "total": len(messages)
    })

@app.route("/chat/<session_id>", methods=["GET"])
def get_session_data(session_id):
    sessions = user.data[session_id]

    return jsonify(sessions.to_dict())

@app.route('/scales', methods=['GET'])
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

@app.route('/scales/<session_id>', methods=['POST'])
def submit_scales(session_id):
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

        # 保存量表历史
        session = user.get_session(session_id)
        session.scales.append(HistoryItem(
            timestamp=datetime.utcnow().isoformat(),
            request=data,
            result=response
        ))
        user.save()

        return jsonify(response)

    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/query', methods=['GET'])
def get_symptoms():
    symptoms = json.loads(open('./assets/symptoms.json', 'r').read())
    return jsonify(symptoms)

@app.route('/query/<session_id>', methods=['POST'])
def submit_query(session_id):
    try:
        data: list[str] = request.get_json()
        query_data = data

        query = generate_submit_query(query_data)
        result = importer.execute(query)

        if not result:
            return jsonify({"error": "No matching items found"}), 404

        # 保存查询历史
        session = user.get_session(session_id)
        session.query.append(HistoryItem(
            timestamp=datetime.utcnow().isoformat(),
            request=query_data,
            result=result
        ))
        user.save()

        return jsonify(result)

    except Exception as e:
        return jsonify({"error": str(e)}), 500

UPLOAD_FOLDER = './tmp'
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

@app.route('/medical_history/<session_id>', methods=['POST'])
def upload_medical_history(session_id):
    session = user.get_session(session_id)

    if 'file' not in request.files:
        return jsonify({'error': 'No file part'}), 400

    file = request.files['file']
    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400

    os.makedirs('./tmp', exist_ok=True)
    file_path = f'./tmp/{session_id}_{file.filename}'
    file.save(file_path)

    try:
        with open(file_path, 'rb') as fp:
            image = fp.read()
        result = ocr_client.basicGeneral(image)
        text = ' '.join([w['words'] for w in result['words_result']]) # type: ignore
        # os.remove(file_path)
        logger.info(f"ocr result: {text}")

        extracted = model.invoke([
            SystemMessage("将下面的病历信息提取出患者基本信息、患者症状、既往史、现病史、家族史等信息"),
            HumanMessage(text)
        ])

        historu_item = HistoryItem(
            timestamp=datetime.utcnow().isoformat(),
            request=text,
            result=extracted.content
        )
        session.medical_histories.append(historu_item)

        user.save()

        return jsonify(historu_item)
    except:
        if os.path.exists(file_path):
            os.remove(file_path)
        return jsonify({'error': 'OCR failed'}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)