# %%
import json
import logging
import os
from dataclasses import asdict, dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Any, Dict, List, Optional, Union
from unittest import result

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
from prompts_template import CHAT_PAYLOAD_MSG, CHAT_SYSTEM_MSG, MEDICAL_HISTORY_EXTRACTOR_SYSTEM_MSG, SLEEP_ANALYZER_PAYLOAD_TEMPLATE, SLEEP_ANALYZER_SYSTEM_MSG
from scale_dataset import Schema, SleepDisorderScaleDataset, schema_to_scale
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
sleep_db_app_id = "f93d7dc8-ee70-4aba-babc-382a121dc5ef"
sleep_chatbot = appbuilder.AppBuilderClient(sleep_chatbot_app_id)
sleep_analyzer = appbuilder.AppBuilderClient(sleep_analyzer_app_id)
sleep_db = appbuilder.AppBuilderClient(sleep_db_app_id)

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

@dataclass
class Prediction:
    diagnosis: str
    probability: int

    @classmethod
    def from_dict(cls, data: dict) -> 'Prediction':
        return cls(
            diagnosis=data["diagnosis"],
            probability=data["probability"]
        )

    def to_dict(self) -> dict:
        return asdict(self)

@dataclass
class ScalesAnalysis:
    """
    {
        "summary": str,
        "predict": [
            {
                "diagnosis": str
                "probability": int
            }
        ]
    }
    """
    summary: str = ""
    predict: List[Prediction] = field(default_factory=list)

    @classmethod
    def from_dict(cls, data: dict) -> 'ScalesAnalysis':
        return cls(
            summary=data["summary"],
            predict=[Prediction.from_dict(p) for p in data["predict"]]
        )

    def to_dict(self) -> dict:
        return {
            "summary": self.summary,
            "predict": [p.to_dict() for p in self.predict]
        }

@dataclass
class ScaleResult:
    """
    {
        "request": {
            "AISI": list[int]
        },
        "result": {
            "AISI": dict
        },
        "analysis": {
            "summary": str,
            "predict": [
                {
                    "diagnosis": str
                    "probability": int
                }
            ]
        }
    }
    """
    request: Dict[str, List[int]] = field(default_factory=dict)
    result: Dict[str, dict] = field(default_factory=dict)
    analysis: ScalesAnalysis = field(default_factory=lambda: ScalesAnalysis())

    @classmethod
    def from_dict(cls, data: dict) -> 'ScaleResult':
        return cls(
            request=data["request"],
            result=data["result"],
            analysis=ScalesAnalysis.from_dict(data["analysis"])
        )

    def to_dict(self) -> dict:
        return {
            "request": self.request,
            "result": self.result,
            "analysis": self.analysis.to_dict()
        }

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
    scales: ScaleResult = field(default_factory=ScaleResult)
    medical_histories: List[HistoryItem] = field(default_factory=list)
    chatbot_conversation_id: str = field(default_factory=str)
    analysis: dict = field(default_factory=dict)


    def to_dict(self) -> dict:
        return {
            "chat": self.chat.to_dict(),
            "query": [item.to_dict() for item in self.query],
            "scales": self.scales.to_dict(),
            "medical_histories": [item.to_dict() for item in self.medical_histories],
            "chatbot_conversation_id": self.chatbot_conversation_id,
            "analysis": self.analysis
        }

    @classmethod
    def from_dict(cls, data: dict) -> 'Session':
        return cls(
            chat=SerializableMessageHistory.from_dict(data["chat"]),
            query=[HistoryItem.from_dict(item) for item in data["query"]],
            scales=ScaleResult.from_dict(data["scales"]),
            medical_histories=[HistoryItem.from_dict(item) for item in data["medical_histories"]],
            chatbot_conversation_id=data["chatbot_conversation_id"],
            analysis=data["analysis"],
        )

