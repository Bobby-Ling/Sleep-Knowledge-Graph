# %%
from prompts_template import *
from openai import OpenAI
from openai.types import CompletionUsage
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

    # @override
    def _process_message(self, message: str, system_msg = API_COMMAND_MSG) -> str:
        completion = self.client.chat.completions.create(
            model=self.model,
            messages=[
                {"role": "system", "content": API_COMMAND_MSG},
                {"role": "user", "content": message}
            ]
        )
        result = completion.choices[0].message.content
        self.logger.info(completion.usage)
        return result or ''
    # @override
    def update_connection(self):
        pass
# %%
if __name__ == "__main__":
    client = OpenAI(
        base_url="https://api.gptsapi.net/v1",
        api_key="sk-v6b21de09961ae981a677f1d02c1f2ade61a1d01c4c9JHN4"
    )

    completion = client.chat.completions.create(
        model="gpt-4o-mini",
        messages=[
            {"role": "system", "content": API_COMMAND_MSG},
            {"role": "user", "content": DEMO_API_PAYLOAD}
        ]
    )
    message_content= completion.choices[0].message.content
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