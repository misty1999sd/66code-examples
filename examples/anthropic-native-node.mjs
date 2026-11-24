// Anthropic 原生协议示例：https://api.66code.cc
// 用法：export SIXTY_SIX_CODE_API_KEY="sk-..." MODEL_ID="<MODEL_ID>" && node examples/anthropic-native-node.mjs
// 只用 Node 内置 fetch（Node 18+），不依赖任何第三方包。
const apiKey = process.env.SIXTY_SIX_CODE_API_KEY;
const model = process.env.MODEL_ID; // 从 66code 控制台复制真实模型 ID，如 claude-sonnet-5-5
if (!apiKey || !model) {
  console.error("请先 export SIXTY_SIX_CODE_API_KEY 和 MODEL_ID");
  process.exit(1);
}

const resp = await fetch("https://api.66code.cc/v1/messages", {
  method: "POST",
  headers: {
    "x-api-key": apiKey,
    "anthropic-version": "2023-06-01",
    "Content-Type": "application/json",
  },
  body: JSON.stringify({
    model,
    max_tokens: 256,
    messages: [{ role: "user", content: "用一句话介绍你自己。" }],
  }),
});
const data = await resp.json();
console.log(data.content?.[0]?.text ?? data);
