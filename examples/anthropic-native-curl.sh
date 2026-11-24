#!/usr/bin/env bash
# Anthropic 原生协议示例：https://api.66code.cc
# 用法：export SIXTY_SIX_CODE_API_KEY="sk-..." MODEL_ID="<MODEL_ID>" && bash examples/anthropic-native-curl.sh
set -euo pipefail
: "${SIXTY_SIX_CODE_API_KEY:?请先 export SIXTY_SIX_CODE_API_KEY}"
: "${MODEL_ID:?请先 export MODEL_ID（从 66code 控制台复制真实模型 ID，如 claude-sonnet-5-5）}"

curl -sS https://api.66code.cc/v1/messages \
  -H "x-api-key: ${SIXTY_SIX_CODE_API_KEY}" \
  -H "anthropic-version: 2023-06-01" \
  -H "Content-Type: application/json" \
  -d "{\"model\": \"${MODEL_ID}\", \"max_tokens\": 256, \"messages\": [{\"role\": \"user\", \"content\": \"用一句话介绍你自己。\"}]}"
echo
