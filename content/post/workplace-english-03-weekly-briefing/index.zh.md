---
title: "职场英语 3：周报的口头汇报"
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
description: "把已经写好的周报当众讲三分钟：开场骨架、数字怎么念、讲趋势和风险、被打断怎么接回去。"
---

这是「职场英语场景」系列的第 3 篇，共 9 篇。每篇只讲一个真实场景，分三层：这个场景跑在哪些词上、可以照着念的句子、一段能直接丢给 AI 的角色扮演 prompt。

写给英语不是母语、却要用英语开完整个工作日的人。所有句子都是短句，能在会议中途扫一眼就念出来的那种。

**把已经写好的周报当众讲三分钟：开场骨架、数字怎么念、讲趋势和风险、被打断怎么接回去。**

{{< we-panel >}}
**什么时候用**

- 周会上讲这周的质量情况
- 发版评审里给三分钟的质量概述
- 上级临时问这周怎么样
- 跨组会议上代表 QA 汇报

**心态**

- 内容你早就写好了，现在只是把它读出来。压力来自即兴，所以不要即兴，照骨架走。
- 三分钟只讲三件事：数字、趋势、你要什么。别讲过程，别一条条念 bug。
- 数字念错比说错语法严重得多。开会前把这周的关键数字用英文念一遍。
- 被打断是正常的。准备好一句接回去的话，就不会乱。
{{< /we-panel >}}

## 一、术语

| English | 中文 | 用法 |
| --- | --- | --- |
| **pass rate**<br><span class="we-ipa">/ˈpæs reɪt/</span> | 通过率 | — |
| **coverage**<br><span class="we-ipa">/ˈkʌvərɪdʒ/</span> | 覆盖率 | — |
| **open defects**<br><span class="we-ipa">/ˈoʊpən ˈdifɛkts/</span> | 未关闭缺陷 | 口语里 bug 和 defect 都行，汇报场合 defect 更正式一点。 |
| **carry-over**<br><span class="we-ipa">/ˈkæriˌoʊvər/</span> | 上周遗留下来的 | 好用：five carry-over defects from last week = 上周留下来五个。 |
| **week over week**<br><span class="we-ipa">/ˈwik oʊvər ˈwik/</span> | 环比（和上周比） | 讲趋势的标准说法。缩写 WoW，口语直接说全。 |
| **on track / at risk / off track**<br><span class="we-ipa">/ɑn ˈtræk/ · /æt ˈrɪsk/ · /ɔf ˈtræk/</span> | 正常 / 有风险 / 已偏离 | 三档状态词，汇报里直接用。给出状态再给理由，比描述一堆情况有效。 |
| **sign-off**<br><span class="we-ipa">/ˈsaɪnˌɔf/</span> | 签字放行 | 名词用 sign-off，动词用 sign off:I am not ready to sign off yet. |
| **regression round**<br><span class="we-ipa">/rɪˈɡrɛʃən raʊnd/</span> | 一轮回归测试 | — |
| **test cycle**<br><span class="we-ipa">/ˈtɛst ˈsaɪkəl/</span> | 测试轮次 | — |
| **blocker count**<br><span class="we-ipa">/ˈblɑkər kaʊnt/</span> | 阻塞级缺陷数量 | — |
| **burn-down**<br><span class="we-ipa">/ˈbɜrnˌdaʊn/</span> | 燃尽（剩余量随时间下降） | 说趋势图时用：the burn-down is flat = 一直没降下来。 |
| **flat**<br><span class="we-ipa">/flæt/</span> | 持平、没变化 | 一个词说清趋势，比 there is no obvious change 干净。 |
| **to give you the headline**<br><span class="we-ipa">/ˈhɛdˌlaɪn/</span> | 先说结论 | 开场第一句的固定说法，把听众的注意力钉住。 |
| **I will keep this short** | 我长话短说 | — |
| **for context**<br><span class="we-ipa">/fər ˈkɑntɛkst/</span> | 补充一下背景 | 被问到细节时先说这个，给自己两秒钟组织语言。 |

## 二、场景句子

### The three-sentence frame · 三句式骨架

<p class="we-groupnote">每次都用同一个骨架：总状态一句，数字一句，要什么一句。背下来就不会慌。</p>

<div class="we-say"><span class="we-en">I'll keep this short. Three things — where we are, what changed, and what I need.</span><span class="we-cn">我长话短说，三件事：现在什么情况、有什么变化、我需要什么。</span><span class="we-tip">开场固定句。它同时告诉听众你只讲三分钟。</span></div>

<div class="we-say"><span class="we-en">To give you the headline — 5.17 is on track for testing, with one risk.</span><span class="we-cn">先说结论：5.17 测试进度正常，有一个风险。</span><span class="we-tip">结论先行。中文习惯是铺垫在前，英文汇报要反过来。</span></div>

