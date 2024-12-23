# %%
# 安装说明：
# 执行如下命令，快速安装Python语言的最新版本AppBuilder-SDK（要求Python >= 3.9)：
# pip install --upgrade appbuilder-sdk
import json
import appbuilder
import os

# 设置环境中的TOKEN，以下TOKEN请替换为您的个人TOKEN，个人TOKEN可通过该页面【获取鉴权参数】或控制台页【密钥管理】处获取
os.environ["APPBUILDER_TOKEN"] = "bce-v3/ALTAK-dz2T9w26uHBTw3DWWeNp2/8094ad4d9033ce35390cd6bece585e47a7bd0893"

# 从AppBuilder控制台【个人空间】-【应用】网页获取已发布应用的ID
app_id = "f93d7dc8-ee70-4aba-babc-382a121dc5ef"

app_builder_client = appbuilder.AppBuilderClient(app_id)
conversation_id = app_builder_client.create_conversation()

resp = app_builder_client.run(conversation_id, "打鼾")
print(json.dumps(json.loads(resp.content.answer), indent=4, ensure_ascii=False)) # type: ignore
