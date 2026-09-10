---
title: "Your GitHub Pages Homepage Is the README, Not Your Build"
date: 2026-08-09T19:20:00+04:00
draft: false
image: cover.png
categories:
    - Tech
tags:
    - Hugo
    - GitHub Pages
    - GitHub Actions
---

While setting up this blog I hit a quiet one: the Actions run was green, the site loaded, but the homepage was the README and every inner page 404'd.

## Symptom

`hugo` built fine locally and `public/` had everything. After pushing:

```console
$ curl -s -o /dev/null -w '%{http_code}\n' https://qusuc.github.io/
200
$ curl -s -o /dev/null -w '%{http_code}\n' https://qusuc.github.io/post/
404
$ curl -s https://qusuc.github.io/ | grep -o '<title>[^<]*</title>'
<title>qusuc.github.io | qusuc</title>
```

That `<title>` is "repo | user" — the signature of Jekyll's default theme rendering a README. The page being served simply wasn't the one I built.

## Cause

GitHub Pages has two build modes:

| build_type | Behavior |
| --- | --- |
| `legacy` | GitHub runs Jekyll server-side against the branch contents |
| `workflow` | Accepts only the artifact your Actions workflow uploads |

A newly created repo defaults to `legacy` when Pages is first enabled. So two pipelines were running against the same site: my Hugo workflow uploading an artifact, and GitHub's `pages-build-deployment` building the README with Jekyll — **whichever finishes last wins**. Both show green in the Actions tab, which is what makes it confusing.

The API gives it away:

```console
$ gh api repos/<owner>/<repo>/pages --jq '{build_type, source}'
{"build_type":"legacy","source":{"branch":"main","path":"/"}}
```

## Fix

Switch to `workflow` — note `PUT`, not `POST` (`POST` returns 409 on an already-enabled site):

```bash
gh api -X PUT repos/<owner>/<repo>/pages -f build_type=workflow
```

The UI equivalent is Settings → Pages → Build and deployment → Source → **GitHub Actions**.

One more step people miss: **switching does not redeploy**. Until you trigger your own workflow again, the Jekyll artifact is still what's live:

```bash
gh workflow run hugo.yml
```

## Verifying quickly

A green checkmark proves less than the artifact itself does:

```bash
for p in "" post/ about/ index.xml; do
  printf "%-12s %s\n" "/$p" "$(curl -s -o /dev/null -w '%{http_code}' https://<your-site>/$p)"
done
```

> Homepage 200 with every inner page 404 is the tell: what's live isn't what you built.

Worth remembering: with a README in the repo and `legacy` mode on, Jekyll will happily render it as your homepage. Nothing errors. It just does something else.
