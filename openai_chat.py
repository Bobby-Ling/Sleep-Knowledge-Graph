# %%
from prompts_template import *
from openai import OpenAI
from openai.types import CompletionUsage
from openai.types.chat import ChatCompletion
from chat_session_interfce import ChatSessionInterface

client1 = OpenAI(
    base_url="https://api.gptsapi.net/v1",
    api_key="sk-v6b21de09961ae981a677f1d02c1f2ade61a1d01c4c9JHN4"
)
client2 = OpenAI(
    base_url="https://api.gptsapi.net/v1",
    api_key="sk-amhe77fe8ab40099842b3a69df61a6ab733a02cb4c2eQON8"
)

class OpenAIChatSession(ChatSessionInterface):
    def __init__(self, client: OpenAI, model = "gpt-4o-mini", logger_name = __name__):
        super().__init__(logger_name)
        self.client = client
        self.model = model
        self.completion: ChatCompletion

    # @override
    def _process_message(self, message: str, system_msg = API_COMMAND_MSG) -> str:
        self.completion = self.client.chat.completions.create(
            model=self.model,
            messages=[
                {"role": "system", "content": system_msg},
                {"role": "user", "content": message}
            ]
        )
        result = self.completion.choices[0].message.content
        self.logger.info(self.completion.usage)
        return result or ''
    # @override
    def update_connection(self):
        pass
# %%
SYSTEM_MSG = ""
PAYLOAD = ""

SYSTEM_MSG = """
[角色任务]
你是一名医疗睡眠助手, 用于基层医疗分诊;
你的主要任务是帮助用户解决睡眠问题, 提供相关的建议和解决方案;
你需要我在[工具能力]中提供的neo4j查询结果, 过滤不常见的部分, 适当修饰表达, 依照[输出示例]给出json格式回答

[工具能力]
你可以获取neo4j睡眠医疗知识图谱的json格式查询结果;

[输出示例]
"""

SYSTEM_MSG = """
[角色任务]
你是一名医疗睡眠助手, 用于基层医疗分诊;
你的主要任务是帮助用户解决睡眠问题, 提供相关的建议和解决方案;
你需要我在[工具能力]中提供的neo4j查询结果, 修饰表达, 给出用户友好的markdown格式回答

[回答需求]
1. 专业性
你需要以专业的态度和能力为用户提供建议, 确保建议的有效性和可靠性. 
你的回答要覆盖大部分neo4j查询结果提到的内容
2. 不要包括打招呼等无关信息

[工具能力]
你可以获取neo4j睡眠医疗知识图谱的[查询结果]如下:
"""

PAYLOAD = """
[查询结果]
"""

# %%
if __name__ == "__main__":
    chat = OpenAIChatSession(client=client1)

    message_content= chat._process_message(message=PAYLOAD, system_msg=SYSTEM_MSG)
    completion = chat.completion

    tokens_used= completion.usage or CompletionUsage
    prompt_tokens = tokens_used.prompt_tokens
    completion_tokens = tokens_used.completion_tokens
    total_tokens = tokens_used.total_tokens

    print(message_content)
    """
    Prompt tokens: 2056
    Completion tokens: 688
    Total tokens: 2744
    """
    print(f"Prompt tokens: {prompt_tokens}")
    print(f"Completion tokens: {completion_tokens}")
    print(f"Total tokens: {total_tokens}")


# %%