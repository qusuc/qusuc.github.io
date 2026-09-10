---
title: "职场英语 8：行业术语对照"
date: 2026-09-10
draft: false
image: "cover.jpg"
categories:
    - 英语学习
tags:
    - 职场英语
    - QA
    - 沟通
    - 口语
description: "贯穿所有场景的术语表，加上把它们放进整句里的说法。你知道这些概念，缺的是当场想起那个词。"
---

这是「职场英语场景」系列的第 8 篇，共 9 篇。每篇只讲一个真实场景，分三层：这个场景跑在哪些词上、可以照着念的句子、一段能直接丢给 AI 的角色扮演 prompt。

写给英语不是母语、却要用英语开完整个工作日的人。所有句子都是短句，能在会议中途扫一眼就念出来的那种。

**贯穿所有场景的术语表，加上把它们放进整句里的说法。你知道这些概念，缺的是当场想起那个词。**

{{< we-panel >}}
**什么时候用**

- 想不起某个概念的英文说法
- 听到一个词不确定是不是自己以为的意思
- 要跟外部或新同事解释一个流程
- 上会前扫一遍当天会用到的词

**心态**

- 你缺的不是知识，是检索速度。术语要能在半秒内取出来，靠的是整句练习，不是背单词。
- 术语用错比不用更危险。宁可用一句白话解释，也不要用一个你不确定的词。
- 不认识的词当场问，没有人会因此看低你 —— 技术会议上问缩写是常态。
- 别人用错词的时候，温和地把正确用法说一遍就行，不用纠正他。
{{< /we-panel >}}

## 一、术语

| English | 中文 | 用法 |
| --- | --- | --- |
| **call setup**<br><span class="we-ipa">/ˈkɔl ˌsɛtʌp/</span> | 呼叫建立（从拨出到接通的过程） | 你最常测的一段路径。说 the call setup path 就是指这一整段。 |
| **signalling**<br><span class="we-ipa">/ˈsɪɡnəlɪŋ/</span> | 信令 | 美式拼 signaling。指建立通话的控制消息，和媒体流分开说。 |
| **media / media stream**<br><span class="we-ipa">/ˈmidiə strim/</span> | 媒体流（音视频本身） | 和 signalling 是一对。一路通一路不通是最常见的故障形态。 |
| **one-way audio**<br><span class="we-ipa">/ˌwʌn weɪ ˈɔdioʊ/</span> | 单通（一方听不到） | 有专有名词就别描述。说 one-way audio，对方立刻知道你在说什么。 |
| **jitter**<br><span class="we-ipa">/ˈdʒɪtər/</span> | 抖动 | — |
| **packet loss**<br><span class="we-ipa">/ˈpækɪt lɔs/</span> | 丢包 | — |
| **latency / round-trip time**<br><span class="we-ipa">/ˈleɪtnsi/ · /ˌraʊnd trɪp ˈtaɪm/</span> | 时延 / 往返时延 | RTT 逐字念。说时延一定要带数字和单位，否则没有意义。 |
| **codec**<br><span class="we-ipa">/ˈkoʊdɛk/</span> | 编解码器 | — |
| **echo cancellation**<br><span class="we-ipa">/ˈɛkoʊ ˌkænsəˈleɪʃən/</span> | 回声消除 | — |
| **call drop**<br><span class="we-ipa">/ˈkɔl drɑp/</span> | 掉话 | 动词说 the call dropped，名词说 a call drop。 |
| **smoke test**<br><span class="we-ipa">/ˈsmoʊk tɛst/</span> | 冒烟测试（最基本的通不通） | — |
| **regression**<br><span class="we-ipa">/rɪˈɡrɛʃən/</span> | 回归（以前好的现在坏了 / 回归测试） | 一个词两个意思：a regression 是缺陷，the regression 是那轮测试。看冠词。 |
| **exploratory testing**<br><span class="we-ipa">/ɪkˈsplɔrəˌtɔri/</span> | 探索性测试 | 不是随便点。说的时候补一句 with a charter，别人就知道你是有章法的。 |
| **end-to-end / E2E**<br><span class="we-ipa">/ˌɛnd tu ˈɛnd/</span> | 端到端 | — |
| **soak test**<br><span class="we-ipa">/ˈsoʊk tɛst/</span> | 长稳测试（跑很久看有没有劣化） | 通话质量最该做的一类测试，很多人不知道这个词。 |
| **flaky**<br><span class="we-ipa">/ˈfleɪki/</span> | 不稳定的（用例时好时坏） | — |
| **triage**<br><span class="we-ipa">/ˈtriɑʒ/</span> | 定级分诊 | 医院分诊借来的词。名词动词都能用：we triage bugs every morning。 |
| **root cause**<br><span class="we-ipa">/ˈrut kɔz/</span> | 根因 | — |
| **cannot reproduce**<br><span class="we-ipa">/ˌriprəˈdus/</span> | 无法复现 | Jira 上的标准状态。口语常缩成 no repro。 |
| **feature flag**<br><span class="we-ipa">/ˈfitʃər flæɡ/</span> | 功能开关 | 谈发版风险时的关键工具。放在开关后面 = behind a flag。 |
| **staged rollout / canary**<br><span class="we-ipa">/ˈsteɪdʒd ˈroʊlˌaʊt/ · /kəˈnɛri/</span> | 灰度发布 / 金丝雀 | — |
| **pipeline**<br><span class="we-ipa">/ˈpaɪpˌlaɪn/</span> | 流水线 | 说 the pipeline is red = 流水线挂了。red/green 是最常用的状态说法。 |
| **nightly**<br><span class="we-ipa">/ˈnaɪtli/</span> | 每晚跑的那套 | 可以当名词：the nightly has been red for two days. |
| **hallucination**<br><span class="we-ipa">/həˌlusəˈneɪʃən/</span> | 幻觉（模型编造） | AI 测试里绕不开的词。别用 the model lies，那不专业。 |
| **non-deterministic**<br><span class="we-ipa">/ˌnɑn dɪˌtɜrməˈnɪstɪk/</span> | 不确定性的（同样输入结果不同） | 解释 AI 功能为什么难测，一个词就够了。 |
| **ground truth**<br><span class="we-ipa">/ˈɡraʊnd truθ/</span> | 标准答案、真值 | 说清楚你拿什么当对错的基准。评测 AI 功能时必用。 |

