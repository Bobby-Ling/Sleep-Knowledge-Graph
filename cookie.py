from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from urllib.parse import urlparse
import os
import json
import time
import logging
from typing import Dict, List, Optional, Union

class CookieExtractor:
    def __init__(self, base_url: str, headless: bool = True, user_profile: str = None):
        """
        初始化Cookie提取器
        
        Args:
            base_url (str): 目标网站URL
            headless (bool): 是否使用无界面模式
            user_profile (str): Chrome用户配置文件路径，为None则使用系统默认路径
        """
        self.base_url = self._normalize_url(base_url)
        self.domain = self._extract_domain(base_url)
        self.headless = headless
        self.user_profile = user_profile or self._get_default_profile()
        self.setup_logging()

    @staticmethod
    def _normalize_url(url: str) -> str:
        """标准化URL格式"""
        if not url.startswith(('http://', 'https://')):
            url = 'https://' + url
        return url

    @staticmethod
    def _extract_domain(url: str) -> str:
        """从URL中提取域名"""
        domain = urlparse(CookieExtractor._normalize_url(url)).netloc
        return domain if domain.startswith('.') else '.' + domain

    def setup_logging(self):
        """配置日志"""
        logging.basicConfig(
            level=logging.INFO,
            format='%(asctime)s - %(levelname)s - %(message)s'
        )
        self.logger = logging.getLogger(__name__)

    @staticmethod
    def _get_default_profile() -> str:
        """获取当前系统的Chrome默认用户配置文件路径"""
        if os.name == 'nt':  # Windows
            return os.path.join(os.environ.get('LOCALAPPDATA', ''), 'Google', 'Chrome', 'User Data')
        else:  # Linux/Mac
            return os.path.join(os.path.expanduser('~'), '.config', 'google-chrome')

    def _setup_driver_options(self) -> Options:
        """配置Chrome选项"""
        options = Options()

        # Headless模式配置
        if self.headless:
            options.add_argument('--headless=new')
            options.add_argument('--disable-gpu')
            options.add_argument('--no-sandbox')
            options.add_argument('--disable-dev-shm-usage')
            options.add_argument('--window-size=1920,1080')

        # 通用配置
        options.add_argument(f'user-data-dir={self.user_profile}')
        options.add_argument('--profile-directory=Default')
        options.add_argument('--disable-site-isolation-trials')
        options.add_argument('--disable-web-security')

        # 禁用自动化提示
        options.add_experimental_option('excludeSwitches', ['enable-automation'])
        options.add_experimental_option('useAutomationExtension', False)

        return options

    def get_cookies(self, specific_cookies: List[str] = None, wait_time: int = 2) -> Optional[List[Dict]]:
        """
        获取指定网站的cookies
        
        Args:
            specific_cookies: 需要特别提取的cookie名称列表
            wait_time: 等待页面加载的时间(秒)
            
        Returns:
            List[Dict]: 包含cookie信息的字典列表
        """
        driver = None
        try:
            self.logger.info(f"Starting Chrome {'headless' if self.headless else 'normal'} mode...")
            driver = webdriver.Chrome(options=self._setup_driver_options())

            self.logger.info(f"Accessing {self.base_url}")
            driver.get(self.base_url)
            time.sleep(wait_time)

            # 获取所有cookies
            all_cookies = driver.execute_cdp_cmd('Network.getAllCookies', {})

            # 筛选指定域名的cookies
            domain_cookies = [
                cookie for cookie in all_cookies['cookies']
                if any(domain in cookie.get('domain', '') for domain in [f'{self.domain}', f'{self.domain[1:]}'])
            ]

            # 如果指定了特定cookie，则只返回这些cookie
            if specific_cookies:
                domain_cookies = [
                    cookie for cookie in domain_cookies
                    if cookie['name'] in specific_cookies
                ]

            self.logger.info(f"Found {len(domain_cookies)} cookies for {self.domain}")
            # self._save_cookies(domain_cookies)

            return domain_cookies, self.format_for_requests(domain_cookies)

        except Exception as e:
            self.logger.error(f"Error extracting cookies: {e}")
            return None

        finally:
            if driver:
                driver.quit()

    def _save_cookies(self, cookies: List[Dict], filename: str = None):
        """保存cookies到文件"""
        if not filename:
            filename = f"cookies_{self.domain.lstrip('.')}.json"

        try:
            # 保存详细信息
            with open(filename, 'w') as f:
                json.dump(cookies, f, indent=2)
            self.logger.info(f"Cookies saved to {filename}")

            # 保存格式化的版本（用于requests）
            formatted_filename = f"formatted_{filename}"
            formatted_cookies = self.format_for_requests(cookies)
            with open(formatted_filename, 'w') as f:
                json.dump(formatted_cookies, f, indent=2)
            self.logger.info(f"Formatted cookies saved to {formatted_filename}")

        except Exception as e:
            self.logger.error(f"Error saving cookies: {e}")

    @staticmethod
    def format_for_requests(cookies: List[Dict]) -> Dict[str, str]:
        """将cookies格式化为requests库可用的格式"""
        return {cookie['name']: cookie['value'] for cookie in cookies}

def main():
    import argparse

    parser = argparse.ArgumentParser(description='Extract cookies from any website')
    parser.add_argument('url', help='Target website URL')
    parser.add_argument('--headless', action='store_true', help='Run in headless mode')
    parser.add_argument('--cookies', nargs='+', help='Specific cookie names to extract')
    parser.add_argument('--wait', type=int, default=2, help='Wait time in seconds')
    parser.add_argument('--profile', help='Chrome user profile path')

    args = parser.parse_args()

    extractor = CookieExtractor(
        base_url=args.url,
        headless=args.headless,
        user_profile=args.profile
    )

    cookies, _ = extractor.get_cookies(
        specific_cookies=args.cookies,
        wait_time=args.wait
    )

    if cookies:
        print("\nExtracted cookies:")
        for cookie in cookies:
            print(f"\nName: {cookie['name']}")
            print(f"Value: {cookie['value'][:30]}{'...' if len(cookie['value']) > 30 else ''}")
            print(f"Domain: {cookie['domain']}")
            print(f"HttpOnly: {cookie.get('httpOnly', False)}")

# if __name__ == "__main__":
#     main()

def get_token_from_browser_cookies():
    cookie_extractor = CookieExtractor(base_url="poe.com", headless=True)

    _, tokens = cookie_extractor.get_cookies(['p-b', 'p-lat', '__cf_bm', 'cf_clearance'])
    # tokens = cookie_extractor.get_cookies()

    print('---------------------------------')
    print(tokens)
    print('---------------------------------')
    return tokens

# 使用示例
if __name__ == "__main__":
    # monitor_browser_cookies()
    get_token_from_browser_cookies()