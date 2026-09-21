<div align="center">

# 计算机祖传项目 / Computer History Legacy

**把计算机发展史写进 Git 日志里。**

[简体中文](./README.md) · [English](./README_EN.md)

<code>1945 → 2026</code> · <code>Git Metadata Lab</code> · <code>Computer History</code>

<img src="assets/hero.svg" width="100%" alt="Computer History Legacy" />

</div>

> [!IMPORTANT]
> **这不是真正从 1945 年开发至今的软件项目。**  
> 这是一个公开标注的 Git 元数据实验：模拟“祖传项目”效果，同时讲一遍计算机发展史。

## 最有意思的结论

我们真的尝试过把第一条 commit 放到 **1945 年**。

结果是：

- 本地 Git 直接拒绝 1945 的正常日期写法；
- GitHub Git Data API 接受 1945 的输入，却把生成的 commit 钳制到 **1970-01-01 00:00:00 UTC**；
- 因为 Git 的标准提交时间以 Unix timestamp 表示，正常工具链的稳定边界就是 Unix epoch。

所以这个仓库最后形成了一个更有意思的故事：

> **计算机史从 1945 开始，但 Git 时间机器最多只能倒车到 1970。**

## 一条写进 Git 日志里的计算机发展史

<img src="assets/timeline.svg" width="100%" alt="Timeline" />

| 年份 | 节点 | 意义 |
|---:|---|---|
| 1945 | ENIAC 完成阶段 | 计算机史序章 |
| 1970 | Unix epoch | 本仓库 Git 历史真正开始 |
| 1971 | Intel 4004 | 微处理器时代 |
| 1981 | IBM PC | 个人计算走向主流 |
| 1991 | World Wide Web | Web 时代 |
| 2005 | Git | 软件历史记录方式改变 |
| 2007 | 智能手机 | 计算进入口袋 |
| 2022 | 生成式 AI | 大模型进入大众工具 |
| 2026 | AI-native | 从点击软件走向委托智能体 |

打开 **Commits** 页面，你会看到一条从 **1970 → 2026** 的年度提交链。  
1945 → 1969 则作为“计算机史序章”保留，因为我们不想假装 GitHub 能显示它实际上无法表达的日期。

## Git 为什么能“改时间”？

<img src="assets/git-anatomy.svg" width="100%" alt="Git timestamp anatomy" />

Git commit 会记录 author、committer 和时间。时间本身就是 commit 对象的一部分。

~~~bash
GIT_AUTHOR_DATE="1971-11-15T12:00:00+0000" \
GIT_COMMITTER_DATE="1971-11-15T12:00:00+0000" \
git commit -m "milestone: Intel 4004 starts the microprocessor era"
~~~

所以：**修改时间 → commit 对象变化 → SHA 也变化。**

这不是漏洞。迁移、导入、测试和历史重写本来就会使用这些能力。

## 仓库导览

- [docs/HOW_IT_WORKS.md](docs/HOW_IT_WORKS.md) — Git 时间戳与 commit 对象
- [docs/YEARBOOK.md](docs/YEARBOOK.md) — 真正随年度 commit 增长的账本
- [docs/SOURCES.md](docs/SOURCES.md) — 历史资料来源
- [scripts/rebuild-history.sh](scripts/rebuild-history.sh) — 可复现实验脚本

## 一个小提醒

判断一个项目到底有多老，**不要只看 commit date**。还应该结合仓库创建时间、Release、Issue、PR、签名、包发布时间、邮件列表和外部存档。

<div align="center">

### 如果 1970 年的 commit 让你愣了 3 秒，这个仓库就值了。

**它不是时间机器，是 Git。**

[Read in English →](./README_EN.md)

</div>