## 二、场景句子

### Describing a call problem · 描述通话问题

<p class="we-groupnote">通话故障的描述有固定结构：哪一段、什么现象、什么条件、多大概率。四样齐了才叫可查。</p>

<div class="we-say"><span class="we-en">It fails during call setup, before the media starts.</span><span class="we-cn">它在呼叫建立阶段失败，媒体流还没开始。</span><span class="we-tip">把 signalling 和 media 分开定位，开发一听就知道去哪查。</span></div>

<div class="we-say"><span class="we-en">We get one-way audio — the callee hears nothing, the caller is fine.</span><span class="we-cn">出现单通：被叫听不到，主叫正常。</span></div>

<div class="we-say"><span class="we-en">On a weak network — 200 kbps with five percent packet loss — the call drops after about thirty seconds.</span><span class="we-cn">弱网下（200 kbps、5% 丢包），通话大约三十秒后掉话。</span><span class="we-tip">网络条件要给数字。没有数字的弱网问题没人复现得了。</span></div>

<div class="we-say"><span class="we-en">Latency is around four hundred milliseconds round-trip, which is above what we'd accept.</span><span class="we-cn">往返时延大约 400 毫秒，超出我们能接受的范围。</span></div>

<div class="we-say"><span class="we-en">It reproduces about one in five times on Android 14.</span><span class="we-cn">在 Android 14 上大约五次复现一次。</span></div>

<hr class="we-sep">

### Naming the test you ran · 说清你跑的是哪种测试

<p class="we-groupnote">说错测试类型，别人对你的结论会有错误预期。这一组值得记准。</p>

<div class="we-say"><span class="we-en">I ran a smoke test on the new build — basic call in and out, nothing deeper.</span><span class="we-cn">我在新包上跑了冒烟：基本的呼入呼出，没有更深的。</span></div>

<div class="we-say"><span class="we-en">That was a full regression round, twelve hundred cases, two days.</span><span class="we-cn">那是一整轮回归，1200 条用例，两天。</span></div>

