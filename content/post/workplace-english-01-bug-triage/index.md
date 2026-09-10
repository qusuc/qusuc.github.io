---
title: "职场英语 1：和开发争 bug 的定级与复现"
date: 2026-09-10
draft: false
categories:
    - 英语学习
tags:
    - 职场英语
    - QA
    - 沟通
    - 口语
description: "提 bug、被质疑、扛住降级压力、最后达成一致并记录下来的整套英文说法。"
---

> 这是「职场英语场景」系列的第 1 篇，共 9 篇。每篇只讲一个真实场景，分三层：**这个场景跑在哪些词上**、**可以照着念的句子**、**一段能直接丢给 AI 的角色扮演 prompt**。

写给英语不是母语、却要用英语开完整个工作日的人。所有句子都是短句，能在会议中途扫一眼就念出来的那种。

提 bug、被质疑、扛住降级压力、最后达成一致并记录下来的整套英文说法。

## 什么时候用

- 每天的 bug triage 会
- 开发在 Jira 上回了 cannot reproduce 或 works as designed
- 有人要把你报的 blocker 降成 minor，或推到下个版本
- 发版前要把剩余 bug 过一遍

## 心态

- 你的位置是描述事实，不是指控。先讲现象和影响，不讲谁的锅。
- 定级的依据永远是用户影响和发生概率，不是修复难度。开发常拿难度换定级，不要接。
- 复现不了不等于不存在。把复现率、机型、网络条件说清楚，举证责任就回到了共同调查上。
- 争不下来就升级，但要当着面说你要升级，不要背后去说。

## 一、术语

| English | 中文 | 用法 |
| --- | --- | --- |
| **severity**<br><span style="opacity:.7">塞-维尔-瑞替</span> | 严重程度（现象有多糟） | 和 priority 是两回事。severity 说现象，priority 说什么时候修。开发混用时要拆开说。 |
| **priority**<br><span style="opacity:.7">普莱-奥-瑞替</span> | 优先级（什么时候修） | — |
| **reproduce / reproduction steps**<br><span style="opacity:.7">瑞普-柔-丢斯</span> | 复现 / 复现步骤 | 名词是 reproduction，口语里常缩成 repro：一个 clean repro = 一份干净的复现步骤。 |
| **intermittent**<br><span style="opacity:.7">因特-米-腾特</span> | 偶发的 | 比 sometimes 专业。偶发 bug 一定要给复现率：it happens about one in five times. |
| **flaky**<br><span style="opacity:.7">弗雷-key</span> | 不稳定的（多指用例） | 用来说测试用例不稳，不要用来说线上功能，那要用 intermittent。 |
| **edge case**<br><span style="opacity:.7">埃奇 凯斯</span> | 边界场景 | 小心：开发说 that is just an edge case 通常是在为降级铺垫。要用数据反驳。 |
| **regression**<br><span style="opacity:.7">瑞-格瑞-申</span> | 回归缺陷（以前好的现在坏了） | 最有力的一个词。能证明是 regression，定级争论基本就赢一半。 |
| **root cause**<br><span style="opacity:.7">鲁特 考斯</span> | 根因 | — |
| **workaround**<br><span style="opacity:.7">沃克-阿-绕德</span> | 绕过办法 | 有 workaround 可以降 priority，但不该降 severity。这个区分要守住。 |
| **blocker**<br><span style="opacity:.7">布洛克-儿</span> | 阻塞级（必须修才能发） | — |
| **by design / working as intended**<br><span style="opacity:.7">拜 地-赛因</span> | 设计如此 | 开发最常用的挡箭牌。回应方式是要 spec 出处，而不是争论。 |
| **expected behaviour**<br><span style="opacity:.7">埃克斯-派克-忒德 比-嘿-维尔</span> | 预期行为 | — |
| **defer**<br><span style="opacity:.7">迪-佛</span> | 推迟到后续版本 | 中性词，不带情绪。比说 you want to ignore it 好用得多。 |
| **race condition**<br><span style="opacity:.7">瑞斯 康-地-申</span> | 竞态 | — |
| **escalate**<br><span style="opacity:.7">埃斯-卡-雷特</span> | 升级（往上反映） | 说出口前给对方一次机会：before I escalate this, can we... |
| **acceptance criteria**<br><span style="opacity:.7">阿克-赛普-坦斯 克赖-提瑞-阿</span> | 验收标准 | 争 by design 时的武器：回到 story 的验收标准。 |

