# 个人博客站点设计

日期：2026-08-09
状态：已确认

## 1. 目标

搭建一个个人博客，内容为「技术 + 生活随笔」混合，参考 <https://tyrchen.github.io/> 的卡片式列表与多栏目结构。全部资产（内容、配图、评论、构建、托管）都放在 GitHub 上，零运营成本。

## 2. 关键决策

| 决策点 | 选择 | 理由 |
|---|---|---|
| 静态站点生成器 | Hugo（extended，0.164.0） | 单二进制、无 Node/Ruby 依赖、构建秒级 |
| 主题 | hugo-theme-stack | 卡片式 + 缩略图 + 侧栏，自带搜索/标签/归档/评论，中文排版好 |
| 主题引入方式 | git submodule | 主题源码不进本仓库，升级一条命令；定制通过 `layouts/` 覆盖层实现 |
| 部署方式 | GitHub Actions → GitHub Pages | 仓库只存 Markdown 源码，push 即发布；不提交构建产物 |
| 托管账号 | `qusuc`（专用博客账号） | 与个人号 `DonnyQu7`、公司号 `Dong-Qu_astg` 隔离 |
| 仓库 | `qusuc/qusuc.github.io`（public） | 用户页仓库，根路径无子目录，将来挂自定义域名最简单 |
| 站点地址 | <https://qusuc.github.io/> | |

## 3. 内容架构

三个导航栏目：

- **技术** → `content/post/` — 测试/QA、工程实践、踩坑记录
- **随笔** → `content/essay/` — 生活与想法
- **关于** → `content/page/about/`

首页混排 `post` 与 `essay` 两个 section 的最新文章（`mainSections = ["post", "essay"]`），卡片式列表；导航点进去则分栏目浏览。

额外页面：`content/page/archives/`（按年月归档）、`content/page/search/`（全文搜索，依赖站点 JSON 输出）。

## 4. 仓库结构

```
qusuc.github.io/
├── .github/workflows/hugo.yml      # 构建 + 部署到 Pages
├── config/_default/
│   ├── hugo.toml                   # baseURL / title / 语言 / outputs
│   ├── menu.toml                   # 导航：技术 / 随笔 / 关于
│   └── params.toml                 # 头像、简介、社交链接、giscus
├── content/
│   ├── post/<slug>/index.md        # page bundle：md 与配图同目录
│   ├── essay/<slug>/index.md
│   └── page/{about,archives,search}/index.md
├── layouts/                        # 自定义覆盖层（初期为空）
├── static/                         # favicon 等静态资源
├── themes/hugo-theme-stack/        # git submodule
├── docs/superpowers/specs/         # 本设计文档
└── .gitignore                      # public/ resources/ .hugo_build.lock
```

## 5. 数据存放

| 数据 | 位置 |
|---|---|
| 文章 Markdown | 本仓库 `content/` |
| 文章配图 | 与 md 同目录（page bundle），随仓库版本管理 |
| 评论 | 本仓库的 GitHub Discussions，经 giscus 呈现 |
| 构建产物 | 不入库，由 Actions 生成并直接发布到 Pages |

## 6. 功能范围（第一版）

- giscus 评论（GitHub Discussions 承载）
- 全文搜索、标签、按年月归档
- RSS（`/index.xml`）
- 配图随仓库存放
- 浅色/深色主题（Stack 自带）

明确不做：多语言、订阅邮件、访问统计、自定义域名（后续可加）。

## 7. 写作与发布流程

```bash
hugo new post/<slug>/index.md   # 生成带 front matter 的骨架
hugo server -D                  # http://localhost:1313 实时预览
git add . && git commit -m "post: ..." && git push
```

push 到 `main` 后 Actions 自动构建并发布，约 1–2 分钟上线。配图拖入文章目录后在 md 中以相对路径引用。

## 8. 需要人工完成的步骤

1. ~~安装 Hugo~~（已完成：0.164.0 extended）
2. ~~`qusuc` 账号 gh 交互式登录~~（已完成，当前活动账号）
3. ~~Pages 构建方式设为 GitHub Actions~~（已完成，经 API `build_type=workflow`）
4. ~~开启仓库 Discussions~~（已完成，经 API）
5. 安装 [giscus GitHub App](https://github.com/apps/giscus) 到该仓库 —— 待办，需网页操作
6. 在 <https://giscus.app> 生成 `repoId` / `categoryId`，回填 `params.toml` 并把 `[comments] enabled` 改为 `true` —— 待办

> 踩坑记录：仓库创建时 Pages 默认是 legacy（Jekyll 分支构建）模式，会把 README 渲染成首页、覆盖 Hugo 产物。必须先切成 `workflow` 再重跑一次 Hugo workflow。

## 9. 验收标准

- `hugo server -D` 本地可见：三个导航栏目、首页卡片列表、示例文章、搜索页、归档页
- push 后 GitHub Actions 构建通过（绿灯）
- <https://qusuc.github.io/> 可访问，首页、文章页、标签页、归档页、`/index.xml` 均正常
- 文章底部显示 giscus 评论框，且能成功发一条评论（评论出现在仓库 Discussions 中）
