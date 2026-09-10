---
title: "职场英语 4：和产品对 spec、划测试范围"
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
description: "复述你的理解、问出 spec 没写的、把不可测的需求推回去、最后把验收标准定下来。"
---

这是「职场英语场景」系列的第 4 篇，共 9 篇。每篇只讲一个真实场景，分三层：这个场景跑在哪些词上、可以照着念的句子、一段能直接丢给 AI 的角色扮演 prompt。

写给英语不是母语、却要用英语开完整个工作日的人。所有句子都是短句，能在会议中途扫一眼就念出来的那种。

**复述你的理解、问出 spec 没写的、把不可测的需求推回去、最后把验收标准定下来。**

{{< we-panel >}}
**什么时候用**

- Productboard 上来了新 spec，要划测试范围
- 需求评审会
- 开发到一半发现 spec 有洞
- 要跟产品确认某个行为是不是预期

**心态**

- 你的价值不是挑刺，是在开发动手之前把洞找出来。这个定位说出来，对方会配合得多。
- 先复述你的理解，再提问题。复述能暴露 80% 的误解，而且不会让人有防御。
- spec 没写的地方才是 bug 的来源。异常、边界、并发、权限、弱网 —— 每次都问一遍。
- 不可测的需求不要接。接了就是你的锅。要一个可判断的标准，不是形容词。
{{< /we-panel >}}

## 一、术语

| English | 中文 | 用法 |
| --- | --- | --- |
| **spec / specification**<br><span class="we-ipa">/spɛk/ · /ˌspɛsəfɪˈkeɪʃən/</span> | 规格说明 | — |
| **requirement**<br><span class="we-ipa">/rɪˈkwaɪrmənt/</span> | 需求 | — |
| **acceptance criteria**<br><span class="we-ipa">/əkˈsɛptəns kraɪˈtɪriə/</span> | 验收标准 | 这个场景的核心词。会议结束前一定要拿到它，否则等于没对齐。 |
| **happy path**<br><span class="we-ipa">/ˈhæpi pæθ/</span> | 主流程（一切正常的路径） | 用法：the spec only covers the happy path = spec 只写了顺利的情况。这是最常见的问题。 |
| **error state**<br><span class="we-ipa">/ˈɛrər steɪt/</span> | 异常状态 | — |
| **edge case**<br><span class="we-ipa">/ˈɛdʒ keɪs/</span> | 边界场景 | — |
| **out of scope**<br><span class="we-ipa">/aʊt əv ˈskoʊp/</span> | 不在范围内 | 划范围时最有用的短语。明确说出不测什么，和说测什么同样重要。 |
| **assumption**<br><span class="we-ipa">/əˈsʌmpʃən/</span> | 假设 | 用法：let me state my assumption = 我先说我的假设。把默认前提摆出来，常能发现分歧。 |
| **dependency**<br><span class="we-ipa">/dɪˈpɛndənsi/</span> | 依赖项 | — |
| **testable**<br><span class="we-ipa">/ˈtɛstəbəl/</span> | 可测的 | 推回需求的关键词：as written, this is not testable = 按现在的写法，这个没法测。 |
| **ambiguous**<br><span class="we-ipa">/æmˈbɪɡjuəs/</span> | 有歧义的 | 比说 unclear 更精确，而且不带指责。 |
| **to nail down**<br><span class="we-ipa">/ˈneɪl daʊn/</span> | 敲定 | 用法：can we nail down what fast means = 我们能不能把"快"定下来。 |
| **user story**<br><span class="we-ipa">/ˈjuzər ˈstɔri/</span> | 用户故事 | — |
| **rollout / timeframe**<br><span class="we-ipa">/ˈroʊlˌaʊt/ · /ˈtaɪmˌfreɪm/</span> | 上线节奏 / 时间窗 | Productboard 上的 timeframe 字段就是这个，问它能知道你什么时候要准备好。 |
| **to align on**<br><span class="we-ipa">/əˈlaɪn/</span> | 就某事对齐 | 开场和收尾都能用：I want us to align on scope today. |