## 二、场景句子

### Putting the bug on the table · 把问题摆出来

> 开场只讲三件事：什么情况下、发生了什么、影响谁。不下结论，不给方案。

**I want to walk through one issue before we move on.**  
在往下走之前，我想过一个问题。

**On Android 14, when the call is answered from the lock screen, the audio stays muted for about two seconds.**  
在 Android 14 上，从锁屏接听时，音频会静音大约两秒。  
↳ 条件 + 现象 + 量化。三样都给，对方就没法说你描述不清。

**It happens about one in five times on my device, and I reproduced it on two more.**  
在我的设备上大概五次里有一次，我在另外两台上也复现了。  
↳ 偶发 bug 必须先给概率和机型，否则一定会被当成个例。

**This is a regression — it worked in 5.16.**  
这是个回归问题，5.16 上是好的。  
↳ 能说这句就先说。它把讨论从要不要修变成什么时候修。

**I'm not saying where the problem is. I'm saying what I see.**  
我不是在说问题出在哪，我是在说我看到了什么。  
↳ 对方开始防御时用它降温。

### Getting them to actually look · 让对方真的去看

**Can we look at it together for five minutes?**  
我们花五分钟一起看一下好吗？  
↳ 比在 Jira 上来回三天有效得多。

**I've attached the log and a screen recording to the ticket.**  
我已经把日志和录屏传到单子上了。

**What else do you need from me to investigate this?**  
你还需要我提供什么才能查？  
↳ 把球接住再传回去，对方就不能停在信息不足上。

**Which log would help — the client side, or the gateway?**  
哪边的日志有用，客户端还是网关？

**If you can't reproduce it, can I record my screen while it happens?**  
如果你复现不了，我可以在它发生时录屏吗？

### Holding the severity · 扛住定级

> 守住一条线：严重程度看用户影响，不看修复成本。对方谈成本时，把两件事拆开谈。

**I'd keep this as a blocker, and here is why.**  
我认为这个应该保持 blocker，理由如下。  
↳ 先给结论再给理由，比反过来有力。

**The user can't tell the call connected. They hang up and call again.**  
用户不知道电话接通了，他们会挂掉重打。  
↳ 定级理由要落到用户行为上，不要停在功能异常。

**Severity and priority are two different questions. Can we agree on severity first?**  
严重程度和优先级是两个问题。我们先把严重程度定了好吗？  
↳ 对方混用这两个词时，这句能把讨论拉回来。

**I understand it's expensive to fix. That doesn't change how bad it is for the user.**  
我理解修起来成本高。但这不改变它对用户有多糟。

**If we ship this, what do we tell support when the tickets come in?**  
如果我们就这么发了，用户反馈上来时我们怎么跟客服说？  
↳ 把问题转成对方也要承担的后果，比坚持定级更有效。

**I can accept minor if we agree it's fixed in the next release. Can we write that down?**  
如果我们同意下个版本修掉，我可以接受降成 minor。能写进去吗？  
↳ 让步要换东西，而且要落到文字上。

### When they say it is not a bug · 对方说这不是 bug

**Can you point me to where that's specified? I want to update our test cases.**  
你能指给我看哪里是这么定义的吗？我想更新我们的用例。  
↳ 对付 by design 的标准答案。要出处，不要争论。给的理由还是善意的。

**The acceptance criteria on the story say the tone plays before the audio opens. That's not what happens.**  
story 的验收标准写的是提示音先响再开音频。实际不是这样。