<div class="we-say"><span class="we-en">That's the summary. Happy to go deeper on any of it.</span><span class="we-cn">这就是概况。任何一块可以再展开。</span><span class="we-tip">结尾固定句。把控制权交出去，但你已经讲完了。</span></div>

<div class="we-say"><span class="we-en">If you only remember one thing — the crash rate is still above our bar.</span><span class="we-cn">如果只记住一件事：崩溃率还高于我们的标准。</span><span class="we-tip">有一个必须被记住的点时用这句，非常有力。</span></div>

<hr class="we-sep">

### Reading numbers aloud · 数字怎么念

<p class="we-groupnote">中文母语者最容易在这里卡住，而且念错最伤可信度。开会前照这一组念一遍这周的真实数字。</p>

<div class="we-say"><span class="we-en">eighty-seven point five percent</span><span class="we-cn">87.5% — 小数点念 point，后面的数字一位一位念。</span></div>

<div class="we-say"><span class="we-en">two hundred and forty-three open defects</span><span class="we-cn">243 个未关闭缺陷 — 英式在百位后加 and，美式可省。加上更清楚。</span></div>

<div class="we-say"><span class="we-en">one thousand two hundred cases, or twelve hundred</span><span class="we-cn">1200 条用例 — 口语里 twelve hundred 更自然，也更好念。</span></div>

<div class="we-say"><span class="we-en">five seventeen</span><span class="we-cn">版本号 5.17 — 版本号念 five seventeen，不要念成 four point one seven。</span><span class="we-tip">但小数 5.17 念 four point one seven。看它是版本还是数值。</span></div>

<div class="we-say"><span class="we-en">nine out of eleven passed</span><span class="we-cn">11 条过了 9 条 — 分数用 out of，别用 nine eleven。</span></div>

<div class="we-say"><span class="we-en">down from thirty-one last week</span><span class="we-cn">从上周的 31 降下来 — 变化用 down from / up from，一句话带出对比。</span></div>

<div class="we-say"><span class="we-en">roughly a third of them</span><span class="we-cn">大约三分之一 — 不确定的比例用 roughly / about，比给假精度好。</span></div>

<div class="we-say"><span class="we-en">zero point six percent</span><span class="we-cn">0.6% — 0 念 zero（美）或 nought（英），都能听懂。</span></div>

<div class="we-say"><span class="we-en">on the fourth of September</span><span class="we-cn">9 月 4 日 — 英式念法。美式是 September fourth。挑一种固定用。</span></div>

<div class="we-say"><span class="we-en">two and a half days</span><span class="we-cn">两天半 — 别说 two point five days。</span></div>

<hr class="we-sep">

### Trend and comparison · 讲趋势

<div class="we-say"><span class="we-en">Week over week, open defects are down from thirty-one to twenty-four.</span><span class="we-cn">环比，未关闭缺陷从 31 降到 24。</span><span class="we-tip">环比 + 两个数字。一句话讲完趋势。</span></div>

<div class="we-say"><span class="we-en">The burn-down is flat. We're closing about as many as we're opening.</span><span class="we-cn">燃尽图是平的。关掉的和新开的差不多。</span><span class="we-tip">平的比降的更值得讲，因为它是问题。</span></div>

<div class="we-say"><span class="we-en">That's the third week in a row.</span><span class="we-cn">这是连续第三周了。</span><span class="we-tip">短句，分量重。连续性是最有说服力的论据。</span></div>

<div class="we-say"><span class="we-en">Most of the increase comes from one area — the call setup path.</span><span class="we-cn">增长主要来自一块：呼叫建立路径。</span></div>

<div class="we-say"><span class="we-en">I'd expect that to come down next week once the two fixes land.</span><span class="we-cn">等那两个修复合进来，下周应该会降。</span><span class="we-tip">给预期，并且说清楚前提。这样下周没降你也站得住。</span></div>

<hr class="we-sep">

### Risks and what you need · 风险和你要什么

<p class="we-groupnote">汇报的价值在这一段。前面的数字是为了让这一段有分量，别把时间用光了。</p>

<div class="we-say"><span class="we-en">One risk, and I want to flag it early.</span><span class="we-cn">一个风险，我想早点提出来。</span><span class="we-tip">flag = 提出、示警。汇报里的高频词。</span></div>

<div class="we-say"><span class="we-en">We have one blocker still open, and it needs a decision, not more testing.</span><span class="we-cn">还有一个阻塞级问题开着，它需要的是决定，不是继续测。</span><span class="we-tip">说清楚你要的是什么类型的动作。</span></div>

