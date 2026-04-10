**English** | [中文](./README.zh-CN.md)

[![GitHub stars](https://img.shields.io/github/stars/zhu1090093659/spec_driven_develop?style=social)](https://github.com/zhu1090093659/spec_driven_develop/stargazers)
[![Forks](https://img.shields.io/github/forks/zhu1090093659/spec_driven_develop?style=social)](https://github.com/zhu1090093659/spec_driven_develop/fork)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Claude%20Code%20%7C%20Codex%20%7C%20Cursor-FF6B6B.svg)](https://github.com)

## Table of Contents

- [What It Does](#what-it-does)
- [S.U.P.E.R — The Architectural Backbone](#super--the-architectural-backbone)
- [Why Not Superpowers / oh-my-claude / ...?](#why-not-superpowers--oh-my-claude--)
- [Platform Compatibility](#platform-compatibility)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Friendly Links](#friendly-links)
- [License](#license)

# Spec-Driven Develop

**A structured methodology for AI coding agents. Pure Markdown. Any platform. Architecture-first.**

Spec-Driven Develop is a platform-agnostic AI agent skill that automates the full pre-development pipeline for large-scale complex tasks. It gives any coding agent a complete methodology — from deep project analysis to phased task decomposition, document-driven progress tracking, and task-specific sub-SKILL generation — all before a single line of implementation code is written.

No SDK. No runtime. No dependencies. Just Markdown files that any AI coding agent can read and execute.

## What It Does

When you tell your agent something like "rewrite this project in Rust" or "migrate to a microservice architecture", Spec-Driven Develop kicks in with a 7-phase preparation pipeline:

```
Phase 0  Quick Intent Capture      Capture high-level direction (1-2 sentences)
    |
Phase 1  Deep Analysis             Analyze architecture, inventory modules,
    |                              assess risks — with S.U.P.E.R health evaluation
    |
Phase 2  Intent Refinement         Ask targeted questions grounded in analysis,
    |                              confirm scope, priorities, and constraints
    |
Phase 3  Task Decomposition        Break work into phases, tasks, parallel lanes —
    |                              each task annotated with S.U.P.E.R design drivers
    |
Phase 4  Progress Tracking         Generate MASTER.md + per-phase detail files
    |                              for cross-conversation continuity
    |
Phase 5  Sub-SKILL Generation      Create a project-level SKILL with inlined
    |                              S.U.P.E.R principles and code review checklist
    |
Phase 6  Handoff                   Present all artifacts, confirm readiness
    |
   ...  Development Phases         Iterative implementation with progress tracking
    |
Phase 7  Archive                   Preserve all artifacts for traceability
```

A master progress file (`docs/progress/MASTER.md`) serves as the agent's memory anchor across conversations. No matter how many sessions a task spans, the agent always knows where things stand.

## S.U.P.E.R — The Architectural Backbone

S.U.P.E.R is not a footnote — it is the design philosophy that drives every phase of the workflow and every line of code the agent produces.

> Write code like building with LEGO — each brick has a single job, a standard interface, a clear direction, runs anywhere, and can be swapped at will.

| Principle | Meaning | How It's Enforced |
|:----------|:--------|:------------------|
| **S**ingle Purpose | One module, one job | Analysis phase rates each module's single-responsibility compliance. Tasks that span multiple concerns get decomposed further. |
| **U**nidirectional Flow | Data flows one way | Architecture health check flags circular dependencies. Dependencies must point inward — outer layers depend on inner, never the reverse. |
| **P**orts over Implementation | Contracts before code | Module inventory evaluates whether I/O is schema-defined. Task breakdown requires interface contracts before implementation tasks. |
| **E**nvironment-Agnostic | Runs anywhere | Risk assessment catches hardcoded config and platform-specific assumptions. Config must come from environment variables or config files. |
| **R**eplaceable Parts | Swap without ripple | Each module is rated by replacement cost. If swapping a component causes cascading changes, the architecture is broken. |

### Where S.U.P.E.R Shows Up

S.U.P.E.R isn't just a reference document the agent might read — it's woven into the workflow at every level:

- **Phase 1 — Analysis**: Every module gets a per-principle compliance score (`S🟢 U🟡 P🔴 E🟢 R🟡`). The risk assessment includes a S.U.P.E.R Architecture Health Summary with violation hotspots.
- **Phase 2 — Intent Refinement**: Analysis findings are presented to the user so they can make informed decisions about scope and S.U.P.E.R priorities before task decomposition begins.
- **Phase 3 — Planning**: Each task is annotated with its S.U.P.E.R design drivers (which principles matter most for that task). Early phases prioritize fixing violation hotspots before building new features.
- **Phase 5 — Sub-SKILL**: The full S.U.P.E.R principles are **inlined verbatim** into the generated sub-SKILL (not just referenced), along with a mandatory **10-point code review checklist** that the agent must pass after every task:

  | Check | Principle |
  |:------|:----------|
  | Every new module/file has exactly one responsibility | S |
  | No function does more than one conceptual thing | S |
  | Data flows input → processing → output, no reverse deps | U |
  | No circular imports introduced | U |
  | Cross-module interfaces are schema-defined | P |
  | Module I/O is serializable | P |
  | No hardcoded paths, URLs, keys, or config values | E |
  | All new dependencies explicitly declared | E |
  | New modules can be replaced without changes to others | R |
  | All tests pass after the change | — |

  **All pass = proceed. 1-2 fail = fix before marking complete. 3+ fail = stop and refactor.**

## Why Not Superpowers / oh-my-claude / ...?

The Claude Code ecosystem has full-blown frameworks with dozens of agents and opinionated workflows. They're powerful — but they're also heavy, and they lock you into a single platform.

| | Spec-Driven Develop | Superpowers | oh-my-claudecode |
|---|---|---|---|
| **What it is** | Methodology system (Markdown files) | Full skills framework + methodology | Multi-agent orchestration system |
| **Core footprint** | 1 SKILL + 5 templates + 3 reference docs | Plugin with multiple skills, agents, hooks | Plugin with 32+ specialized agents |
| **Dependencies** | None — pure Markdown | Requires Claude Code plugin system | Requires Claude Code plugin system |
| **Architecture philosophy** | S.U.P.E.R (enforced in every phase) | Enforced TDD (RED-GREEN-REFACTOR) | Team-based multi-agent delegation |
| **Cross-platform** | Any agent that reads Markdown | Claude Code (primary) | Claude Code only |
| **Code quality enforcement** | S.U.P.E.R code review checklist per task | TDD cycle enforcement | Agent-specific quality checks |
| **Philosophy** | Architecture-first, document-driven | Complete development methodology | Parallel multi-agent orchestration |

Spec-Driven Develop sits in the middle ground: more structured than a single prompt file, but still zero-dependency and platform-agnostic. It doesn't wrap your agent in a framework — it gives the agent a methodology through plain Markdown. You keep full control.

This makes it especially suited for:

- **Teams that already have their own workflow** and need structured planning for big tasks
- **Multi-platform users** who work across Claude Code, Cursor, Codex, and others
- **Architecture-conscious developers** who want S.U.P.E.R principles enforced from day one, not bolted on later

## Platform Compatibility

The SKILL prompt is written in a generic, platform-neutral way. It gracefully degrades on platforms without certain capabilities — for example, if sub-agents aren't available, it falls back to sequential execution automatically.

**Tested platforms with install scripts:**

- **Claude Code** — installed as a plugin (with enhanced agent/command support)
- **Codex (OpenAI)** — installed as a skill
- **Cursor** — installed as a global or project-level skill

**Any other agent** — copy `SKILL.md` (plus the `references/` directory if you want full template and protocol support) to wherever your agent reads instructions. The files have no external dependencies and no platform-specific logic. Works with Windsurf, Cline, Aider, Continue, Roo Code, Augment, or any other coding agent that reads Markdown-based skills or system prompts.

## Installation

### Claude Code

```
/plugin marketplace add zhu1090093659/spec_driven_develop
/plugin install spec-driven-develop@spec-driven-develop
```

After installation, run `/reload-plugins` to activate.

### Codex CLI

Use the built-in skill installer (inside a Codex session):

```
$skill-installer install https://github.com/zhu1090093659/spec_driven_develop/tree/main/plugins/spec-driven-develop/skills/spec-driven-develop
```

Or install via shell:

```bash
bash <(curl -sL https://raw.githubusercontent.com/zhu1090093659/spec_driven_develop/main/scripts/install-codex.sh)
```

### Cursor

```bash
bash <(curl -sL https://raw.githubusercontent.com/zhu1090093659/spec_driven_develop/main/scripts/install-cursor.sh)
```

Or clone the repo and run locally:

```bash
git clone https://github.com/zhu1090093659/spec_driven_develop.git
bash spec_driven_develop/scripts/install-cursor.sh
```

### Other Agents (Generic)

For any other coding agent, grab the SKILL file and place it where your agent reads instructions:

```bash
# Download the SKILL.md
curl -sL https://raw.githubusercontent.com/zhu1090093659/spec_driven_develop/main/plugins/spec-driven-develop/skills/spec-driven-develop/SKILL.md -o SKILL.md
```

Where to place it depends on your agent:

| Agent | Location |
|---|---|
| Windsurf | `.windsurf/skills/` or project rules |
| Cline | `.cline/skills/` or custom instructions |
| Aider | Reference via `.aider.conf.yml` or paste into chat |
| Continue | `.continue/` config or system prompt |
| Others | Wherever your agent reads custom instructions or system prompts |

If your agent doesn't have a formal "skills" directory, you can paste the content of `SKILL.md` into its system prompt or custom instructions field — the effect is the same.

## Usage

### Automatic Trigger

Simply describe your large-scale task to the agent. The skill triggers on keywords like:

- English: "rewrite", "migrate", "overhaul", "refactor entire project", "transform", "rebuild in [language]"
- Chinese: "改造", "重写", "迁移", "重构", "大规模"

### Manual Trigger (Claude Code)

```
/spec-dev rewrite this Python project in Rust
```

### Cross-Conversation Continuity

When working on a long-running task across multiple conversations, the agent reads `docs/progress/MASTER.md` at the start of each new session to restore context and continue from where it left off.

### Native Task Tracking

When the agent starts a work session, it automatically loads the current phase's pending tasks into the platform's native task tracking tool (e.g. TodoWrite in Claude Code). You get real-time visual progress in your IDE sidebar — no need to open Markdown files manually. MASTER.md remains the persistent source of truth across conversations; the native tool provides in-session visibility.

### Progress Export

An optional script exports your progress data to structured JSON, making it easy to import into external project management tools (Linear, Jira, Notion, etc.):

```bash
python scripts/export-progress.py docs/progress/
```

### Archive

When all tasks are marked complete, the agent archives all workflow artifacts (analysis, plan, progress, sub-SKILL) into `docs/archives/<project-name>/` and updates an index at `docs/archives/README.md`. Nothing is deleted — everything is preserved for traceability.

## Project Structure

```
spec_driven_develop/
├── plugins/spec-driven-develop/              # Self-contained Claude Code plugin
│   ├── skills/spec-driven-develop/
│   │   ├── SKILL.md                          # Core workflow — works on ANY platform
│   │   └── references/
│   │       ├── super-philosophy.md           # S.U.P.E.R architecture principles
│   │       ├── parallel-protocol.md          # Parallel execution protocol
│   │       ├── behavioral-rules.md           # Non-negotiable workflow rules
│   │       └── templates/                    # Document templates (one per concern)
│   │           ├── analysis.md               # Phase 1: with S.U.P.E.R health assessment
│   │           ├── plan.md                   # Phase 3: with S.U.P.E.R design constraints
│   │           ├── progress.md               # Phase 4: cross-conversation tracking
│   │           ├── archive.md                # Phase 7: artifact preservation
│   │           └── sub-skill.md              # Phase 5: with inlined S.U.P.E.R + checklist
│   ├── agents/                               # Claude Code sub-agents (optional)
│   │   ├── project-analyzer.md
│   │   ├── task-architect.md
│   │   └── task-executor.md
│   └── commands/spec-dev.md                  # /spec-dev slash command (Claude Code)
├── scripts/                                  # Installation & utility scripts
│   ├── install-cursor.sh
│   ├── install-codex.sh
│   ├── install-all.sh
│   └── export-progress.py                    # Export progress to JSON
└── LICENSE
```

The essential files for cross-platform use are `SKILL.md` and the `references/` directory. Everything else — agents, commands, plugin manifests — is platform-specific enhancement for Claude Code.

## Star History

<p align="center">
  <a href="https://www.star-history.com/#zhu1090093659/spec_driven_develop&Date" target="_blank">
    <img src="https://api.star-history.com/svg?repos=zhu1090093659/spec_driven_develop&type=Date" alt="Star History" width="600">
  </a>
</p>

## Friendly Links

- [linux.do](https://linux.do)

## License

MIT
