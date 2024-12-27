import json
import os
import time

import requests

session_id = time.time()
url_create = f"http://113.44.52.217:5000/sessions/{session_id}"
payload = json.dumps({
   "title": "Admin Session"
})
headers = {
   'Content-Type': 'application/json'
}
requests.request("POST", url=url_create, headers=headers, data=payload)

url_query = f"http://113.44.52.217:5000/query/{session_id}"

for _, _, filenames in os.walk("output"):
    for i, filename in enumerate(filenames):
        with open(f'output/{filename}', "r", encoding='utf-8') as f:
            data = eval(f.read())
            # print(data["sample_symptom"])
            result = requests.request("POST", url=url_query, headers=headers, data=json.dumps(data["sample_symptom"]))
            # result.encoding = 'utf-8'
            result = json.dumps(result.json(), ensure_ascii=False)
            # print(result)
            data["response"] = result
        with open(f'output/{filename}', "w", encoding='utf-8') as f:
            f.write(str(data))