# ChatGPT Prompt PopClip Extension

一个支持“先补充问题，再发送”的 ChatGPT PopClip 扩展。

## 先看这里（怎么用）

1. 在 [Releases](https://github.com/GravityPoet/popclip-chatgpt-prompt-extension/releases) 下载 `ChatGPTPrompt.popclipextz` 并双击安装。
2. 在任意应用里划词，点击 PopClip 的 ChatGPT 图标。
3. 在弹窗输入补充问题，按回车或点“发送”。
4. 插件会自动拼接结构化提示词，并跳转到 ChatGPT。
5. 试验版会尝试自动按 Enter 发送（需辅助功能权限）。

## 下载

- Release 页面：<https://github.com/GravityPoet/popclip-chatgpt-prompt-extension/releases>
- 自动发送试验版（2026-02-18）：<https://github.com/GravityPoet/popclip-chatgpt-prompt-extension/releases/download/v2026.02.18.3/ChatGPTPrompt.popclipextz>
- 上一稳定版（手动回车）（2026-02-18）：<https://github.com/GravityPoet/popclip-chatgpt-prompt-extension/releases/download/v2026.02.18.2/ChatGPTPrompt.popclipextz>

## 提示词格式

```text
【原文】
<选中文本>

【问题】 <补充问题>
```

## 相比旧插件（73pbck）的优势

1. 发送前有“补问对话框”，不是只把原文扔过去。
2. 自动输出结构化提示词，长文本场景更清晰。
3. 保留 `https://chatgpt.com/?q=` 的直发路径，使用成本低。

## 稳定性与兜底

- 主路径：优先唤起 Chrome 并新开标签跳转 ChatGPT。
- 试验能力：自动发送版会在跳转后模拟按下 Enter。
- 权限要求：需在 macOS「系统设置 -> 隐私与安全性 -> 辅助功能」里允许 PopClip（必要时也允许终端）。
- 回退路径：若自动发送失败，内容仍会写入剪贴板，可手动回车发送。

## 官方插件列表状态

- 已提交官方目录 PR（OPEN）：<https://github.com/pilotmoon/PopClip-Extensions/pull/1323>
- 在官方合并前，请先从本仓库 Releases 安装。

## 目录

- `ChatGPTPrompt.popclipext/Config.json`
- `ChatGPTPrompt.popclipext/chatgpt.applescript`
- `ChatGPTPrompt.popclipext/Readme.md`
