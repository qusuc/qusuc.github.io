---
title: "第一篇：这个博客是怎么搭起来的"
date: 2026-08-09T10:00:00+04:00
draft: false
categories:
    - 技术
tags:
    - Hugo
    - GitHub Pages
---

这是一篇示例文章，用来验证站点各部分是否正常。确认没问题后可以直接删掉整个 `content/post/hello-hugo/` 目录。

## 技术栈

| 环节 | 用什么 |
| --- | --- |
| 生成器 | Hugo extended |
| 主题 | hugo-theme-stack |
| 托管 | GitHub Pages |
| 构建 | GitHub Actions |
| 评论 | giscus（GitHub Discussions） |

## 代码高亮长这样

```python
def flaky_retry(fn, times=3):
    """重试装饰器——测试里最常写也最容易写错的东西。"""
    for i in range(times):
        try:
            return fn()
        except AssertionError:
            if i == times - 1:
                raise
```

## 怎么写新文章

```bash
hugo new post/my-slug/index.md   # 技术
hugo new essay/my-slug/index.md  # 随笔
hugo server -D                   # 本地预览
```

配图直接丢进文章目录，然后用相对路径引用：

```markdown
![截图](screenshot.png)
```

> 引用块长这样。文章写完记得把 front matter 里的 `draft` 改成 `false`。
