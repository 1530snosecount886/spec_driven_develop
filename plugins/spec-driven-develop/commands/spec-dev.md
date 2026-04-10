---
description: Launch the Spec-Driven Development workflow for a large-scale project task
argument-hint: <task description, e.g. "rewrite this project in Rust">
allowed-tools: [Read, Glob, Grep, Bash, LS, Write, NotebookRead, WebFetch, TodoWrite, WebSearch, BashOutput]
---

# Spec-Driven Development

The user's task description: **$ARGUMENTS**

Execute this task by following the `spec-driven-develop` skill in full. That skill defines the complete workflow (Phase 0 through Phase 7), all templates, behavioral rules, and parallel execution protocols.

**Start here**: check if `docs/progress/MASTER.md` exists. If yes, resume from where you left off. If no, begin Phase 0.