## 二、场景句子

### Open by playing it back · 先复述你的理解

<p class="we-groupnote">永远从复述开始。这一步能暴露大部分误解，而且没有任何攻击性。</p>

<div class="we-say"><span class="we-en">Let me play back what I understood, and you correct me.</span><span class="we-cn">我把我理解的复述一遍，你来纠正我。</span><span class="we-tip">这个场景最有价值的一句话。背下来。</span></div>

<div class="we-say"><span class="we-en">So the user taps the banner, we open the call screen, and the tone plays before the audio opens. Is that right?</span><span class="we-cn">所以用户点横幅，我们打开通话页，提示音在音频打开之前响。对吗？</span></div>

<div class="we-say"><span class="we-en">I want us to align on scope today, not on implementation.</span><span class="we-cn">今天我想对齐的是范围，不是实现方式。</span><span class="we-tip">开场就把会议边界划出来，能省一半时间。</span></div>

<div class="we-say"><span class="we-en">Let me state my assumption — this only applies to one-to-one calls, not group calls.</span><span class="we-cn">我先说我的假设：这只适用于一对一通话，不包括群通话。</span><span class="we-tip">把默认前提摆出来。分歧常常就藏在双方各自的默认里。</span></div>

<hr class="we-sep">

### Asking what the spec does not say · 问 spec 没写的

<p class="we-groupnote">固定问一遍这几类：异常、边界、并发、权限、弱网、老版本。每次都能挖出东西。</p>

<div class="we-say"><span class="we-en">The spec covers the happy path. What happens when it fails?</span><span class="we-cn">spec 写了主流程。失败的时候会怎样？</span><span class="we-tip">一句话点出最常见的缺口，而且是在帮忙，不是在挑刺。</span></div>

<div class="we-say"><span class="we-en">What should the user see if the network drops halfway through?</span><span class="we-cn">如果中途断网，用户应该看到什么？</span></div>

<div class="we-say"><span class="we-en">What if they do it twice quickly?</span><span class="we-cn">如果他们快速点两次呢？</span></div>

<div class="we-say"><span class="we-en">Does this apply to users who haven't updated yet?</span><span class="we-cn">这个对还没更新的用户适用吗？</span></div>

<div class="we-say"><span class="we-en">Who is allowed to do this? Everyone, or only the host?</span><span class="we-cn">谁有权限做这个？所有人还是只有主持人？</span></div>

<div class="we-say"><span class="we-en">Is there anything you deliberately left out?</span><span class="we-cn">有没有什么是你有意没写的？</span><span class="we-tip">好问题。有时候缺口是故意的，问清楚就不用测。</span></div>

<hr class="we-sep">

### Scoping what you will test · 划测试范围

<div class="we-say"><span class="we-en">Here's what I plan to cover, and here's what I'm treating as out of scope.</span><span class="we-cn">这是我打算覆盖的，这是我当作不在范围内的。</span><span class="we-tip">两边都说。只说测什么，别人会默认你什么都测。</span></div>

<div class="we-say"><span class="we-en">I'll test it on Android 14 and iOS 17. Older versions are out of scope unless you tell me otherwise.</span><span class="we-cn">我会在 Android 14 和 iOS 17 上测。更老的版本不在范围内，除非你另有要求。</span></div>

<div class="we-say"><span class="we-en">Group calls are a separate story, so I'm not testing them here.</span><span class="we-cn">群通话是另一个故事，所以这里我不测。</span></div>

<div class="we-say"><span class="we-en">That's a dependency on the gateway team. I can't test it until they deliver.</span><span class="we-cn">那个依赖网关团队。他们交付之前我测不了。</span><span class="we-tip">依赖要当场说出来，并说清楚它会挡住什么。</span></div>