class User:
    """     
    {
        "session_id": {
            "chat": InMemoryChatMessageHistory,
            "query": HistoryItem,
            "medical_histories": HistoryItem,
            "chatbot_conversation_id": str,
            "scales": ScaleResult,
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

user = User("data/chat.json")
user.load()

model = ChatOpenAI(
    temperature=0.7,
    model="gpt-4o-mini"
)

prompt_template = ChatPromptTemplate.from_messages([
    # SystemMessage(content="你是一个聊天机器人, 具备记忆能力"),
    # SystemMessage(content="接下来无论我发送什么, 都请输出1"),
    SystemMessage(content=CHAT_SYSTEM_MSG),
    HumanMessage(content=CHAT_PAYLOAD_MSG.format("{knowledges}")),
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

# %%

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

@app.route("/analysis/<session_id>", methods=["GET"])
def analysis(session_id):
    try:
        session = user.get_session(session_id)

        ANALYZER_MSG = ""
        if len(session.query) == 0:
            logger.warning("session.query is empty")
        else:
            ANALYZER_MSG += f"""
            # neo4j查询结果json为
            {session.query[-1].result}
            """
        if len(session.scales.analysis.summary) == 0:
            logger.warning("session.scales is empty")
        else:
            ANALYZER_MSG += f"""
            # 使用的量表及其评估分析为
            {session.scales.result}
            # 综合所有量表的结果和疾病可能性分析为
            {session.scales.analysis}
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
        analysis = json.loads(str(neo4j_analyze_result.content))
        logger.info(f"neo4j_analyze_result: \n{json.dumps(analysis, indent=4, ensure_ascii=False)}\n")

        neo4j_analyze_result_short = model.invoke([
            SystemMessage("""
                根据下面的睡眠疾病分析json, 生成400字以下的文本, 保留核心诊断和建议相关内容, 可以适当删减药物和治疗等罗列部分
            """),
            HumanMessage(neo4j_analyze_result.content)
        ])
        logger.info(f"neo4j_analyze_result_short: \n{neo4j_analyze_result_short}\n")

        response = {
            "analysis": analysis,
            "short_analysis": neo4j_analyze_result_short.content,
        }

        session.analysis = response

        user.save()

        return jsonify(response)
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/chat/<session_id>/init", methods=["POST"])
def init_chat(session_id):
    session = user.get_session(session_id)

    neo4j_analyze_result_short = session.analysis["short_analysis"]

    ################ 百度
    # CHATBOT_MSG = f"""我从另一个医疗Agent得到了以下信息,
    # 你的角色、指令、要求等都不变, 只是在接下来的对话中的回答多了以下这些额外信息:
    # # 来自 另一个Agent的信息
    # {neo4j_analyze_result_short}"""

    # chatbot_result = parse_result(sleep_chatbot.run(session.chatbot_conversation_id, query=CHATBOT_MSG))
    # logger.info(json.dumps(chatbot_result, indent=4, ensure_ascii=False))

    # session.chat.add_ai_message(AIMessage([{"response": chatbot_result}]))
    ################

    content = chain.invoke(
        input = {
            "input": f"[注意]本条对话你只需要回答:明白了就行\n[患者分析结果]\n{neo4j_analyze_result_short}",
            "knowledges": "这是第一条对话, 不会提供知识库, 根据之前的指示, 你的基础知识见[患者分析结果]部分"
        },
        config = {
            "configurable": {
                "session_id": session_id,
            }
        }
    ).content

    response = {
        "content": content
    }

    user.save()

    return jsonify(response)

@app.route("/chat/<session_id>/messages", methods=["POST"])
def send_message(session_id):
    data: dict = request.get_json()
    content: str = data["content"]
    session = user.get_session(session_id)

    # 获取neo4j
    # response = model.invoke(
    #     [HumanMessage(content='')],
    #     config=config
    # )

    # 百度睡眠向量数据库结果
    references = sleep_db.run(sleep_db.create_conversation(), query=content).content.answer # type: ignore

    logger.info(references)
    content = chain.invoke(
        input = {
            "input": content,
            "knowledges": references
        },
        config = {
            "configurable": {
                "session_id": session_id,
            }
        }
    ).content

    response = {
        "content": content,
        "references": json.loads(references),
        "followup_query": []
    }

    ###################### 百度机器人, 需要手动保存历史, 已经废弃
    # response = parse_result(sleep_chatbot.run(session.chatbot_conversation_id, query=content))
    # session.chat.add_user_message(HumanMessage(content))
    # session.chat.add_ai_message(AIMessage([{"response": response}]))
    ######################

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
            "content": schema.scale_data
        })
    return jsonify(response)

@app.route('/scales/<session_id>/<schema_name>', methods=['POST'])
def submit_scale(session_id, schema_name):
    try:
        session = user.get_session(session_id)
        data: List[int] = request.get_json()
        """data:
        [1350, 3, 390, 4, 3, 3, 3, 0, 0, 0, 0, 2, 0, 2, 3, 1, 1]
        """

        schema = Schema(schema_name)
        scale_cls = schema_to_scale[schema]

        result = scale_cls.evaluate(data)

        session.scales.request[schema.value] = data
        session.scales.result[schema.value] = result
        # session.scales.analysis = None

        user.save()

        return jsonify(result)

    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/scales/<session_id>', methods=['GET'])
