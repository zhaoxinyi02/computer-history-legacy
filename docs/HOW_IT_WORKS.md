# Git 时间戳实验原理 / How It Works

> 本文解释这个仓库为什么能出现“几十年前的提交”，以及为什么最终只能稳定回到 1970 年。

## 1. Commit 并不只是“文件快照”

Git 的 commit 对象会记录：

- 一个 `tree`：该版本的目录与文件状态
- 一个或多个 `parent`：上一条提交
- `author` 与 author date
- `committer` 与 committer date
- commit message

因此日期并不是由 GitHub 根据“上传时间”生成的；它本身就在 commit 对象里。

## 2. 日期可以显式指定

Git 支持通过 `GIT_AUTHOR_DATE` 和 `GIT_COMMITTER_DATE` 指定日期。例如：

```bash
GIT_AUTHOR_DATE="1971-11-15T12:00:00+0000" GIT_COMMITTER_DATE="1971-11-15T12:00:00+0000" git commit -m "milestone: Intel 4004 starts the microprocessor era"
```

这类能力有正常用途，例如仓库迁移、邮件补丁导入、历史数据恢复、测试和历史重写。

## 3. 为什么 1945 不行？

Git 官方文档把内部日期格式定义为：

```text
<unix-timestamp> <time-zone-offset>
```

其中 `unix-timestamp` 是从 Unix epoch 开始计算的秒数。

本仓库实际做了两次测试：

### 本地 Git

尝试：

```bash
GIT_AUTHOR_DATE="1945-12-10T09:00:00+0000" GIT_COMMITTER_DATE="1945-12-10T09:00:00+0000" git commit -m "..."
```

当前正常 Git 工具链直接报：

```text
fatal: invalid date format
```

### GitHub Git Data API

我们又向 GitHub API 提交了 author/committer date 为：

```text
1945-12-10T09:00:00Z
```

请求本身被接受，但 GitHub 返回的实际 commit date 是：

```text
1970-01-01T00:00:00Z
```

所以这个仓库选择如实保留这个边界，而不是把 1945 假装成 GitHub 能正确显示的 commit。

## 4. 为什么改日期会改 SHA？

Commit 的内容参与对象哈希计算。

当 author date 或 committer date 变化时，commit 对象字节内容也变化，于是 commit SHA 随之变化。其后所有以它为 parent 的提交也会受到连锁影响。

所以“重写时间”实际上是在创建一条新的 Git 历史，而不是单独修改一个 UI 上的日期字段。

## 5. 这能证明 Git 历史不可信么？

更准确的说法是：

> **普通 Git commit 的时间字段不是可信时间戳服务。**

Git 的对象哈希非常适合做完整性校验；但一个日期是否真的对应现实世界中的那个时刻，需要额外证据。

判断一个项目真实历史时，应该综合：

- 仓库创建时间
- 签名 commit / tag
- Release
- Issue / Pull Request
- 包管理器发布时间
- 邮件列表
- 外部镜像
- Wayback Machine 或其他存档
- 同时期的独立资料

## 6. 安全复现

`scripts/rebuild-history.sh` 不会修改当前仓库，而会新建一个独立的演示目录并在那里生成 1970→2026 的 synthetic history。

这也是为什么仓库把所有模拟行为都公开写出来：目标是展示 Git 的数据模型，而不是让人误以为这个项目真的来自几十年前。