**Then we have a documentation problem as well as a behaviour question.**  
那我们除了行为问题，还有一个文档问题。  
↳ 对方说设计就这样但文档没写时用它，顺势把事情留在台面上。

**I hear you. I still think the user will read this as broken.**  
我听懂了。我仍然认为用户会觉得这是坏的。  
↳ 先承认再坚持。这是最重要的一个句型。

**Let's ask the product owner rather than the two of us deciding.**  
这个我们俩别定了，问一下产品负责人。  
↳ 转移仲裁权，而不是硬顶。

### When they cannot reproduce it · 对方说复现不了

**It doesn't reproduce every time. Let me give you the exact conditions.**  
它不是每次都复现。我把具体条件给你。

**It needs a weak network. I use the throttle profile at 200 kbps with 5% loss.**  
需要弱网。我用的是 200 kbps、5% 丢包的限速配置。  
↳ 环境差异是复现不了的第一大原因。主动给参数。

**Which build did you try? I saw it on the 5.17 nightly from Tuesday.**  
你试的是哪个包？我是在周二的 5.17 nightly 上看到的。

**Can I reproduce it on your machine, or send you my device?**  
我能在你机器上复现给你看吗？或者把我的设备给你？

**Let's leave it open and I'll add data every time I hit it.**  
先别关，我每次碰到就往上加数据。  
↳ 防止单子被 cannot reproduce 关掉。争取时间比争输赢重要。

### Deferring, escalating, and closing it out · 推迟、升级、收口

**So the decision is — defer to 5.18, severity stays major. Correct?**  
所以结论是，推到 5.18，严重程度保持 major。对吗？  
↳ 每次讨论结束都复述结论。既确认，也是给你自己的英文缓冲。

**I'll put that in the ticket so nobody has to remember it.**  
我会写到单子里，免得谁去记。

**I'm not comfortable signing off on the release with this open.**  
这个还开着的话，我不放心给发版签字。  
↳ 质量否决权的标准说法。语气克制但立场明确。

**Before I escalate this, is there anything else we can try today?**  
在我把这个升级上去之前，今天还有别的能试的吗？  
↳ 给对方最后一次机会，而且当面说要升级，不是背后。

**I'll raise it with your lead and mine, with both our positions in it.**  
我会跟你的和我的上级提，把我们两边的意见都写上。  
↳ 升级时说明会带上对方的意见，这样不会变成打小报告。

### Recovery — when you did not understand · 没听懂的时候

> 技术讨论语速快、术语密。装懂会让你在定级上失去立场，一定要打断。

**Sorry, I didn't catch that. Could you say it again?**  
抱歉没听清，能再说一遍吗？

**Hold on — let me make sure I understand. You're saying the retry masks it, right?**  
等一下，我确认一下。你的意思是重试把它盖住了，对吗？

**What does that acronym stand for?**  
那个缩写是什么的简称？  
↳ 缩写是最容易听丢的。问一句没人会觉得奇怪。

**Can you type that in the chat? I want to search for it after.**  
你能把那个打到聊天里吗？我等下想搜一下。

**Give me a second — I want to get this right before we decide.**  
给我一点时间，决定之前我想弄清楚。  
↳ 争取时间的同时把慢下来说成对结论负责，没人能反对。

## 三、和 AI 对练

在这个对话里练：跟我说 "练 bug triage"，可以补充是哪个 bug、对方是谁，
我会照下面的 prompt 扮演那个开发，全程英文，每轮给一行中文提示。

也可以整块复制到别的 AI 里，把方括号换成你手上真实的 bug。

把下面这段整块复制给 ChatGPT、Claude 或任何一个会聊天的模型，把方括号里的内容换成你自己的处境，然后用英文开口。