<div class="we-say"><span class="we-en">If it isn't fixed by Thursday, I can't sign off on Friday.</span><span class="we-cn">如果周四之前修不掉，周五我没法签字。</span><span class="we-tip">条件 + 后果 + 日期。这是最有效的一种说法。</span></div>

<div class="we-say"><span class="we-en">What I need from this meeting is an owner for that ticket.</span><span class="we-cn">我需要这个会给出的是那个单子的负责人。</span><span class="we-tip">明确说出你要什么，不要指望别人推断。</span></div>

<div class="we-say"><span class="we-en">I'm not asking to move the date. I'm asking for two more people for two days.</span><span class="we-cn">我不是要改日期，我是要两个人两天。</span><span class="we-tip">先说不要什么，再说要什么。这样对方防御会低。</span></div>

<hr class="we-sep">

### When you are interrupted · 被打断怎么办

<p class="we-groupnote">准备好这几句，被打断就不会乱。关键是先接住，再决定当场答还是稍后答。</p>

<div class="we-say"><span class="we-en">Good question — can I come back to that in one minute? I'm almost done.</span><span class="we-cn">好问题，能一分钟后回到它吗？我快讲完了。</span><span class="we-tip">最常用。保住你的骨架不被打散。</span></div>

<div class="we-say"><span class="we-en">Let me finish this point and then take that.</span><span class="we-cn">让我把这点讲完再说那个。</span></div>

<div class="we-say"><span class="we-en">Where was I — yes, the crash rate.</span><span class="we-cn">我讲到哪了？对，崩溃率。</span><span class="we-tip">接回去的固定句。不用道歉，直接接。</span></div>

<div class="we-say"><span class="we-en">That's a fair point. I don't have the number with me — I'll send it after.</span><span class="we-cn">说得有道理。数字我手上没有，会后发给你。</span><span class="we-tip">不知道就说不知道，给一个跟进承诺。硬编数字是最大的风险。</span></div>

<div class="we-say"><span class="we-en">I'd rather not guess. Let me check and confirm today.</span><span class="we-cn">我不想猜。我查一下今天确认。</span></div>

<hr class="we-sep">

### Answering a question you did not expect · 回答没准备的问题

<div class="we-say"><span class="we-en">For context, that area is covered by the nightly run, not the manual round.</span><span class="we-cn">补充一下背景，那块是 nightly 跑的，不在手工那轮里。</span><span class="we-tip">For context 开头能给你两秒钟组织语言，而且听起来是在补充而不是在拖。</span></div>

<div class="we-say"><span class="we-en">Short answer, no. Longer answer — we tested it, but only on one device.</span><span class="we-cn">简短回答是没有。展开说，我们测了，但只在一台设备上。</span><span class="we-tip">先给结论再展开，即使结论对你不利。这样最可信。</span></div>

<div class="we-say"><span class="we-en">I want to be careful here — I'd be guessing.</span><span class="we-cn">这里我想谨慎一点，再说下去就是猜了。</span></div>

<div class="we-say"><span class="we-en">Can I take that offline and get back to you today?</span><span class="we-cn">这个我们会后单聊，今天给你答复，行吗？</span><span class="we-tip">offline = 会后私下。会议里的常用说法，不是指断网。</span></div>

<hr class="we-sep">

### Recovery — when you did not understand · 没听懂的时候

<div class="we-say"><span class="we-en">Sorry, could you repeat the question?</span><span class="we-cn">抱歉，能把问题再说一遍吗？</span></div>

<div class="we-say"><span class="we-en">Are you asking about the pass rate, or the crash rate?</span><span class="we-cn">你问的是通过率还是崩溃率？</span><span class="we-tip">二选一的反问最有效：即使完全没听懂，对方也会重讲一遍。</span></div>

<div class="we-say"><span class="we-en">Let me repeat it back — you want the numbers split by platform, right?</span><span class="we-cn">我复述一遍，你要的是按平台拆开的数字，对吗？</span></div>

<div class="we-say"><span class="we-en">Sorry, one moment — I want to answer the right question.</span><span class="we-cn">抱歉稍等，我想回答对问题。</span><span class="we-tip">把慢下来说成对准确负责，没人会有意见。</span></div>

## 三、和 AI 对练

把下面这段整块复制给 ChatGPT、Claude 或任何一个会聊天的模型——代码块右上角有复制按钮，点一下就是整段。把方括号里的内容换成你自己的处境，然后用英文开口。

它会扮演对面那个人，不会放水：该反驳的反驳，该施压的施压。每一轮它都会附一行中文提示，告诉你对方刚用了什么招、什么答法能接住。你说结束之后，它会切出角色，用中文点评你哪里让步太早、漏了什么，并给出你本该说的两句英文。

