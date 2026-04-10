# Progress Document Templates

Templates for the tracking documents generated in Phase 4 (Progress Tracking Documentation). Output to `docs/progress/`.

---

## MASTER.md (Master Control File)

```markdown
# [Task Name] — Progress Tracker

> **Task**: One-line description
> **Started**: YYYY-MM-DD
> **Last Updated**: YYYY-MM-DD

## References
- [Project Overview](../analysis/project-overview.md)
- [Module Inventory](../analysis/module-inventory.md)
- [Risk Assessment](../analysis/risk-assessment.md)
- [Task Breakdown](../plan/task-breakdown.md)
- [Dependency Graph](../plan/dependency-graph.md)
- [Milestones](../plan/milestones.md)

## Phase Summary

| Phase | Name | Tasks | Done | Progress |
|:------|:-----|------:|-----:|:---------|
| 1     |      |     N |    0 |          |
| 2     |      |     N |    0 |          |

## Phase Checklist
- [ ] Phase 1: <name> (0/N tasks) — [details](./phase-1-<name>.md)
- [ ] Phase 2: <name> (0/N tasks) — [details](./phase-2-<name>.md)

## Current Status
<!-- Updated by the agent at the start and end of each work session -->
**Active Phase**: Phase N
**Active Task**: Task description
**Blockers**: None / description

## Next Steps
<!-- What the agent should do next when resuming in a new conversation -->
1. ...
2. ...

## Session Log
<!-- Append-only log of work sessions -->
| Date | Session | Summary |
|:-----|:--------|:--------|
|      |         |         |
```

---

## phase-N-\<name\>.md (Per-Phase Detail File)

```markdown
# Phase N: <Phase Name>

**Goal**: What this phase achieves
**Status**: Not Started / In Progress / Complete

## Tasks
- [ ] **Task N.1**: Description
  - Priority: P0
  - Effort: M
  - Acceptance: How to verify this is done
  - Notes: _none yet_
- [ ] **Task N.2**: Description
  - Priority: P1
  - Effort: S
  - Acceptance: How to verify this is done
  - Notes: _none yet_

## Phase Notes
<!-- Decisions, blockers, context discovered during this phase -->

## Phase Completion Checklist
- [ ] All tasks above are checked off
- [ ] MASTER.md phase count updated
- [ ] MASTER.md "Current Status" updated to next phase
```
