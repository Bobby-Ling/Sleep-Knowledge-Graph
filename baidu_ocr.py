# %%
from aip import AipOcr

""" 你的 APPID AK SK """
APP_ID = '116780038'
API_KEY = 'n9h8Si7uJwRScNh5QGfS0XZ2'
SECRET_KEY = 'fz6dfLXaz1mXdmAs6OJNCAHrDfqyu7k4'

ocr_client = AipOcr(APP_ID, API_KEY, SECRET_KEY)

def get_file_content(file_path):
    with open(file_path, 'rb') as fp:
        return fp.read()