```text
You are playing a senior Android developer on the calling team. I am the
QA lead. We are in bug triage, and I am about to raise a bug you do not want
to fix in this release.

The bug: [on Android 14, answering from the lock screen leaves the audio
muted for about two seconds, roughly one time in five].
Your position: you think it is [a rare edge case / a platform issue outside
our code / already covered by the retry logic], the release is in four days,
and the fix touches [the audio session setup], which you consider risky this
late.

How to play it:
- English only, at the pace of a real triage call. Push back. Be reasonable
  but not easily moved.
- Use the standard moves in order: first ask for reproduction steps, then
  say you cannot reproduce it, then argue it is an edge case, then argue it
  is by design, then offer to defer it.
- Give ground only when I do one of these: quantify the user impact, show it
  is a regression, cite the acceptance criteria, or offer a trade I can hold
  you to.
- Use QA and VoIP terms naturally, including a couple I might not know.
- If I ask you to repeat, slow down, or spell something, do it without
  comment.
- Never break character to coach me mid-conversation.

After each of your replies, add one line in Chinese, prefixed with 提示:,
naming the move you just made and what would counter it.

At the end, when the bug has a decision, drop character and review me in
Chinese: did I hold the severity, what did I concede too early, and two
English sentences I should have used.

Wait for me to raise the bug.
```

### 示范对话

下面是这段 prompt 跑起来大概是什么样子。中文提示是给你看的，不是对话的一部分。

**你** — Before we move on, I want to walk through one issue. On Android 14, when the call is answered from the lock screen, the audio stays muted for about two seconds.  
往下走之前我想过一个问题。Android 14 上从锁屏接听时，音频会静音大约两秒。

**对方** — Two seconds? I've never seen that. Do you have steps?  
两秒？我从没见过。你有复现步骤吗？  
↳ 第一招：要复现步骤。别只说有，直接把条件和概率一起给出去。

**你** — It's in the ticket with a screen recording. It happens about one in five times, and I reproduced it on two more devices.  
单子里有，还带录屏。大概五次一次，我在另外两台设备上也复现了。

**对方** — One in five on lock screen answer. That's a pretty narrow path. Most users answer from the notification.  
锁屏接听五分之一。这个路径挺窄的，大多数用户是从通知栏接的。  
↳ 第二招：说成边界场景。用数据反驳，不要用感觉。

**你** — I'd want to check that. And this is a regression — it worked in 5.16.  
这个我想核实一下。而且这是个回归，5.16 上是好的。  
↳ regression 是最强的一张牌。打出来之后对方通常会换招。

**对方** — Are you sure? The audio session code didn't change in this release as far as I know.  
你确定？据我所知这个版本音频会话的代码没动过。

**你** — I'm not saying where the problem is. I'm saying it worked in 5.16 and doesn't in 5.17. Can we look at it together for five minutes?  
我不是在说问题出在哪。我是说 5.16 好的，5.17 不好。我们花五分钟一起看一下？

**对方** — I can look, but honestly, we're four days out. Even if it's real, I'd want to defer it. The fix is in a risky place.  
我可以看，但说实话只剩四天了。就算是真的，我也想推迟。改动的位置有风险。  
↳ 第五招：推迟。注意他把修复风险和严重程度混在一起了，把它们拆开。

**你** — Those are two different questions. Whether it's risky to fix is your call. How bad it is for the user is mine.  
这是两个问题。修起来风险多大是你判断，对用户有多糟是我判断。

**对方** — Fair. What's your read on the user impact, then?  
有道理。那你觉得用户影响是什么？  
↳ 他让步了一步。抓住，把影响落到用户行为上，不要停在功能异常。

**你** — The user can't tell the call connected. They hang up and call again. That's a support ticket every time.  
用户不知道电话通了，会挂掉重打。每次都是一张客服工单。

**对方** — Okay. I'll take a look this afternoon. If it's not the audio session, I still want to defer.  
好，我下午看一下。如果不是音频会话的问题，我还是想推迟。  
↳ 收口的时候到了。复述结论，并且说清楚写进单子里。

---

系列其余各篇在 [英语学习](/categories/英语学习/) 分类下。文中的人名、产品和版本号都是编的，场景和术语是真的。
