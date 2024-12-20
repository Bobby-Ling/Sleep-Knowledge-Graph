# %%
import json
import os
from typing import Any, List, Optional, Sequence

import appbuilder
from appbuilder import AppBuilderClient, Message
from langchain.callbacks.manager import CallbackManagerForLLMRun
from langchain.llms.base import LLM
from langchain.prompts import PromptTemplate
from langchain_core._api import deprecated
from langchain_core.language_models.base import BaseLanguageModel
from langchain_core.messages import BaseMessage
from langchain_core.outputs import LLMResult
from langchain_core.prompt_values import PromptValue
from langchain_core.callbacks.base import BaseCallbackHandler, BaseCallbackManager

from prompts_template import *

os.environ["APPBUILDER_TOKEN"] = "bce-v3/ALTAK-dz2T9w26uHBTw3DWWeNp2/8094ad4d9033ce35390cd6bece585e47a7bd0893"

app_id = "a4a01e79-a41f-47cb-b1de-d159ed499ad2"

# app_builder_client = appbuilder.AppBuilderClient(app_id)
# conversation_id = app_builder_client.create_conversation()

# resp = app_builder_client.run(conversation_id, "你好，你能做什么？")
# print(resp.content.answer) # type: ignore

def parse_result(resp):
    result = {
        "content": "",
        "followup_query": [],
        "references": []
    }
    events = resp.content.events # type: ignore
    for event in events:
        # Get content/answer
        if event.event_type == 'RAGAgent' and event.content_type == 'rag':
            if 'text' in event.detail:
                result['content'] = event.detail['text']

        # Get followup queries
        if event.event_type == 'FollowUpQuery' and event.content_type == 'json':
            if 'follow_up_querys' in event.detail['json']:
                result['followup_query'].extend(event.detail['json']['follow_up_querys'])

        # Get references
        if event.event_type == 'RAGAgent' and event.content_type == 'rag':
            if 'references' in event.detail and event.detail['references']:
                for ref in event.detail['references']:
                    result['references'].append({
                        'content': ref['content'],
                        'title': ref.get('title', ''),
                        'document_name': ref.get('document_name', ''),
                        'score': ref.get('score', 0)
                    })

    return result
# print(json.dumps(parse_events(resp.content.events), indent=4, ensure_ascii=False)) # type: ignore

# %%
class AppBuilderLLM(BaseLanguageModel):
    app_builder_client: AppBuilderClient
    conversation_id: str
    response: dict

    def __init__(self, app_builder_client, conversation_id=None):
        super().__init__()
        self.app_builder_client = app_builder_client
        if conversation_id is None:
            conversation_id = app_builder_client.create_conversation()
        self.conversation_id = conversation_id

    @property
    def _llm_type(self) -> str:
        return "appbuilder"

    @staticmethod
    def parse_events(events):
        result = {
            "content": "",
            "followup_query": [],
            "references": []
        }

        for event in events:
            # Get content/answer
            if event.event_type == 'RAGAgent' and event.content_type == 'rag':
                if 'text' in event.detail:
                    result['content'] = event.detail['text']

            # Get followup queries
            if event.event_type == 'FollowUpQuery' and event.content_type == 'json':
                if 'follow_up_querys' in event.detail['json']:
                    result['followup_query'].extend(event.detail['json']['follow_up_querys'])

            # Get references
            if event.event_type == 'RAGAgent' and event.content_type == 'rag':
                if 'references' in event.detail and event.detail['references']:
                    for ref in event.detail['references']:
                        result['references'].append({
                            'content': ref['content'],
                            'title': ref.get('title', ''),
                            'document_name': ref.get('document_name', ''),
                            'score': ref.get('score', 0)
                        })

        return result

    def invoke(self, input: str, config: Optional[dict] = None, **kwargs) -> str:
        """调用模型"""
        self.response = parse_result(self.app_builder_client.run(self.conversation_id, input).content.event) # type: ignore
        return self.response["content"]

    def get_followup_queries(self, input: str) -> List[str]:
        """获取建议的跟进问题"""
        return self.response["followup_query"]

    def get_references(self, input: str) -> List[Any]:
        """获取引用信息"""
        return self.response["references"]

    def generate_prompt(self, prompts: List[PromptValue], stop: List[str] | None = None, callbacks: List[BaseCallbackHandler] | BaseCallbackManager | None = None, **kwargs: Any) -> LLMResult:
        raise NotImplementedError

    async def agenerate_prompt(self, prompts: List[PromptValue], stop: List[str] | None = None, callbacks: List[BaseCallbackHandler] | BaseCallbackManager | None = None, **kwargs: Any) -> LLMResult:
        raise NotImplementedError

    @deprecated("0.1.7", alternative="invoke", removal="1.0")
    def predict(self, text: str, *, stop: Sequence[str] | None = None, **kwargs: Any) -> str:
        raise NotImplementedError

    @deprecated("0.1.7", alternative="invoke", removal="1.0")
    def predict_messages(self, messages: List[BaseMessage], *, stop: Sequence[str] | None = None, **kwargs: Any) -> BaseMessage:
        raise NotImplementedError

    @deprecated("0.1.7", alternative="ainvoke", removal="1.0")
    async def apredict(self, text: str, *, stop: Sequence[str] | None = None, **kwargs: Any) -> str:
        raise NotImplementedError

    @deprecated("0.1.7", alternative="ainvoke", removal="1.0")
    async def apredict_messages(self, messages: List[BaseMessage], *, stop: Sequence[str] | None = None, **kwargs: Any) -> BaseMessage:
        raise NotImplementedError


# 使用示例
def create_chain():
    app_builder_client = appbuilder.AppBuilderClient(app_id)
    llm = AppBuilderLLM(app_builder_client)


    template = """Human: {human_input}
Assistant: Let me help you with that."""

    prompt = PromptTemplate(
        input_variables=["human_input"],
        template=template
    )

    chain = prompt | llm

    return chain

# app_builder_client = appbuilder.AppBuilderClient(app_id)
# llm = AppBuilderLLM(app_builder_client)

# response = llm.invoke("你好，你能做什么？")
# print(f"回答: {response}")

# followup = llm.get_followup_queries("你好，你能做什么？")
# print(f"建议的跟进问题: {followup}")

# references = llm.get_references("你好，你能做什么？")
# print(f"引用信息: {references}")

# # %%
# chain = create_chain()
# response = chain.invoke({"human_input": "你好，你能做什么？"})
# print(response)