<div class="we-say"><span class="we-en">If the scope grows, I'll need to tell you what comes off the list.</span><span class="we-cn">如果范围变大，我需要告诉你哪些要从清单上拿掉。</span><span class="we-tip">提前立好规则，后面加需求时就不是谈判，是执行约定。</span></div>

<hr class="we-sep">

### Pushing back on something you cannot test · 把不可测的需求推回去

<p class="we-groupnote">不要说 this is a bad requirement。说它不可测，并直接提出一个可测的版本。</p>

<div class="we-say"><span class="we-en">As written, this isn't testable. Can we nail down what fast means?</span><span class="we-cn">按现在的写法，这个没法测。我们能把"快"定下来吗？</span></div>

<div class="we-say"><span class="we-en">Give me a number and I can verify it. Under two seconds on a normal network?</span><span class="we-cn">给我一个数字我就能验证。正常网络下两秒以内？</span><span class="we-tip">自己先提一个数，比让对方想快得多，而且你掌握了基准。</span></div>

<div class="we-say"><span class="we-en">The word smooth is ambiguous. What would a user complain about if it wasn't smooth?</span><span class="we-cn">"流畅"这个词有歧义。如果不流畅，用户会抱怨什么？</span><span class="we-tip">把形容词换成用户会说的话，通常就能变成可测的条件。</span></div>

<div class="we-say"><span class="we-en">I'm not saying no. I'm saying I can't tell you whether it passed.</span><span class="we-cn">我不是说不行，我是说我没法告诉你它过没过。</span><span class="we-tip">立场准确，不像反对。</span></div>

<div class="we-say"><span class="we-en">Can we agree on how we'd know this works?</span><span class="we-cn">我们能不能先说好，怎么才算它工作正常？</span></div>

<hr class="we-sep">

### When you disagree with the product side · 和产品有分歧

<div class="we-say"><span class="we-en">I see it differently, and I might be wrong. Can I explain?</span><span class="we-cn">我看法不同，也可能是我错了。我能解释一下吗？</span><span class="we-tip">先留出对方是对的空间，他们才会真的听。</span></div>

<div class="we-say"><span class="we-en">From what we see in support tickets, users read this as an error.</span><span class="we-cn">从客服工单看，用户会把这个理解成出错。</span><span class="we-tip">用数据说话。QA 手里的现场数据是你最强的资产。</span></div>

<div class="we-say"><span class="we-en">That's your call, not mine. I just want it written down so I can test against it.</span><span class="we-cn">这是你决定，不是我决定。我只是希望写下来，这样我能照着测。</span><span class="we-tip">争不下来时的标准出路。让步了，但拿到了可测的标准。</span></div>

<div class="we-say"><span class="we-en">Can we ask a couple of users before we decide?</span><span class="we-cn">决定之前我们能不能问几个用户？</span></div>

<hr class="we-sep">

### Closing with acceptance criteria · 用验收标准收口

<p class="we-groupnote">会议不以验收标准结束，等于没开。走之前一定要拿到它，并且写在 story 上。</p>

<div class="we-say"><span class="we-en">Before we finish — can we write the acceptance criteria together?</span><span class="we-cn">结束之前，我们一起把验收标准写出来好吗？</span></div>

<div class="we-say"><span class="we-en">Three lines is enough. Given, when, then.</span><span class="we-cn">三行就够：什么前提、什么操作、什么结果。</span><span class="we-tip">given/when/then 是通用格式，产品和开发都认。</span></div>

<div class="we-say"><span class="we-en">I'll put these in the story and tag you. Correct me there if I got it wrong.</span><span class="we-cn">我会把这些写到 story 里并 @ 你。写错了在那里纠正我。</span><span class="we-tip">把书面确认放到会后，给了你消化英语讨论的时间。</span></div>