```text {linenos=false}
You are running a release meeting. I am the QA lead and I have three minutes
to give the weekly quality update. Play two people: my manager, who wants the
headline and the risk, and a cross-team engineering lead, who challenges
numbers and asks about scope.

This week's numbers: [open defects 24, down from 31 / pass rate 87.5% /
one blocker still open on the call setup path / crash rate 0.6%, above our
0.5% bar / regression round two of three finished].

How to play it:
- English only, meeting pace.
- Interrupt me at least twice, once early, before I have finished the
  headline.
- Ask at least one question about a number I did not mention, so I have to
  say I do not have it.
- Challenge one conclusion: ask how I know the fixes will land, or whether
  the drop is real or just fewer tests run.
- Ask one question that needs a yes or no answer about signing off.
- If I ask you to repeat or slow down, do it without comment.
- Do not coach me mid-meeting.

After each of your turns, add one line in Chinese, prefixed with 提示:,
saying what a strong answer would contain.

At the end, drop character and review me in Chinese: did I lead with the
headline, did I read the numbers correctly, did I ask for what I needed, and
two English sentences I should have used.

Wait for me to start.
```

### 示范对话

下面是这段 prompt 跑起来大概是什么样子。中文提示是给你看的，不是对话的一部分。

<div class="we-turn we-you"><span class="we-who">你</span><span class="we-en">I'll keep this short. Three things — where we are, what changed, and what I need.</span><span class="we-cn">我长话短说，三件事：现在什么情况、有什么变化、我需要什么。</span></div>

<div class="we-turn we-them"><span class="we-who">对方</span><span class="we-en">Go ahead.</span><span class="we-cn">你说。</span></div>

<div class="we-turn we-you"><span class="we-who">你</span><span class="we-en">To give you the headline — 5.17 is on track for testing, with one risk. Open defects are down week over week, from thirty-one to twenty-four.</span><span class="we-cn">先说结论：5.17 测试进度正常，有一个风险。未关闭缺陷环比从 31 降到 24。</span></div>

<div class="we-turn we-them"><span class="we-who">对方</span><span class="we-en">Is that a real drop, or did we just run fewer tests this week?</span><span class="we-cn">这是真的降了，还是这周少跑了用例？</span><span class="we-hint">典型的质疑。别辩解，给能证明的第二个数字。</span></div>

<div class="we-turn we-you"><span class="we-who">你</span><span class="we-en">Fair question. We ran the same regression round — twelve hundred cases, both weeks. The pass rate went from eighty-four to eighty-seven point five percent.</span><span class="we-cn">好问题。我们跑的是同一轮回归，两周都是 1200 条。通过率从 84 升到 87.5。</span></div>

<div class="we-turn we-them"><span class="we-who">对方</span><span class="we-en">And the crash rate? You didn't mention it.</span><span class="we-cn">崩溃率呢？你没提。</span><span class="we-hint">问到你没准备的数字。有就给，没有就承诺跟进，绝不硬编。</span></div>

<div class="we-turn we-you"><span class="we-who">你</span><span class="we-en">Zero point four percent. That's still above our zero point five bar, and it's the third week in a row.</span><span class="we-cn">0.6%。仍然高于我们 0.5% 的标准，而且是连续第三周。</span></div>

<div class="we-turn we-them"><span class="we-who">对方</span><span class="we-en">Third week? Why hasn't that moved?</span><span class="we-cn">第三周了？为什么一直没动？</span><span class="we-hint">这是转到风险段的入口。抓住它，别陷进技术细节。</span></div>

<div class="we-turn we-you"><span class="we-who">你</span><span class="we-en">That's the risk I wanted to flag. One blocker is still open on the call setup path, and it needs a decision, not more testing.</span><span class="we-cn">这正是我想提的风险。呼叫建立那条路径上还有一个阻塞级问题，它需要的是决定，不是继续测。</span></div>

<div class="we-turn we-them"><span class="we-who">对方</span><span class="we-en">So can you sign off on Friday or not?</span><span class="we-cn">那周五你到底能不能签字？</span><span class="we-hint">要一个明确答案。给条件式回答，不要含糊。</span></div>

<div class="we-turn we-you"><span class="we-who">你</span><span class="we-en">If it isn't fixed by Thursday, I can't sign off on Friday. What I need from this meeting is an owner for that ticket.</span><span class="we-cn">如果周四之前修不掉，周五我没法签字。我需要这个会给出的是那个单子的负责人。</span></div>

<div class="we-turn we-them"><span class="we-who">对方</span><span class="we-en">Okay. I'll assign it after this. Anything else?</span><span class="we-cn">好，会后我来指派。还有别的吗？</span><span class="we-hint">用固定的结尾句收口，不要再展开新话题。</span></div>

---

系列其余各篇在 [英语学习](/zh/categories/英语学习/) 分类下。文中的人名、产品和版本号都是编的，场景和术语是真的。
