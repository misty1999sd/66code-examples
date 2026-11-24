"""OpenAI 兼容协议示例：https://api.66code.cc/v1
用法：export SIXTY_SIX_CODE_API_KEY="sk-..." MODEL_ID="<MODEL_ID>" && python examples/openai-compatible-python.py
只用标准库，不依赖任何第三方包。
"""
import json
import os
import urllib.request

api_key = os.environ["SIXTY_SIX_CODE_API_KEY"]
model = os.environ["MODEL_ID"]  # 从 66code 控制台复制真实模型 ID，如 gpt-6.2-sol

req = urllib.request.Request(
    "https://api.66code.cc/v1/chat/completions",
    data=json.dumps(
        {
            "model": model,
            "messages": [{"role": "user", "content": "用一句话介绍你自己。"}],
        }
    ).encode(),
    headers={
        "Authorization": f"Bearer {api_key}",
        "Content-Type": "application/json",
    },
    method="POST",
)

with urllib.request.urlopen(req, timeout=60) as resp:
    print(json.loads(resp.read())["choices"][0]["message"]["content"])
