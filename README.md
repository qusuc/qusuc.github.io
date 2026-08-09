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
想要卡片封面图，在 front matter 里加 `image: cover.jpg`。

写完把 front matter 的 `draft: true` 改成 `false`，然后：

```bash
git add . && git commit -m "post: 标题" && git push
```

push 到 `main` 后 Actions 自动构建部署，约 1–2 分钟上线。

## 目录说明

| 路径 | 作用 |
| --- | --- |
| `config/_default/hugo.toml` | 站点标题、网址、分页、代码高亮 |
| `config/_default/menu.toml` | 导航菜单和社交图标 |
| `config/_default/params.toml` | 主题参数：侧栏、小组件、评论 |
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