<div class="we-say"><span class="we-en">One open question stays — the permission rule. Who's getting back to me on that?</span><span class="we-cn">还有一个问题没定：权限规则。这个谁给我答复？</span><span class="we-tip">明确留一个负责人和一件事，悬而未决的东西才不会消失。</span></div>

<hr class="we-sep">

### Recovery — when you did not understand · 没听懂的时候

<p class="we-groupnote">产品讲需求语速快，而且爱用抽象词。这个场合听不懂的代价是你测错东西，一定要问。</p>

<div class="we-say"><span class="we-en">Sorry — can you describe that from the user's side?</span><span class="we-cn">抱歉，你能从用户视角描述一下吗？</span><span class="we-tip">一举两得：换个说法你就懂了，而且用户视角本来就是更该讨论的角度。</span></div>

<div class="we-say"><span class="we-en">Let me play that back — you mean the banner stays until they tap it, right?</span><span class="we-cn">我复述一下：你的意思是横幅一直在，直到他们点它，对吗？</span></div>

<div class="we-say"><span class="we-en">Can you draw it, or send me a screenshot?</span><span class="we-cn">你能画一下，或者发我一张截图吗？</span><span class="we-tip">需求讨论里最有效的一句。图比英语好懂。</span></div>

<div class="we-say"><span class="we-en">What do you mean by that word here? I want to use it the same way you do.</span><span class="we-cn">这里那个词你指的是什么？我想跟你用同一个意思。</span></div>

<div class="we-say"><span class="we-en">I'll re-read the spec after this and send you my questions in writing.</span><span class="we-cn">会后我再读一遍 spec，把问题书面发给你。</span><span class="we-tip">兜底。当场没跟上就不要硬撑，书面追问反而更清楚。</span></div>

## 三、和 AI 对练

把下面这段整块复制给 ChatGPT、Claude 或任何一个会聊天的模型——代码块右上角有复制按钮，点一下就是整段。把方括号里的内容换成你自己的处境，然后用英文开口。

它会扮演对面那个人，不会放水：该反驳的反驳，该施压的施压。每一轮它都会附一行中文提示，告诉你对方刚用了什么招、什么答法能接住。你说结束之后，它会切出角色，用中文点评你哪里让步太早、漏了什么，并给出你本该说的两句英文。

```text {linenos=false}
You are playing a product manager presenting a new feature to me. I am the QA
lead, and my job in this meeting is to understand the spec, find what it does
not say, and agree acceptance criteria.

The feature: [a new incoming-call banner. Tapping it opens the call screen
and answers the call. The spec describes only the successful path, in four
sentences, and says the transition should feel "fast and smooth".]

How to play it:
- English only, at the pace of a real product person: enthusiastic, quick,
  more interested in the vision than the edge cases.
- Your spec genuinely has holes. Do not volunteer them. When I ask a good
  question, think about it honestly and admit what is undefined.
- Use vague words — fast, smooth, intuitive, seamless — and defend them at
  first ("users will know"). Give a number only if I push for one.
- Have at least one wrong assumption about how the system already works, and
  let me correct you.
- At some point, casually widen the scope ("and it should work in group calls
  too") and see whether I catch it and say what comes off the list.
- If I ask you to repeat, rephrase, draw it, or send a screenshot, do it
  naturally.
- Never break character to coach me.

After each of your turns, add one line in Chinese, prefixed with 提示:,
naming the gap I just walked past or the question that would open it up.

At the end, when I close the meeting, drop character and review me in
Chinese: did I play back my understanding first, which holes I found and
which I missed, did I catch the scope creep, did I leave with acceptance
criteria, and two English sentences I should have used.

Start by presenting the feature to me.
```

### 示范对话

下面是这段 prompt 跑起来大概是什么样子。中文提示是给你看的，不是对话的一部分。

<div class="we-turn we-them"><span class="we-who">对方</span><span class="we-en">So this is the new incoming-call banner. User taps it, the call screen opens, call is answered. Should feel fast and smooth.</span><span class="we-cn">这是新的来电横幅。用户点它，通话页打开，电话接通。应该感觉又快又流畅。</span><span class="we-hint">只讲了主流程，还用了两个形容词。先复述，再挑其中一个形容词落地。</span></div>