<div class="we-say"><span class="we-en">I did an exploratory session with a charter around the lock-screen flow.</span><span class="we-cn">我做了一次探索性测试，主题是锁屏流程。</span><span class="we-tip">带上 charter，探索性测试就不会被当成随便点点。</span></div>

<div class="we-say"><span class="we-en">We haven't done a soak test on this build yet — that's the gap.</span><span class="we-cn">这个包还没做长稳测试，这是缺口。</span></div>

<div class="we-say"><span class="we-en">This is covered end to end, from the client through the gateway.</span><span class="we-cn">这个是端到端覆盖的，从客户端一直到网关。</span></div>

<hr class="we-sep">

### The defect lifecycle · 缺陷流程

<div class="we-say"><span class="we-en">We triage every morning at ten.</span><span class="we-cn">我们每天十点做 bug 分诊。</span></div>

<div class="we-say"><span class="we-en">It's marked cannot reproduce, but I have a screen recording.</span><span class="we-cn">它被标成无法复现，但我有录屏。</span></div>

<div class="we-say"><span class="we-en">Severity is major, priority is low — we know about it, we're not fixing it this release.</span><span class="we-cn">严重程度 major，优先级 low：我们知道它，但这个版本不修。</span><span class="we-tip">用一句话演示 severity 和 priority 的区别，比解释定义更清楚。</span></div>

<div class="we-say"><span class="we-en">The root cause was a race condition in the audio session setup.</span><span class="we-cn">根因是音频会话建立里的一个竞态。</span></div>

<div class="we-say"><span class="we-en">There's a workaround — the user can toggle the speaker — so I'd accept a lower priority.</span><span class="we-cn">有绕过办法：用户可以切一下扬声器，所以我接受降低优先级。</span></div>

<div class="we-say"><span class="we-en">It's verified on the release candidate, so I'm closing it.</span><span class="we-cn">在候选版本上验证通过了，我关掉它。</span></div>

<hr class="we-sep">

### The release train · 发布流程

<div class="we-say"><span class="we-en">We cut the release candidate on Tuesday and ship on Friday.</span><span class="we-cn">我们周二切候选版本，周五发布。</span><span class="we-tip">cut a release 是切版本的固定说法，不是砍掉的意思。</span></div>

<div class="we-say"><span class="we-en">The new flow is behind a feature flag, off by default.</span><span class="we-cn">新流程在功能开关后面，默认关闭。</span></div>

<div class="we-say"><span class="we-en">We're doing a staged rollout — five percent for the first two days.</span><span class="we-cn">我们做灰度：前两天 5%。</span></div>

<div class="we-say"><span class="we-en">If the crash rate goes above our bar, we roll back.</span><span class="we-cn">如果崩溃率超过标准线，我们回滚。</span></div>

<div class="we-say"><span class="we-en">That fix will go into a hotfix next week, not this release.</span><span class="we-cn">那个修复下周走紧急修复，不进这个版本。</span></div>

<hr class="we-sep">

### Automation and CI · 自动化与流水线

<div class="we-say"><span class="we-en">The nightly has been red for two days.</span><span class="we-cn">nightly 已经红了两天。</span></div>

<div class="we-say"><span class="we-en">Three cases are flaky — they pass on rerun, so I've quarantined them.</span><span class="we-cn">有三条用例不稳定，重跑就过，我先隔离了。</span><span class="we-tip">quarantine 是隔离不稳定用例的标准说法，不是直接删掉。</span></div>

<div class="we-say"><span class="we-en">The pipeline fails at the integration stage, not on the unit tests.</span><span class="we-cn">流水线在集成阶段失败，不是单元测试。</span></div>

<div class="we-say"><span class="we-en">Coverage is at seventy percent, but that number doesn't mean much on its own.</span><span class="we-cn">覆盖率 70%，但这个数字单看意义不大。</span><span class="we-tip">说数字时顺带说它的局限，会让你的判断更可信。</span></div>

<div class="we-say"><span class="we-en">I'll rerun it on the latest artefact and let you know.</span><span class="we-cn">我在最新产物上重跑一遍，然后告诉你。</span></div>

<hr class="we-sep">

### Testing AI features · 测 AI 功能

<p class="we-groupnote">这块术语最新，也最容易说得含糊。用准这几个词，你在这类讨论里立刻站得住。</p>

