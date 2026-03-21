# Spec-Driven Develop

A cross-platform AI agent skill that automates the pre-development workflow for large-scale complex tasks.

When you tell your AI agent something like "rewrite this project in Rust" or "migrate to a microservice architecture", the agent automatically executes a standardized preparation pipeline before any code is written:

1. Deep project analysis
2. Task decomposition and planning
3. Progress tracking documentation
4. Task-specific sub-SKILL generation
5. Iterative development with document-driven progress awareness

The entire workflow is document-driven: a master progress file serves as the agent's "memory anchor" across conversations, so it never loses track of where things stand.

## Supported Platforms

- **Cursor** — installed as a global or project-level skill
- **Codex (OpenAI)** — installed as a skill
- **Claude Code** — installed as a plugin (with enhanced agent/command support)

## Installation

### Cursor

```bash
bash scripts/install-cursor.sh
```

Or manually copy `skills/spec-driven-develop/` to `~/.cursor/skills/spec-driven-develop/`.

### Codex

```bash
bash scripts/install-codex.sh
```

Or manually copy `skills/spec-driven-develop/` to `~/.codex/skills/spec-driven-develop/`.

### Claude Code

Add this repository as a plugin source. Claude Code will automatically load the skills, agents, and commands defined here.

Alternatively, use the `/install-plugin` command in Claude Code to install from the GitHub repository URL.

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

When working on a long-running task across multiple conversations, the agent reads `docs/progress/MASTER.md` at the start of each new conversation to restore context and continue from where it left off.

### Cleanup

When all tasks are marked complete in the master progress file, the agent enters cleanup mode: it asks which artifacts you want to keep and removes the rest.

## Project Structure

```
spec_driven_develop/
├── .claude-plugin/plugin.json         # Claude Code plugin metadata
├── skills/spec-driven-develop/
│   ├── SKILL.md                       # Core skill (works on all platforms)
│   └── references/doc-templates.md    # Document templates
├── agents/                            # Claude Code sub-agents
│   ├── project-analyzer.md
│   └── task-architect.md
├── commands/spec-dev.md               # /spec-dev slash command (Claude Code)
├── scripts/                           # Installation scripts
│   ├── install-cursor.sh
│   ├── install-codex.sh
│   └── install-all.sh
└── LICENSE
```

## License

MIT
