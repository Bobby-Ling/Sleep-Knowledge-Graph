import json
import logging
import os
from dataclasses import asdict, dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Any, Dict, List, Optional, Union

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
from prompts_template import CHAT_SYSTEM_MSG
from scale_dataset import Schema, SleepDisorderScaleDataset

app = Flask(__name__)
CORS(app)  # 允许跨域请求

logger = app.logger
logger.setLevel(logging.INFO)

os.environ["OPENAI_API_KEY"] = 'sk-v6b21de09961ae981a677f1d02c1f2ade61a1d01c4c9JHN4'
os.environ["OPENAI_API_BASE"] = 'https://api.gptsapi.net/v1'

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

    def to_dict(self) -> dict:
        return {
            "chat": self.chat.to_dict(),
            "query": [item.to_dict() for item in self.query],
            "scales": [item.to_dict() for item in self.scales]
        }

    @classmethod
    def from_dict(cls, data: dict) -> 'Session':
        return cls(
            chat=SerializableMessageHistory.from_dict(data["chat"]),
            query=[HistoryItem.from_dict(item) for item in data["query"]],
            scales=[HistoryItem.from_dict(item) for item in data["scales"]]
        )

class User:
    """     
    {
        "session_id": {
            "chat": InMemoryChatMessageHistory,
            "query": [
                {
                    "timestamp": str,
                    "request": object,
                    "result": object
                }
            ],
            "scales": [
                {
                    "timestamp": str,
                    "request": object,
                    "result": object
                }
            ]
        }
    }
    """
    def __init__(self, save_path: str = "data/chat_history.json"):
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

        with open(self.save_path, 'r', encoding='utf-8') as f:
            data_dict: dict = json.load(f)

        self.from_dict(data_dict)

user = User()
user.load()

model = ChatOpenAI(
    temperature=0.7,
    model="gpt-4o-mini"
)

prompt_template = ChatPromptTemplate.from_messages([
    SystemMessage(content="你是一个聊天机器人, 具备记忆能力"),
    # SystemMessage(content=CHAT_SYSTEM_MSG),
    MessagesPlaceholder(variable_name="history"),
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
    user.get_session(session_id)
    user.save()

    return jsonify({
        "session_id": session_id,
        "title": title or f"session {session_id[:8]}",
        "created_at": datetime.utcnow().isoformat()
    })

@app.route("/chat/<session_id>/messages", methods=["POST"])
def send_message(session_id):
    data: dict = request.get_json()
    content: str = data["content"]

    config: RunnableConfig = {
        "configurable": {
            "session_id": session_id,
        }
    }

    response = chain.invoke(
        {
            "input": [HumanMessage(content=content)],
        },
        config=config
    )

    user.save()

    return jsonify({
        "response": response.content,
    })

@app.route("/chat/<session_id>/messages/stream", methods=["POST"])
def stream_message(session_id):
    # TODO 无法保留历史
    data: dict = request.get_json()
    content = data.get("content")

    if not content:
        return jsonify({"error": "content  are required"}), 400

    config: RunnableConfig = {
        "configurable": {
            "session_id": session_id,
        }
    }

    def generate():
        for chunk in chain.stream(
            {
                "input": [HumanMessage(content=content)],
            },
            config=config
        ):
            if hasattr(chunk, "content"):
                yield f"data: {chunk.content}\n\n"

    return app.response_class(
        generate(),
        mimetype='text/event-stream'
    )

@app.route("/chat/<session_id>/messages", methods=["GET"])
def get_messages(session_id):

    session = user.get_session(session_id)
    messages = session.chat.to_dict()

    return jsonify({
        "messages": messages,
        "total": len(messages)
    })

@app.route("/chat/<session_id>", methods=["GET"])
def get_sessions(session_id):
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

if __name__ == '__main__':
    app.run(debug=True, port=5000)