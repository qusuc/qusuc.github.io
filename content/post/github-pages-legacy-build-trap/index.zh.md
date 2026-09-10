---
title: "新建仓库开 GitHub Pages，首页被 README 顶掉了"
date: 2026-08-09T19:20:00+04:00
draft: false
image: cover.png
categories:
    - 技术
tags:
    - Hugo
    - GitHub Pages
    - GitHub Actions
---

搭这个博客的时候踩到一个不太起眼的坑：Actions 明明跑绿了，站点也能打开，但首页显示的是 README，所有内页全是 404。

## 现象

`hugo` 本地构建正常，`public/` 里该有的都有。推上去之后：

```console
$ curl -s -o /dev/null -w '%{http_code}\n' https://qusuc.github.io/
200
$ curl -s -o /dev/null -w '%{http_code}\n' https://qusuc.github.io/post/
404
$ curl -s https://qusuc.github.io/ | grep -o '<title>[^<]*</title>'
<title>qusuc.github.io | qusuc</title>
```

首页的 `<title>` 不是站点标题，而是「仓库名 | 用户名」——这是 Jekyll 默认主题渲染 README 的特征。也就是说，页面根本不是我构建的那份。

## 原因

GitHub Pages 有两种构建方式：

| build_type | 行为 |
| --- | --- |
| `legacy` | GitHub 在服务端跑 Jekyll，把分支内容当 Jekyll 站点构建 |
| `workflow` | 只接收 Actions 上传的产物，自己不构建 |

新建仓库首次开启 Pages 时，默认是 `legacy`。于是仓库里同时跑着两条流水线：我的 Hugo workflow 上传产物，GitHub 的 `pages-build-deployment` 用 Jekyll 构建 README——**谁后完成谁覆盖谁**。Actions 页面上两条都是绿的，非常有迷惑性。

用 API 一查就露馅了：

```console
$ gh api repos/<owner>/<repo>/pages --jq '{build_type, source}'
{"build_type":"legacy","source":{"branch":"main","path":"/"}}
```

## 解决

切成 `workflow`（注意是 `PUT`，不是 `POST`——已启用的站点用 `POST` 会 409）：

```bash
gh api -X PUT repos/<owner>/<repo>/pages -f build_type=workflow
```

网页上的等价操作是 Settings → Pages → Build and deployment → Source 选 **GitHub Actions**。

改完还有一步容易漏：**切换本身不会重新部署**。此时线上仍是 Jekyll 那份产物，得手动触发一次自己的 workflow：

```bash
gh workflow run hugo.yml
```

## 怎么快速确认

比起看 Actions 是不是绿的，直接验证线上产物更可靠：

```bash
for p in "" post/ about/ index.xml; do
  printf "%-12s %s\n" "/$p" "$(curl -s -o /dev/null -w '%{http_code}' https://<你的站点>/$p)"
done
```

> 首页 200 但内页全 404，基本就是这个问题：说明线上那份根本不是你构建的产物。

一个提醒：如果仓库里放了 README，又恰好用了 `legacy` 模式，Jekyll 会很热心地把它渲染成首页。它没报错，只是做了另一件事。
