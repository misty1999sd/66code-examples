# 66code API Examples

Working code examples for the [66code](https://www.66code.cc/) AI API gateway — one API key for the latest Claude, GPT, Gemini, Grok, DeepSeek, Kimi, GLM and MiniMax models, with both OpenAI-compatible and Anthropic-native endpoints.

66code 接入示例：一个 Key 调用最新款 Claude、GPT、Gemini 等多家前沿模型，OpenAI 兼容与 Anthropic 原生双协议最小可跑代码。

## Endpoints

| Protocol | Base URL |
|---|---|
| OpenAI-compatible | `https://api.66code.cc/v1` |
| Anthropic-native | `https://api.66code.cc` |

## Quick start

```bash
export SIXTY_SIX_CODE_API_KEY="sk-..."   # your 66code API key
export MODEL_ID="gpt-6.2-sol"            # any model ID from the 66code console
```

## Popular model IDs

| Family | Model IDs |
|---|---|
| Claude | `claude-fable-5-2`, `claude-opus-5-5`, `claude-sonnet-5-5`, `claude-haiku-5-5` |
| GPT | `gpt-6.2-sol`, `gpt-6.2-astra` |
| Gemini | `gemini-4-argon`, `gemini-4-carbon`, `gemini-4-hydrogen`, `gemini-4-neon` |
| DeepSeek | `DeepSeek-V4.1-Flash`, `deepseek-v4-pro` |
| Image | `gpt-image-2.6` |

The Gemini 4 series is the stability pick of the house. Examples in this repo default to the latest models above; swap `MODEL_ID` to switch.

## Examples

- `examples/openai-compatible-curl.sh` — OpenAI-compatible chat completion with curl
- `examples/openai-compatible-python.py` — OpenAI-compatible chat completion with the Python `openai` SDK
- `examples/anthropic-native-curl.sh` — Anthropic-native Messages API with curl
- `examples/anthropic-native-node.mjs` — Anthropic-native Messages API from Node.js

## Use with Claude Code

Point the Anthropic base URL to `https://api.66code.cc` and use your 66code key — no other changes needed.

## Usage tips

- Create one sub-key per purpose (coding, scripts, experiments), each with its own quota cap, so a runaway script can only burn its own budget.
- Check per-key usage in the console after a run to catch abnormal retries early.
- Start small, verify the billing matches your calls, then move real workloads over.

## Notes

- Pay as you go; balance never expires and unused balance can be refunded.
- On channel failure, requests switch only between backup channels of the same model — the model is never silently swapped.
