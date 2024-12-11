from abc import ABC, abstractmethod
import logging
from functools import wraps
from typing import Callable, TypeVar, ParamSpec

P = ParamSpec('P')
R = TypeVar('R')

def log_message(logger: logging.Logger) -> Callable[[Callable[P, R]], Callable[P, R]]:
    """消息日志装饰器"""
    def decorator(func: Callable[P, R]) -> Callable[P, R]:
        @wraps(func)
        def wrapper(self, *args: P.args, **kwargs: P.kwargs) -> R:
            session_identifier = getattr(self, 'title', None) or getattr(self, 'chat_code', 'Unknown')

            # 记录发送的消息
            message = args[0] if args else kwargs.get('message', '')
            logger.info(f"向会话 {session_identifier} 发送消息:")
            logger.info(f'{message}')

            # 执行实际的消息处理
            try:
                result = func(self, *args, **kwargs)

                # 记录响应
                logger.info("消息发送完成!")
                logger.info(f"响应: \n{result}")
                return result
            except Exception as e:
                logger.error(f"消息处理出错: {str(e)}")
                raise

        return wrapper
    return decorator

class ChatSessionInterface(ABC):
    """抽象基类，提供通用功能"""
    def __init__(self, logger_name: str = __name__):
        self.logger = logging.getLogger(logger_name)

    @abstractmethod
    def _process_message(self, message: str) -> str:
        """实际处理消息的抽象方法"""
        pass

    @log_message(logging.getLogger(__name__))
    def send_message(self, message: str) -> str:
        """包装了日志功能的消息发送方法"""
        return self._process_message(message)

    @abstractmethod
    def update_connection(self) -> None:
        pass
