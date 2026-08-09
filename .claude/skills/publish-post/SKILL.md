---
name: publish-post
description: Use when publishing an article to the qusuc.github.io blog in ~/Code/me — the user pastes Markdown prose, points at an external .md file to import, asks for an English translation of an existing post, or says 发文章 / 发布 / 上线 / 把这篇发了 / publish this post.
---

# 发布博客文章

把一篇写好的文章变成 <https://qusuc.github.io/> 上线上可访问的页面。

## 产出契约

一次发布结束时，必须同时满足：

1. 文章位于 `content/<section>/<slug>/index.md`（page bundle，配图与 md 同目录）
2. `preflight.sh` 退出码为 0
3. 已 push，Actions 跑绿
4. `curl` 实际访问文章 URL 返回 200

**四项缺一项都不能报告"已发布"。** 尤其第 4 项：Actions 绿灯不等于线上正确。

## 五步

### 1. 定位与栏目

```bash
cd ~/Code/me
env -u GITHUB_TOKEN gh auth switch --user qusuc   # 必做，见下方排错表
```

选栏目：测试/QA、工程实践、工具折腾 → `post`（技术）；生活、读书、想法 → `essay`（随笔）。拿不准就问。

### 2. 建 page bundle

slug 用**英文小写短横线**，从内容含义提炼，不要用中文文件名（会被 URL 编码成一长串 `%xx`）。

```bash
hugo new post/<slug>/index.md      # 生成骨架，再往里填正文
```

### 3. front matter 契约

```yaml
---
title: "文章标题"                      # 中文标题不加书名号
date: 2026-08-09T19:20:00+04:00       # 必须带 +04:00；未来时间 Hugo 会静默跳过
draft: false
image: cover.png                      # 首页卡片缩略图，见第 4 步
categories:
    - 技术                             # 只能是「技术」或「随笔」，与 section 对应
tags:
    - Hugo                            # 优先复用已有标签，别造同义词
---
```

标签风格：专有名词用英文原名（Hugo、GitHub Pages、Playwright），通用概念用中文（记录、自动化测试）。preflight 会列出仓库里已有的标签；没有能复用的就新建，但同一篇里别同时放「自动化测试」和「回归测试」这种近义词。

### 4. 正文与配图处理

从外部 md 或粘贴的正文导入时，逐条处理：

| 原稿的样子 | 怎么处理 |
| --- | --- |
| 首行有 `# 一级标题` | 提取成 `title`，**从正文删掉**（主题会另外渲染标题，留着重复） |
| `![](./images/x.png)` 或 `images/x.png` | 图片拷进 bundle 根目录，引用改成 `![](x.png)` |
| 图片在别的目录 | 一并拷过来，别留外部绝对路径 |
| 任何情况 | `image:` 都单独做一张封面，**不要拿正文里的配图充当封面**——主题会在文章顶部再渲染一遍，同一张图出现两次 |

生成封面（1200×630，深色渐变 + 等宽字，与站点风格一致）：

```bash
magick -size 1200x630 gradient:'#0b1220-#1e3a5f' \
  \( -size 1200x630 xc:none -fill '#38bdf8' -draw "circle 980,120 980,20" -blur 0x60 \) -compose over -composite \
  \( -size 1200x630 xc:none -fill '#a78bfa' -draw "circle 180,560 180,470" -blur 0x70 \) -compose over -composite \
  -font "/System/Library/Fonts/SFNSMono.ttf" -pointsize 46 -fill '#e2e8f0' -annotate +90+300 '主标题' \
  -font "/System/Library/Fonts/SFNSMono.ttf" -pointsize 46 -fill '#64748b' -annotate +90+366 '副标题' \
  -font "/System/Library/Fonts/SFNSMono.ttf" -pointsize 24 -fill '#38bdf8' -annotate +90+470 'tag · tag · tag' \
  /tmp/cover.png
magick /tmp/cover.png -depth 8 -strip -quality 88 content/post/<slug>/cover.png
```

封面文字用英文/代码片段，中文字在 SFNSMono 下会缺字。生成后**必须 Read 一眼**再用。

### 5. 自检 → 发布 → 验证上线

```bash
.claude/skills/publish-post/preflight.sh content/post/<slug>/index.md
```

退出码非 0 就修，别跳过。全绿后：

```bash
git add . && git commit -m "post: <标题>"
# 切账号和 push 必须写在同一条命令里：本机 GITHUB_TOKEN 常驻，
# 活动账号会被改回公司号，preflight 时的绿不代表此刻还是绿
env -u GITHUB_TOKEN gh auth switch --user qusuc && env -u GITHUB_TOKEN git push origin main
env -u GITHUB_TOKEN gh run watch $(env -u GITHUB_TOKEN gh run list -R qusuc/qusuc.github.io \
  --workflow=hugo.yml --limit 1 --json databaseId --jq '.[0].databaseId') \
  -R qusuc/qusuc.github.io --exit-status
sleep 15
curl -s -o /dev/null -w '%{http_code}\n' https://qusuc.github.io/post/<slug>/
```

最后一行不是 200，就还没发布完。

## 双语

站点是中英双语，中文在根路径，英文在 `/en/`。**文章按需翻译**：

- `index.md` = 中文版，`index.en.md` = 英文版，同一个 bundle 共用配图和封面
- 只有中文版的文章不会出现在英文站，语言切换器会跳到英文首页——这是预期行为，不是 bug
- 英文版的 `categories` 必须用 **Tech / Essays**（不是技术/随笔），否则会新造分类页
- 英文版单独跑一次 `preflight.sh content/post/<slug>/index.en.md`，脚本会自动按 `.en.md` 切换校验规则

翻译时重写而不是直译：中文的行文节奏直译成英文会很别扭。技术术语、命令、输出保持原样。

## 排错

| 现象 | 原因与处理 |
| --- | --- |
| `push` 报 403 `denied to Dong-Qu_astg` | 本机三个 GitHub 账号，且环境里常驻 `GITHUB_TOKEN`，活动账号会自己飘回公司号。所有 gh/git 命令都要加 `env -u GITHUB_TOKEN`，且 switch 要和 push 写在同一条命令里。仓库级 `credential.*.username` 绑定无效——gh 的凭据助手只服务当前活动账号 |
| 构建成功但文章不出现 | ① `date` 是未来时间，Hugo 默认跳过未来文章 ② `draft` 还是 true ③ 目录名以 `_` 开头 |
| 构建报 `failed to load image config: unexpected EOF` | 图片是坏的/占位的假文件。Stack 主题要读图片尺寸，必须是真图 |
| 线上首页正常但内页全 404 | Pages 被切回 legacy 构建了。`gh api -X PUT repos/qusuc/qusuc.github.io/pages -f build_type=workflow` 再重跑 workflow |
| `themes/hugo-theme-stack` 是空的 | `git submodule update --init --recursive` |

## 边界

- 只改 `content/` 和文章目录里的文件。要改站点外观时用仓库根的 `layouts/` 覆盖层，**不要动 `themes/hugo-theme-stack/`**（submodule，升级会冲掉）
- 错别字和不通顺的句子提出来让用户定夺，不擅自改写作者的表达