<div class="we-say"><span class="we-en">The output is non-deterministic, so a single run isn't evidence.</span><span class="we-cn">输出是不确定性的，所以跑一次不算证据。</span></div>

<div class="we-say"><span class="we-en">We need a ground truth set before we can say whether it got better.</span><span class="we-cn">要有一套标准答案，我们才能说它有没有变好。</span></div>

<div class="we-say"><span class="we-en">That's a hallucination — it invented a ticket number that doesn't exist.</span><span class="we-cn">那是幻觉：它编了一个不存在的单号。</span></div>

<div class="we-say"><span class="we-en">I'd run the evaluation set on both versions and compare, rather than judge by feel.</span><span class="we-cn">我会在两个版本上跑评测集做对比，而不是凭感觉判断。</span></div>

<div class="we-say"><span class="we-en">The latency doubled after the change, and that's a user-visible regression too.</span><span class="we-cn">改动之后时延翻倍了，这同样是用户能感知的回归。</span><span class="we-tip">提醒对方：AI 功能的性能退化也是回归，不只是答得对不对。</span></div>

<hr class="we-sep">

### Recovery — when you did not understand · 没听懂的时候

<p class="we-groupnote">术语听不懂是这一页存在的原因。问的方式有讲究：问得具体，就不像基础不好。</p>

<div class="we-say"><span class="we-en">What does that acronym stand for?</span><span class="we-cn">那个缩写是什么的简称？</span><span class="we-tip">技术会议上问缩写完全正常，母语者也天天问。</span></div>

<div class="we-say"><span class="we-en">Could you spell that? I want to look it up properly.</span><span class="we-cn">能拼一下吗？我想好好查一下。</span></div>

<div class="we-say"><span class="we-en">Are we using that word the same way? I mean the test round, not the defect.</span><span class="we-cn">我们说的是同一个意思吗？我指的是那轮测试，不是那个缺陷。</span><span class="we-tip">对付 regression 这种一词多义的最佳问法，而且显得你很精确。</span></div>

<div class="we-say"><span class="we-en">I know the concept, I've lost the English word — it's when the same input gives different output.</span><span class="we-cn">概念我知道，英文词想不起来了：就是同样输入给出不同输出的那个。</span><span class="we-tip">想不起词就描述它。对方会直接把词补给你，你也就记住了。</span></div>

<div class="we-say"><span class="we-en">New one for me — what does that mean in this context?</span><span class="we-cn">这个我没见过，在这个语境里是什么意思？</span><span class="we-tip">说 new one for me 很自然，比 I don't know 轻松。</span></div>

## 三、和 AI 对练

把下面这段整块复制给 ChatGPT、Claude 或任何一个会聊天的模型——代码块右上角有复制按钮，点一下就是整段。把方括号里的内容换成你自己的处境，然后用英文开口。

它会扮演对面那个人，不会放水：该反驳的反驳，该施压的施压。每一轮它都会附一行中文提示，告诉你对方刚用了什么招、什么答法能接住。你说结束之后，它会切出角色，用中文点评你哪里让步太早、漏了什么，并给出你本该说的两句英文。

```text {linenos=false}
You are running a rapid vocabulary drill with me. I am a QA lead who knows
the concepts in Chinese but loses the English word under pressure. The domain
is QA and VoIP: call quality, test types, the defect lifecycle, the release
train, CI, and testing AI features.

Run the drill in rounds, mixing these four types:
1. Give me a concept in Chinese and ask for the English term.
2. Give me an English term and ask me to use it in a sentence about my own
   work — reject a textbook sentence and ask for a real one.
3. Describe a situation and ask which term fits, where two terms are close
   (severity vs priority, flaky vs intermittent, signalling vs media,
   a regression vs the regression).
4. Occasionally use a term incorrectly yourself and see whether I catch it.

How to play it:
- English only, quick, one item at a time. Wait for my answer before moving on.
- If I get it wrong, give the right word and one short example, then move on.
  Do not lecture.
- If I say I do not know, that is fine — tell me the word and come back to it
  two rounds later.
- Increase difficulty as I get them right.

After each round, add one line in Chinese, prefixed with 提示:, with the
usage note that matters — not a translation.

After about twelve rounds, stop and give me, in Chinese: the words I missed,
the ones I used slightly wrong, and a short list to review before my next
meeting.

Start with round one.
```