<div class="we-turn we-you"><span class="we-who">你</span><span class="we-en">Let me play back what I understood, and you correct me. The user taps the banner, we open the call screen, and the call is answered at that moment. Is that right?</span><span class="we-cn">我把理解复述一遍，你纠正我。用户点横幅，我们打开通话页，电话在那一刻接通。对吗？</span></div>

<div class="we-turn we-them"><span class="we-who">对方</span><span class="we-en">Exactly. Simple.</span><span class="we-cn">正是。很简单。</span><span class="we-hint">说 simple 的时候通常最不简单。开始问 spec 没写的。</span></div>

<div class="we-turn we-you"><span class="we-who">你</span><span class="we-en">The spec covers the happy path. What should the user see if the network drops halfway through?</span><span class="we-cn">spec 写了主流程。如果中途断网，用户应该看到什么？</span></div>

<div class="we-turn we-them"><span class="we-who">对方</span><span class="we-en">Hm. I suppose it just... fails? We'd show the normal error, whatever that is today.</span><span class="we-cn">嗯，我猜就是失败吧？显示现在的普通错误，不管那是什么。</span><span class="we-hint">未定义。别放过，让他确认是不是就用现有的，并记下来。</span></div>

<div class="we-turn we-you"><span class="we-who">你</span><span class="we-en">I want to be precise here — is the existing error screen the intended behaviour, or is it just what happens today?</span><span class="we-cn">这里我想准确一点：现有的错误页是预期行为，还是只是现状？</span></div>

<div class="we-turn we-them"><span class="we-who">对方</span><span class="we-en">Fair. Let's say intended for now. Oh — and it should work in group calls too, obviously.</span><span class="we-cn">有道理。暂时就当是预期吧。哦，对了，群通话里当然也要能用。</span><span class="we-hint">范围悄悄扩大了。抓住它，并说清楚扩大范围要拿掉什么。</span></div>

<div class="we-turn we-you"><span class="we-who">你</span><span class="we-en">That's new to me. Group calls are a separate story. If the scope grows, I'll need to tell you what comes off the list.</span><span class="we-cn">这个我第一次听到。群通话是另一个故事。如果范围变大，我需要告诉你哪些要从清单上拿掉。</span></div>

<div class="we-turn we-them"><span class="we-who">对方</span><span class="we-en">Okay, leave group calls out for now. But the speed matters — it really has to feel fast.</span><span class="we-cn">好吧，群通话先不算。但速度很重要，一定要感觉快。</span><span class="we-hint">又回到形容词了。直接提一个数字，把基准握在自己手里。</span></div>

<div class="we-turn we-you"><span class="we-who">你</span><span class="we-en">As written, fast isn't testable. Give me a number and I can verify it — under two seconds on a normal network?</span><span class="we-cn">按现在的写法，"快"没法测。给我一个数字我就能验证：正常网络下两秒以内？</span></div>

<div class="we-turn we-them"><span class="we-who">对方</span><span class="we-en">Two seconds sounds right. Under two on normal network, let's say four on a weak one.</span><span class="we-cn">两秒听起来对。正常网络两秒内，弱网就四秒吧。</span><span class="we-hint">拿到数字了。趁热把验收标准写下来，别等会后。</span></div>

<div class="we-turn we-you"><span class="we-who">你</span><span class="we-en">Before we finish — can we write the acceptance criteria together? Three lines is enough. I'll put them in the story and tag you.</span><span class="we-cn">结束之前，我们一起把验收标准写出来？三行就够。我写到 story 里并 @ 你。</span></div>

---

系列其余各篇在 [英语学习](/zh/categories/英语学习/) 分类下。文中的人名、产品和版本号都是编的，场景和术语是真的。
