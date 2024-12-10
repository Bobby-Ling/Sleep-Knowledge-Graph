# %%
import logging
import os
from datetime import datetime
from time import sleep
from poe_api_wrapper import PoeApi
import cookie

LOG_FORMAT = '%(asctime)s - %(levelname)s - %(message)s'
# LOG_FORMAT = '%(message)s'

class ChatSession:
    def __init__(self, chat_manager: 'PoeChatManager', bot_name: str, chat_code: str, chat_id: int = None, title: str = None, dry_run: bool = False):
        self.chat_manager = chat_manager
        self.bot_name = bot_name
        self.chat_code = chat_code
        self.chat_id = chat_id
        self.title = title
        self.dry_run = dry_run
        self.logger = logging.getLogger(__name__)

    def send_message(self, message: str) -> str:
        """在当前会话中发送消息并获取响应"""
        self.logger.info(f"向会话 {self.title or self.chat_code} 发送消息:")
        self.logger.info(f'{message}')

        if self.dry_run:
            response = f"Response for: {message[:50]}..."
            self.logger.info("Dry run mode, returning mock response")
            return response

        response_text = ""
        for chunk in self.chat_manager.client.send_message(
                self.bot_name,
                message,
                chatCode=self.chat_code,
                chatId=self.chat_id
            ):
            chunk_response = chunk["response"]
            self.logger.info(chunk_response)
            response_text += chunk_response

        self.logger.info("消息发送完成!")
        self.logger.info(f"响应: \n{response_text}")
        return response_text

class PoeChatManager:
    def __init__(self, tokens: dict, log_level=logging.INFO, dry_run: bool = False):
        """
        初始化 Poe API 客户端
        :param tokens: 包含认证信息的字典
        :param log_level: 日志级别
        :param dry_run: 是否启用dry run模式
        """
        self.logger = logging.getLogger(__name__)
        self.setup_logging(log_level)
        tokens = tokens.copy()
        tokens.update(get_token_from_browser_cookies())
        self.client = PoeApi(tokens=tokens)
        self.dry_run = dry_run
        if dry_run:
            self.logger.info("Running in dry run mode")

    def setup_logging(self, log_level, log_format=LOG_FORMAT):
        """设置日志记录"""
        if not os.path.exists('logs'):
            os.makedirs('logs')

        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        log_file = f'logs/poe_chat_{timestamp}.log'

        # 设置logger的基础级别
        # 日志消息必须同时通过这两级过滤才会被记录
        self.logger.setLevel(logging.INFO)

        console_handler = logging.StreamHandler()
        console_handler.setLevel(log_level)

        file_handler = logging.FileHandler(log_file)
        file_handler.setLevel(logging.INFO)

        formatter = logging.Formatter(log_format)
        console_handler.setFormatter(formatter)
        file_handler.setFormatter(formatter)

        # 检查是否已经添加了处理器，避免重复添加
        if not self.logger.handlers:
            self.logger.addHandler(console_handler)
            self.logger.addHandler(file_handler)

    def update_tokens(self):
        self.client.tokens.update(get_token_from_browser_cookies())

    def get_session_by_title(self, bot_name: str, chat_title: str) -> ChatSession:
        """
        根据会话标题查找并返回现有会话
        :param bot_name: 机器人名称
        :param chat_title: 会话标题
        :return: ChatSession对象 或 None(如果未找到)
        """
        if self.dry_run:
            self.logger.info(f"Dry run: 模拟查找会话: {chat_title}")
            return ChatSession(self, bot_name, "dry_run_code", 0, chat_title, self.dry_run)

        existing_chats = self.client.get_chat_history(bot=bot_name)['data']

        for chat in existing_chats.get(bot_name, []):
            if chat['title'] == chat_title:
                self.logger.info(f"找到已有会话: {chat_title} (chatCode: {chat['chatCode']})")
                return ChatSession(
                    self,
                    bot_name,
                    chat['chatCode'],
                    chat['chatId'],
                    chat_title,
                    self.dry_run
                )

        self.logger.info(f"未找到匹配的会话: {chat_title}")
        return None

    def create_session(self, bot_name: str, initial_message: str = "Hello! Let's start a new conversation.") -> ChatSession:
        """
        创建一个新的会话
        :param bot_name: 机器人名称
        :param initial_message: 初始消息
        :return: ChatSession对象
        """
        self.logger.info("创建新会话")

        if self.dry_run:
            self.logger.info("Dry run: 模拟创建新会话")
            return ChatSession(
                self,
                bot_name,
                "dry_run_code",
                0,
                "Dry Run Session",
                self.dry_run
            )

        response = None
        for chunk in self.client.send_message(bot_name, initial_message):
            response = chunk

        chat_code = response["chatCode"]
        chat_id = response["chatId"]
        chat_title = response['title']

        self.logger.info(f"新会话已创建: {chat_title} (chatCode: {chat_code})")
        return ChatSession(self, bot_name, chat_code, chat_id, chat_title, self.dry_run)

    def get_session(self, bot_name: str, chat_code: str = None, chat_id: int = None) -> ChatSession:
        """
        通过chatCode或chatId获取指定会话
        :param bot_name: 机器人名称
        :param chat_code: 会话代码
        :param chat_id: 会话ID
        :return: ChatSession对象
        """
        if not (chat_code or chat_id):
            raise ValueError("必须提供chat_code或chat_id之一")

        if self.dry_run:
            self.logger.info(f"Dry run: 模拟获取会话 (code: {chat_code}, id: {chat_id})")
            return ChatSession(self, bot_name, chat_code or "dry_run_code", chat_id or 0, dry_run=self.dry_run)

        return ChatSession(self, bot_name, chat_code, chat_id, dry_run=self.dry_run)

    def get_or_create_session(self, bot_name: str, chat_title: str = None,
                              initial_message: str = "Hello! Let's start a new conversation.") -> ChatSession:
        """
        获取现有会话或创建新会话
        :param bot_name: 机器人名称
        :param chat_title: 目标会话标题（仅用于查找现有会话）
        :param initial_message: 如果需要创建新会话，发送的初始消息
        :return: ChatSession对象
        """
        if chat_title:
            session = self.get_session_by_title(bot_name, chat_title)
            if session:
                return session

        return self.create_session(bot_name, initial_message)

# %%
def get_token_from_browser_cookies():
    cookie_extractor = cookie.CookieExtractor(base_url="poe.com", headless=True)

    _, tokens = cookie_extractor.get_cookies(['p-b', 'p-lat', '__cf_bm', 'cf_clearance'])

    print('---------------------------------')
    print(tokens)
    print('---------------------------------')
    return tokens

# %%
if __name__ == "__main__":
    chat_manager = PoeChatManager(tokens={}, dry_run=False)

    bot_name = "Assistant"
    session: ChatSession = chat_manager.get_session(bot_name=bot_name, chat_code='2wdaov98l5gqx9kfse1')
    response = session.send_message("how are you?")