def analyze_scales(session_id):
    try:
        session = user.get_session(session_id)

        """response:
        {
            "summary": "",
            "scales": {
                "AISI": {
                    "details": {
                        "components": list
                    },
                    "summary": {
                        "interpretation": "",
                        "levels": list,
                        "max_score": int,
                        "score": int
                    }
                },
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
        analysis: Dict[str, Union[str, Dict[str, str], List]] = {
            "summary": "",
            "scales": {},
            "predict": []
        }

        scales_data: Dict[str, List[int]] = session.scales.request

        patient_scale = []
        for schema in Schema:
            if schema is Schema.UNIMPLEMENTED:
                continue
            if schema.value in scales_data:
                logger.info(schema.value)
                result = np.array(scales_data[schema.value]).sum()
            else:
                result = np.nan
            patient_scale.append(result)

        logger.info(np.array([patient_scale]))
        predicted_label, labels_probabilities = predict_diagnosis(np.array([patient_scale]))

        n = 3
        analysis["predict"] = [
            {"diagnosis": label, "probability": f"{prob:.2f}"}
            for label, prob in labels_probabilities[:n]
        ]
        analysis["summary"] = predicted_label # type: ignore

        for scale_cls in SleepDisorderScaleDataset.SCALE_CLASSES:
            schema = scale_cls.schema
            if schema.value not in scales_data:
                continue
            analysis["scales"][schema.value] = session.scales.result[schema.value] # type: ignore

        # 保存量表历史
        session.scales.analysis = ScalesAnalysis.from_dict(analysis)
        user.save()

        return jsonify(analysis)

    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/scales/<session_id>', methods=['POST'])
def submit_scales(session_id):
    return analyze_scales(session_id)

@app.route('/query', methods=['GET'])
def get_symptoms():
    symptoms = json.loads(open('./assets/symptoms.json', 'r').read())
    return jsonify(symptoms)

@app.route('/query/<session_id>', methods=['POST'])
def submit_query(session_id):
    """
    提交症状列表, 返回查询结果和推荐量表

    Args:
        session_id (str): session_id 
    """
    def parse_symptoms(symptom_names: list[str], symptom_data: list[dict]) -> tuple[list[str], list[str], list[int]]:
        """
        从症状名称列表获取对应的internal_name列表和相关问卷列表
        
        Args:
            symptom_names: 症状名称列表 (用户友好名称)
            symptom_data: 完整的症状数据结构
            
        Returns:
            tuple[list[str], list[str]]: (internal_name列表, 相关问卷列表)
        """
        internal_names = []
        related_scales = set()

        for category in symptom_data:
            for symptom in category["symptoms"]:
                # if symptom["name"] in symptom_names:
                if symptom["internal_name"] in symptom_names:
                    internal_names.append(symptom["internal_name"])
                    related_scales.update(symptom["related_scales"])

        related_scales_index: list[int] = []
        for related_scale in related_scales:
            related_scales_index.append(list(Schema).index(Schema(related_scale)) + 1)

        return internal_names, sorted(list(related_scales)), sorted(related_scales_index)

    try:
        session = user.get_session(session_id)
        data: list[str] = request.get_json()
        logger.info(data)
        symptoms = json.loads(open('./assets/symptoms.json', 'r').read())
        query_data, related_scales, related_scales_index = parse_symptoms(data, symptoms)

        logger.info(f"query_data: {query_data}")
        logger.info(f"related_scales: {related_scales}")
        logger.info(f"related_scales_index: {related_scales_index}")
        query = generate_submit_query(query_data)
        query_result = importer.execute(query)

        if not query_result:
            return jsonify({"error": "No matching items found"}), 404

        result = {
            "result": query_result,
            "related_scales_index": related_scales_index,
            "related_scales": related_scales
        }

        # result = query_result

        # 保存查询历史
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
            SystemMessage(MEDICAL_HISTORY_EXTRACTOR_SYSTEM_MSG),
            HumanMessage(text)
        ])

        history_item = HistoryItem(
            timestamp=datetime.utcnow().isoformat(),
            request=text,
            result=json.loads(str(extracted.content))
        )
        session.medical_histories.append(history_item)

        user.save()

        return jsonify(history_item)
    except:
        if os.path.exists(file_path):
            os.remove(file_path)
        return jsonify({'error': 'OCR failed'}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)