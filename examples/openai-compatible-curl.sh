#!/usr/bin/env bash
# OpenAI 兼容协议示例：https://api.66code.cc/v1
# 用法：export SIXTY_SIX_CODE_API_KEY="sk-..." MODEL_ID="<MODEL_ID>" && bash examples/openai-compatible-curl.sh
set -euo pipefail
: "${SIXTY_SIX_CODE_API_KEY:?请先 export SIXTY_SIX_CODE_API_KEY}"
: "${MODEL_ID:?请先 export MODEL_ID（从 66code 控制台复制真实模型 ID，如 gpt-6.2-sol）}"

curl -sS https://api.66code.cc/v1/chat/completions \
  -H "Authorization: Bearer ${SIXTY_SIX_CODE_API_KEY}" \
  -H "Content-Type: application/json" \
  -d "{\"model\": \"${MODEL_ID}\", \"messages\": [{\"role\": \"user\", \"content\": \"用一句话介绍你自己。\"}], \"stream\": false}"
echo
