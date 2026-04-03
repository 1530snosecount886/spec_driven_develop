---
description: Launch the Spec-Driven Development workflow for a large-scale project task
argument-hint: <task description, e.g. "rewrite this project in Rust">
allowed-tools: [Read, Glob, Grep, Bash, LS, Write, NotebookRead, WebFetch, TodoWrite, WebSearch, BashOutput]
---

# Spec-Driven Development

You are executing the **Spec-Driven Development** workflow. This is a standardized pre-development pipeline that prepares everything needed before actual coding begins on a large-scale complex task.

## Task Input

The user's task description: $ARGUMENTS

## Cross-Conversation Continuity Check

**CRITICAL**: Before anything else, check if `docs/progress/MASTER.md` exists in the project.

- If it **exists**: Read it now. You are resuming an in-progress task. Identify current phase and task, then continue from that exact point. Do NOT restart.
- If it **does not exist**: This is a fresh start. Proceed with Phase 0 below.

---

## Workflow Phases

Execute these phases in order. Confirm with the user before advancing to each next phase.

### Phase 0: Intent Recognition & Confirmation

Parse the task description above and confirm with the user:
1. **Scope**: Which parts of the project are included?
2. **Target**: What is the desired end state?
3. **Constraints**: Timeline, compatibility, library preferences?
4. **Priorities**: Performance, maintainability, feature parity?

Get explicit confirmation before proceeding.

### Phase 1: Deep Project Analysis

Launch 2-3 `project-analyzer` agents **in parallel**, each focusing on a different aspect:
- **Agent 1 — Architecture & Stack**: Project structure, directory layout, technology stack, entry points, build/run commands
- **Agent 2 — Module Inventory**: Each module's responsibility, public API surface, size, internal/external dependencies
- **Agent 3 — Risks & Patterns**: Transformation risks, complexity hotspots, platform-specific code, coding conventions

Provide each agent with the confirmed task definition from Phase 0. If sub-agents are unavailable, perform analysis sequentially.

Consolidate findings into `docs/analysis/`:
- `project-overview.md`
- `module-inventory.md`
- `risk-assessment.md`

### Phase 2: Task Decomposition

Launch 1-2 `task-architect` agents with the full analysis output:
- If the project warrants it, launch 2 agents exploring different decomposition strategies and pick the better result
- Each agent must produce **parallel execution lanes** — groups of independent tasks per phase that can run simultaneously
- Each lane must include a merge risk rating (Low/Medium/High based on file overlap)

Write to `docs/plan/`:
- `task-breakdown.md` — includes parallel lane assignments per phase
- `dependency-graph.md` — Mermaid diagram with parallel lanes as subgraphs
- `milestones.md`

### Phase 3: Progress Tracking Documentation

Create the progress tracking system:
- `docs/progress/MASTER.md` — master control file with phase summary, links, current status
- `docs/progress/phase-N-<name>.md` — one per phase with task checkboxes

Use the templates defined in the `spec-driven-develop` skill's `references/doc-templates.md`.

### Phase 4: Sub-SKILL Generation

1. Always install at **project level** (co-located with the project) — do not ask the user.
2. Use the platform's native `skill-creator` skill to generate a task-specific SKILL containing:
   - Cross-conversation continuity protocol (read MASTER.md first)
   - Target technology coding standards
   - Progress update instructions
   - **Parallel execution protocol**: At each phase start, read parallel lanes from `task-breakdown.md` and launch `task-executor` sub-agents for independent lanes simultaneously. Use worktree isolation when available.
   - Archive trigger when all tasks complete

### Phase 5: Handoff

Present all generated artifacts to the user in a summary. Ask: "Ready to begin development?"

### Phase 6: Archive (triggered when all tasks complete)

When all checkboxes in MASTER.md are done:
1. Move all artifacts to `docs/archives/<project-name>/`
2. Move the project-level sub-SKILL into the archive
3. Create or update `docs/archives/README.md` index
4. Remove the now-empty working directories

---

## Rules

- Never skip phases. Confirm at each boundary.
- Update progress docs after every completed task.
- New conversation = read MASTER.md first, always.
- Prefer parallel execution: when a phase has multiple independent lanes, launch `task-executor` agents simultaneously rather than working sequentially.
- After parallel execution, always run the full test suite to verify combined changes are coherent.
