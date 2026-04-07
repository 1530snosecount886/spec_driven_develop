[English](./README.md) | **中文**

[![GitHub stars](https://img.shields.io/github/stars/zhu1090093659/spec_driven_develop?style=social)](https://github.com/zhu1090093659/spec_driven_develop/stargazers)
[![Forks](https://img.shields.io/github/forks/zhu1090093659/spec_driven_develop?style=social)](https://github.com/zhu1090093659/spec_driven_develop/fork)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Claude%20Code%20%7C%20Codex%20%7C%20Cursor-FF6B6B.svg)](https://github.com)

## 目录

- [它做什么](#它做什么)
- [S.U.P.E.R — 架构骨架](#super--架构骨架)
- [为什么不用 Superpowers / oh-my-claude / ...?](#为什么不用-superpowers--oh-my-claude--)
- [平台兼容性](#平台兼容性)
- [安装](#安装)
- [使用方法](#使用方法)
- [项目结构](#项目结构)
- [友情链接](#友情链接)
- [许可证](#许可证)

# Spec-Driven Develop

**给 AI Coding Agent 的结构化方法论。纯 Markdown。全平台通用。架构优先。**

Spec-Driven Develop 是一个平台无关的 AI Agent 技能，为大规模复杂任务自动化完整的开发前流水线。它赋予任何 Coding Agent 一套完整的方法论——从深度项目分析、分阶段任务分解、文档驱动的进度追踪，到任务专属 sub-SKILL 生成——一切都在写第一行业务代码之前完成。

没有 SDK。没有运行时。没有依赖。只有任何 AI Coding Agent 都能读取并执行的 Markdown 文件。

## 它做什么

当你对 Agent 说"把这个项目用 Rust 重写"或"迁移到微服务架构"时，Spec-Driven Develop 会启动一条 6 阶段的准备流水线：

```
Phase 0  意图识别                  明确范围、目标状态、约束条件
    |
Phase 1  深度分析                  分析架构、盘点模块、评估风险
    |                              —— 附带 S.U.P.E.R 架构健康度评估
    |
Phase 2  任务分解                  拆分为阶段、任务、并行泳道
    |                              —— 每个任务标注 S.U.P.E.R 设计驱动原则
    |
Phase 3  进度追踪                  生成 MASTER.md + 逐阶段明细文件
    |                              用于跨对话连续性
    |
Phase 4  Sub-SKILL 生成            创建项目级 SKILL，内联完整
    |                              S.U.P.E.R 原则和代码审查清单
    |
Phase 5  交接                      展示所有产出物，确认就绪
    |
   ...   开发阶段                  带进度追踪的迭代实现
    |
Phase 6  归档                      保存所有工件以便溯源
```

一个主进度文件（`docs/progress/MASTER.md`）充当 Agent 跨对话的记忆锚点。不管任务跨越多少轮对话，Agent 始终知道当前进展。

## S.U.P.E.R — 架构骨架

S.U.P.E.R 不是附录——它是驱动整个工作流每个阶段、以及 Agent 产出的每一行代码的设计哲学。

> 写代码就像搭乐高——每块积木只干一件事，接口标准，方向明确，到哪都能跑，随时可以换。

| 原则 | 含义 | 如何强制执行 |
|:-----|:-----|:-------------|
| **S**ingle Purpose | 一个模块，一个职责 | 分析阶段对每个模块的单一职责进行合规评分。横跨多个关注点的任务会被进一步拆解。 |
| **U**nidirectional Flow | 数据单向流动 | 架构健康检查标记循环依赖。依赖必须向内指——外层依赖内层，反向绝不允许。 |
| **P**orts over Implementation | 先定契约再写实现 | 模块盘点评估 I/O 是否有 schema 定义。任务分解要求接口契约先于实现任务。 |
| **E**nvironment-Agnostic | 到哪都能跑 | 风险评估捕获硬编码配置和平台特定假设。配置必须来自环境变量或配置文件。 |
| **R**eplaceable Parts | 换件不波及全局 | 每个模块按替换成本评分。如果替换一个组件导致连锁变更，说明架构有问题。 |

### S.U.P.E.R 在哪里生效

S.U.P.E.R 不是一个 Agent "可能会读"的参考文档——它被织入工作流的每一层：

- **Phase 1 — 分析**：每个模块获得逐原则合规评分（`S🟢 U🟡 P🔴 E🟢 R🟡`）。风险评估包含 S.U.P.E.R 架构健康度汇总和违规热点。
- **Phase 2 — 规划**：每个任务标注其 S.U.P.E.R 设计驱动原则（该任务最需要关注哪些原则）。早期阶段优先修复违规热点，再构建新功能。
- **Phase 4 — Sub-SKILL**：完整的 S.U.P.E.R 五原则被**逐字内联**到生成的 sub-SKILL 中（不是仅引用文件），同时包含一个强制性的 **10 项代码审查清单**，Agent 在每个任务完成后必须通过：

  | 检查项 | 原则 |
  |:-------|:-----|
  | 每个新模块/文件只有一个职责 | S |
  | 没有函数做了不止一件概念上的事 | S |
  | 数据流向 input → processing → output，无反向依赖 | U |
  | 没有引入循环导入 | U |
  | 跨模块接口有 schema 定义（类型/契约） | P |
  | 模块 I/O 可序列化 | P |
  | 没有硬编码的路径、URL、密钥或配置值 | E |
  | 所有新依赖都显式声明在依赖文件中 | E |
  | 新模块可以被替换而不影响其他模块 | R |
  | 变更后所有测试通过 | — |

  **全部通过 = 继续。1-2 项失败 = 修复后再标记完成。3 项以上失败 = 停下来重构。**

## 为什么不用 Superpowers / oh-my-claude / ...?

Claude Code 生态中已经有了不少重量级选手：几十个 Agent 的编排系统、多阶段流水线、强制性的开发方法论。它们很强大——但也很重，而且把你锁死在单一平台上。

| | Spec-Driven Develop | Superpowers | oh-my-claudecode |
|---|---|---|---|
| **本质** | 方法论系统（Markdown 文件） | 完整的技能框架 + 方法论 | 多 Agent 编排系统 |
| **核心体积** | 1 SKILL + 5 模板 + 3 参考文档 | 插件 + 多个 Skill、Agent、Hook | 插件 + 32 个以上专用 Agent |
| **外部依赖** | 无——纯 Markdown | 依赖 Claude Code 插件系统 | 依赖 Claude Code 插件系统 |
| **架构哲学** | S.U.P.E.R（贯穿每个阶段强制执行） | 强制 TDD（RED-GREEN-REFACTOR） | Team 模式多 Agent 委派 |
| **跨平台** | 任何能读 Markdown 的 Agent | Claude Code（主要） | 仅 Claude Code |
| **代码质量保障** | S.U.P.E.R 逐任务代码审查清单 | TDD 循环强制执行 | Agent 级别的质量检查 |
| **设计哲学** | 架构优先，文档驱动 | 完整的软件开发方法论 | 并行多 Agent 编排 |

Spec-Driven Develop 站在中间地带：比单个 prompt 文件更有体系，但依然零依赖、全平台通用。它不是用框架把你的 Agent 包裹起来，而是通过纯 Markdown 文件交给 Agent 一套方法论。你始终保有完全的控制权。

这让它特别适合：

- **已有成熟工作流的团队**，需要在大型任务前增加结构化规划
- **多平台用户**，在 Claude Code、Cursor、Codex 等多个工具之间切换
- **注重架构的开发者**，希望 S.U.P.E.R 原则从第一天就被强制执行，而不是事后补救

## 平台兼容性

SKILL 的 prompt 以通用、平台中立的方式编写。在缺少某些能力的平台上会自动优雅降级——比如，如果平台不支持子 Agent，就自动回退到顺序执行。

**已测试并提供安装脚本的平台：**

- **Claude Code** — 以插件形式安装（支持增强的 Agent/命令能力）
- **Codex (OpenAI)** — 以 Skill 形式安装
- **Cursor** — 以全局或项目级 Skill 形式安装

**其他任意 Agent** — 把 `SKILL.md`（如果需要完整的模板和协议支持，再加上 `references/` 目录）复制到你的 Agent 读取指令的位置。这些文件没有外部依赖，没有平台特定逻辑。Windsurf、Cline、Aider、Continue、Roo Code、Augment，或其他任何能读 Markdown 技能/系统提示词的 Coding Agent，都能直接使用。

## 安装

### Claude Code

```
/plugin marketplace add zhu1090093659/spec_driven_develop
/plugin install spec-driven-develop@spec-driven-develop
```

安装完成后，执行 `/reload-plugins` 激活。

### Codex CLI

在 Codex 会话中使用内置的 Skill 安装器：

```
$skill-installer install https://github.com/zhu1090093659/spec_driven_develop/tree/main/plugins/spec-driven-develop/skills/spec-driven-develop
```

或者通过 Shell 脚本安装：

```bash
bash <(curl -sL https://raw.githubusercontent.com/zhu1090093659/spec_driven_develop/main/scripts/install-codex.sh)
```

### Cursor

```bash
bash <(curl -sL https://raw.githubusercontent.com/zhu1090093659/spec_driven_develop/main/scripts/install-cursor.sh)
```

也可以克隆仓库后本地安装：

```bash
git clone https://github.com/zhu1090093659/spec_driven_develop.git
bash spec_driven_develop/scripts/install-cursor.sh
```

### 其他 Agent（通用方式）

对于其他任何 Coding Agent，拿到 SKILL 文件，放到 Agent 读取指令的位置：

```bash
# 下载 SKILL.md
curl -sL https://raw.githubusercontent.com/zhu1090093659/spec_driven_develop/main/plugins/spec-driven-develop/skills/spec-driven-develop/SKILL.md -o SKILL.md
```

放置位置取决于你用的 Agent：

| Agent | 位置 |
|---|---|
| Windsurf | `.windsurf/skills/` 或项目规则 |
| Cline | `.cline/skills/` 或自定义指令 |
| Aider | 通过 `.aider.conf.yml` 引用，或直接粘贴到对话中 |
| Continue | `.continue/` 配置或系统提示词 |
| 其他 | 你的 Agent 读取自定义指令或系统提示词的任何位置 |

如果你的 Agent 没有正式的"技能"目录，可以直接把 `SKILL.md` 的内容粘贴到它的系统提示词或自定义指令字段里——效果一样。

## 使用方法

### 自动触发

直接向 Agent 描述你的大规模任务即可，Skill 会根据以下关键词自动触发：

- 英文：rewrite、migrate、overhaul、refactor entire project、transform、rebuild in [language]
- 中文：改造、重写、迁移、重构、大规模

### 手动触发（Claude Code）

```
/spec-dev rewrite this Python project in Rust
```

### 跨对话连续性

在跨多轮对话处理长周期任务时，Agent 会在每次新对话开始时读取 `docs/progress/MASTER.md`，恢复上下文并从上次中断的地方继续。

### 原生任务追踪

Agent 在每次工作会话开始时，会自动把当前阶段的待办任务加载到平台原生的任务追踪工具中（例如 Claude Code 的 TodoWrite）。你可以直接在 IDE 侧边栏里看到实时进度，不需要手动翻 Markdown 文件。MASTER.md 依然是跨对话的持久化真相源，原生工具负责会话内的即时可视化。

### 进度导出

一个可选的脚本可以把进度数据导出为结构化 JSON，方便导入到外部项目管理工具（Linear、Jira、Notion 等）：

```bash
python scripts/export-progress.py docs/progress/
```

### 归档

当所有任务标记完成后，Agent 会把所有工作产出物（分析文档、计划文档、进度记录、sub-SKILL）归档到 `docs/archives/<项目名>/`，并更新 `docs/archives/README.md` 索引。不会删除任何东西，全部保留以便溯源。

## 项目结构

```
spec_driven_develop/
├── plugins/spec-driven-develop/              # 独立的 Claude Code 插件
│   ├── skills/spec-driven-develop/
│   │   ├── SKILL.md                          # 核心工作流——全平台通用
│   │   └── references/
│   │       ├── super-philosophy.md           # S.U.P.E.R 架构原则
│   │       ├── parallel-protocol.md          # 并行执行协议
│   │       ├── behavioral-rules.md           # 不可违反的工作流规则
│   │       └── templates/                    # 文档模板（按关注点拆分）
│   │           ├── analysis.md               # Phase 1：含 S.U.P.E.R 健康度评估
│   │           ├── plan.md                   # Phase 2：含 S.U.P.E.R 设计约束
│   │           ├── progress.md               # Phase 3：跨对话进度追踪
│   │           ├── archive.md                # Phase 6：工件归档
│   │           └── sub-skill.md              # Phase 4：含内联 S.U.P.E.R + 审查清单
│   ├── agents/                               # Claude Code 子 Agent（可选增强）
│   │   ├── project-analyzer.md
│   │   ├── task-architect.md
│   │   └── task-executor.md
│   └── commands/spec-dev.md                  # /spec-dev 斜杠命令（Claude Code）
├── scripts/                                  # 安装与工具脚本
│   ├── install-cursor.sh
│   ├── install-codex.sh
│   ├── install-all.sh
│   └── export-progress.py                    # 进度导出为 JSON
└── LICENSE
```

跨平台使用的核心文件是 `SKILL.md` 和 `references/` 目录。其他的——agents、commands、插件清单——都是 Claude Code 平台上的增强功能。

## Star History

<p align="center">
  <a href="https://www.star-history.com/#zhu1090093659/spec_driven_develop&Date" target="_blank">
    <img src="https://api.star-history.com/svg?repos=zhu1090093659/spec_driven_develop&type=Date" alt="Star History" width="600">
  </a>
</p>

## 友情链接

- [linux.do](https://linux.do)

## 许可证

MIT
