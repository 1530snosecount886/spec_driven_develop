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

Launch 2-3 `project-analyzer` agents in parallel, each focusing on a different aspect:
- Agent 1: Overall architecture, tech stack, and entry points
- Agent 2: Module inventory with dependency mapping
- Agent 3: Transformation risks and complexity hotspots

Consolidate findings into `docs/analysis/`:
- `project-overview.md`
- `module-inventory.md`
- `risk-assessment.md`

### Phase 2: Task Decomposition

Launch 1-2 `task-architect` agents with the analysis results:
- Provide the full analysis output and the confirmed task definition
- Request a phased breakdown with dependency graph

Write to `docs/plan/`:
- `task-breakdown.md`
- `dependency-graph.md`
- `milestones.md`

### Phase 3: Progress Tracking Documentation

Create the progress tracking system:
- `docs/progress/MASTER.md` — master control file with phase summary, links, current status
- `docs/progress/phase-N-<name>.md` — one per phase with task checkboxes

Use the templates defined in the `spec-driven-develop` skill's `references/doc-templates.md`.

### Phase 4: Sub-SKILL Generation

1. Ask the user: project-level or global-level installation?
2. Use the platform's native `skill-creator` skill to generate a task-specific SKILL containing:
   - Cross-conversation continuity protocol (read MASTER.md first)
   - Target technology coding standards
   - Progress update instructions
   - Cleanup trigger when all tasks complete

### Phase 5: Handoff

Present all generated artifacts to the user in a summary. Ask: "Ready to begin development?"

### Phase 6: Cleanup (triggered when all tasks complete)

When all checkboxes in MASTER.md are done:
1. List all generated artifacts
2. Ask user which to keep
3. Delete the rest

---

## Rules

- Never skip phases. Confirm at each boundary.
- Update progress docs after every completed task.
- New conversation = read MASTER.md first, always.
