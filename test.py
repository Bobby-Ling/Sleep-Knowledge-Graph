from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import os
import json
import time

def get_poe_cookies(headless=False):
    """
    获取 poe.com 的所有 cookies
    Args:
        headless (bool): 是否使用无界面模式，默认False
    """
    # 获取适合当前系统的 Chrome 用户数据目录
    if os.name == 'nt':  # Windows
        user_data_dir = os.path.join(os.environ.get('LOCALAPPDATA', ''), 'Google', 'Chrome', 'User Data')
    else:  # Linux/Mac
        user_data_dir = os.path.join(os.path.expanduser('~'), '.config', 'google-chrome')

    options = Options()

    # 添加 headless 模式的相关参数
    if headless:
        options.add_argument('--headless=new')  # 使用新版 headless 模式
        options.add_argument('--disable-gpu')
        options.add_argument('--no-sandbox')
        options.add_argument('--disable-dev-shm-usage')
        # 设置窗口大小，避免一些渲染问题
        options.add_argument('--window-size=1920,1080')

    # 添加通用参数
    options.add_argument(f'user-data-dir={user_data_dir}')
    options.add_argument('--profile-directory=Default')
    options.add_argument('--disable-site-isolation-trials')
    options.add_argument('--disable-web-security')

    # 禁用自动化提示
    options.add_experimental_option('excludeSwitches', ['enable-automation'])
    options.add_experimental_option('useAutomationExtension', False)

    driver = webdriver.Chrome(options=options)

    try:
        print(f"Starting Chrome {'in headless mode' if headless else 'in normal mode'}...")
        driver.get('https://poe.com')
        time.sleep(2)  # 等待页面加载

        # 使用 CDP 获取所有 cookies
        all_cookies = driver.execute_cdp_cmd('Network.getAllCookies', {})

        # 筛选 poe.com 相关的 cookies
        poe_cookies = [
            cookie for cookie in all_cookies['cookies']
            if any(domain in cookie.get('domain', '') for domain in ['.poe.com', 'poe.com'])
        ]

        # 打印详细信息
        print(f"\nFound {len(poe_cookies)} cookies for poe.com:")
        for cookie in poe_cookies:
            print(f"\nName: {cookie['name']}")
            print(f"Value: {cookie['value']}")
            print(f"Domain: {cookie['domain']}")
            print(f"HttpOnly: {cookie.get('httpOnly', False)}")

        # 将结果保存到文件
        with open('poe_cookies.json', 'w') as f:
            json.dump(poe_cookies, f, indent=2)
        print(f"\nCookies saved to poe_cookies.json")

        return poe_cookies

    except Exception as e:
        print(f"Error during cookie extraction: {e}")
        return None

    finally:
        driver.quit()

def format_cookies_for_requests(cookies):
    """将 cookies 格式化为 requests 库可用的格式"""
    return {cookie['name']: cookie['value'] for cookie in cookies}

def get_specific_poe_tokens(cookies):
    """提取特定的 POE tokens"""
    needed_cookies = ['p-b', 'p-lat', 'formkey', '__cf_bm', 'cf_clearance']
    return {
        name: cookie['value']
        for cookie in cookies
        if cookie['name'] in needed_cookies
    }

# 使用示例
if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description='Get Poe.com cookies')
    parser.add_argument('--headless', action='store_true', help='Run in headless mode')
    args = parser.parse_args()

    try:
        # 获取cookies
        cookies = get_poe_cookies(headless=args.headless)

        if cookies:
            # 获取特定的tokens
            tokens = get_specific_poe_tokens(cookies)
            print("\nExtracted POE tokens:")
            for name, value in tokens.items():
                print(f"{name}: {value}")

            # 保存格式化的cookies
            formatted_cookies = format_cookies_for_requests(cookies)
            with open('poe_cookies_formatted.json', 'w') as f:
                json.dump(formatted_cookies, f, indent=2)
            print("\nFormatted cookies saved to poe_cookies_formatted.json")

    except Exception as e:
        print(f"Error: {e}")



"""
# %%
from openai import OpenAI
client = OpenAI(
    base_url="https://979944ad16b037580d565b98fd80bbf5.api-forwards.com/v1",
    api_key="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"
)

model = "gpt-4"

def query_model(prompt, model="gpt-4", max_tokens=200):
    response = client.completions.create(
        model=model,
        max_tokens=max_tokens,
        prompt=prompt
    )
    usage = response["usage"]  # 包含 token 使用情况
    prompt_tokens = usage["prompt_tokens"]
    completion_tokens = usage["completion_tokens"]
    total_tokens = usage["total_tokens"]
    return {
        "response": response["choices"][0]["message"]["content"],
        "prompt_tokens": prompt_tokens,
        "completion_tokens": completion_tokens,
        "total_tokens": total_tokens,
    }

if __name__ == "__main__":
    prompt = "请你解释一下量子力学的基本概念是什么? "
    result = query_model(prompt, model="gpt-4", max_tokens=300)

    print("AI 的回复:")
    print(result["response"])
    print("\nToken 使用详情:")
    print(f"Prompt tokens: {result['prompt_tokens']}")
    print(f"Completion tokens: {result['completion_tokens']}")
    print(f"Total tokens: {result['total_tokens']}")

"""