# ChatGPT Prompt PopClip Extension

一个支持“先补充问题，再发送”的 ChatGPT PopClip 扩展。

## 先看这里（怎么用）

1. 在 [Releases](https://github.com/GravityPoet/popclip-chatgpt-prompt-extension/releases) 下载 `ChatGPTPrompt.popclipextz` 并双击安装。
2. 在任意应用里划词，点击 PopClip 的 ChatGPT 图标。
3. 在弹窗输入补充问题，按回车或点“发送”。
4. 插件会自动拼接结构化提示词，并跳转到 ChatGPT。
5. 到 ChatGPT 页面后手动点击发送（或按回车）。

## 下载

- Release 页面：<https://github.com/GravityPoet/popclip-chatgpt-prompt-extension/releases>
- 稳定版（手动发送）（2026-02-18）：<https://github.com/GravityPoet/popclip-chatgpt-prompt-extension/releases/download/v2026.02.18.5/ChatGPTPrompt.popclipextz>

## 提示词格式

```text
【原文】
<选中文本>

【问题】
<补充问题>
```

## 相比旧插件（73pbck）的优势

1. 发送前有“补问对话框”，不是只把原文扔过去。
2. 自动输出结构化提示词，长文本场景更清晰。
3. 保留 `https://chatgpt.com/?q=` 的直发路径，使用成本低。

## 稳定性与兜底

- 主路径：优先唤起 Chrome 并新开标签跳转 ChatGPT。
- 不执行自动发送，避免账号/页面状态造成误触发。
- 内容也会写入剪贴板；若页面未自动带上文本，可直接粘贴发送。

## 官方插件列表状态

- 已提交官方目录 PR（OPEN）：<https://github.com/pilotmoon/PopClip-Extensions/pull/1323>
- 在官方合并前，请先从本仓库 Releases 安装。

## 目录

- `ChatGPTPrompt.popclipext/Config.json`
- `ChatGPTPrompt.popclipext/chatgpt.applescript`
- `ChatGPTPrompt.popclipext/Readme.md`
