# qusuc.github.io

个人博客源码。Hugo + [Stack 主题](https://github.com/CaiJimmy/hugo-theme-stack)，GitHub Actions 自动构建，发布到 GitHub Pages。

线上地址：<https://qusuc.github.io/>

## 本地跑起来

```bash
brew install hugo                    # 首次
git clone --recurse-submodules https://github.com/qusuc/qusuc.github.io.git
cd qusuc.github.io
hugo server -D                       # http://localhost:1313
```

> 如果 clone 时忘了 `--recurse-submodules`，补一句 `git submodule update --init --recursive`，否则主题目录是空的、构建会报错。

## 写文章

```bash
hugo new post/my-slug/index.md       # 技术
hugo new essay/my-slug/index.md      # 随笔
```

配图直接放进文章目录，md 里用相对路径引用：`![说明](screenshot.png)`。
想要卡片封面图，在 front matter 里加 `image: cover.png`。

写完把 front matter 的 `draft: true` 改成 `false`，发布前先自检：

```bash
.claude/skills/publish-post/preflight.sh content/post/my-slug/index.md
```

退出码 0 才发：

```bash
git add . && git commit -m "post: 标题" && git push
```

push 到 `main` 后 Actions 自动构建部署，约 1–2 分钟上线。

> 交给 Claude 发布：直接说「把这篇发了」，会走 `.claude/skills/publish-post/` 这个 skill——自动补 front matter、搬配图、生成封面、自检、推送、验证上线。

## 中英双语

中文在根路径，英文在 `/en/`。**文章按需翻译**：

| 文件 | 语言 | 网址 |
| --- | --- | --- |
| `content/post/<slug>/index.md` | 中文 | `/post/<slug>/` |
| `content/post/<slug>/index.en.md` | 英文 | `/en/post/<slug>/` |

同一个目录共用配图和封面。只有中文版的文章不会出现在英文站，侧栏语言切换器会跳到英文首页。

英文版的 `categories` 用 `Tech` / `Essays`（中文版用「技术」/「随笔」）。界面文案由主题的 i18n 自动切换，两边的导航分别配在 `config/_default/menus.zh.toml` 和 `menus.en.toml`。

## 目录说明

| 路径 | 作用 |
| --- | --- |
| `config/_default/hugo.toml` | 网址、分页、代码高亮、多语言开关 |
| `config/_default/languages.toml` | 中英文各自的站点标题和副标题 |
| `config/_default/menus.{zh,en}.toml` | 两种语言的导航菜单和社交图标 |
| `config/_default/params.toml` | 主题参数：侧栏、小组件、评论 |
| `.claude/skills/publish-post/` | 发布文章的 skill + 发布前自检脚本 |
| `content/post/` | 技术栏目 |
| `content/essay/` | 随笔栏目 |
| `content/page/` | 关于 / 归档 / 搜索 |
| `layouts/` | 覆盖主题模板（同名文件优先级高于主题） |
| `themes/hugo-theme-stack/` | 主题 submodule，**不要直接改这里** |

## 主题升级

```bash
git submodule update --remote --merge themes/hugo-theme-stack
hugo server -D      # 本地确认没崩
git commit -am "chore: 升级 Stack 主题" && git push
```