### 示范对话

下面是这段 prompt 跑起来大概是什么样子。中文提示是给你看的，不是对话的一部分。

<div class="we-turn we-them"><span class="we-who">对方</span><span class="we-en">Round one. Chinese to English — 单通,一方听不到对方。</span><span class="we-cn">第一轮。中译英：单通，一方听不到对方。</span></div>

<div class="we-turn we-you"><span class="we-who">你</span><span class="we-en">One-way audio.</span><span class="we-cn">单通。</span><span class="we-hint">对了。这类有专名的现象，一定要用专名，不要描述。</span></div>

<div class="we-turn we-them"><span class="we-who">对方</span><span class="we-en">Good. Now use it in a sentence about something you actually tested.</span><span class="we-cn">很好。现在用它造一个你真的测过的句子。</span></div>

<div class="we-turn we-you"><span class="we-who">你</span><span class="we-en">On the 5.17 build we get one-way audio when the call is answered from the lock screen — the callee hears nothing.</span><span class="we-cn">5.17 的包上，从锁屏接听时会出现单通，被叫听不到。</span><span class="we-hint">好句子：有版本、有条件、有现象。这就是可查的描述。</span></div>

<div class="we-turn we-them"><span class="we-who">对方</span><span class="we-en">Next. Two terms, close together — the test cases pass when I rerun them. Flaky, or intermittent?</span><span class="we-cn">下一个。两个近义词：用例重跑就过。是 flaky 还是 intermittent?</span></div>

<div class="we-turn we-you"><span class="we-who">你</span><span class="we-en">Flaky. Intermittent is for the product behaviour, flaky is for the tests.</span><span class="we-cn">flaky。intermittent 说的是产品行为，flaky 说的是测试用例。</span><span class="we-hint">正确，而且你说出了区分标准，这比记住答案有用。</span></div>

<div class="we-turn we-them"><span class="we-who">对方</span><span class="we-en">Right. Now — 灰度发布,前两天只放百分之五。</span><span class="we-cn">现在：灰度发布，前两天只放 5%。</span></div>

<div class="we-turn we-you"><span class="we-who">你</span><span class="we-en">A staged rollout. Five percent for the first two days.</span><span class="we-cn">灰度发布，前两天 5%。</span><span class="we-hint">canary 也可以，通常指更小范围的先行验证。两个词都会用最好。</span></div>

<div class="we-turn we-them"><span class="we-who">对方</span><span class="we-en">Good. Here's a situation — the model invented a ticket number that doesn't exist in Jira. What do we call that, and why does it matter for how we test?</span><span class="we-cn">一个情境：模型编了一个 Jira 里不存在的单号。这叫什么，以及它对怎么测有什么影响？</span><span class="we-hint">两问。第二问才是重点，答出来才说明你真的会用这个词。</span></div>

<div class="we-turn we-you"><span class="we-who">你</span><span class="we-en">That's a hallucination. It matters because the output is non-deterministic, so one clean run isn't evidence — we need a ground truth set.</span><span class="we-cn">那是幻觉。它之所以重要，是因为输出是不确定性的，跑一次干净不算证据，我们需要标准答案集。</span></div>

<div class="we-turn we-them"><span class="we-who">对方</span><span class="we-en">Strong answer. Next round — and by the way, we should soak test the pipeline overnight.</span><span class="we-cn">答得好。下一轮。顺便说，我们应该让流水线做个整晚的长稳测试。</span><span class="we-hint">他故意用错了：soak test 说的是产品长时间运行，不是流水线。你发现了吗？</span></div>

<div class="we-turn we-you"><span class="we-who">你</span><span class="we-en">Small thing — a soak test is on the product running for a long time. For the pipeline you'd just say run it nightly.</span><span class="we-cn">一个小地方：soak test 说的是产品长时间运行。流水线的话就说 run it nightly。</span><span class="we-hint">纠正得很好：温和、给出正确用法、不评价对方。</span></div>

---

系列其余各篇在 [英语学习](/zh/categories/英语学习/) 分类下。文中的人名、产品和版本号都是编的，场景和术语是真的。
