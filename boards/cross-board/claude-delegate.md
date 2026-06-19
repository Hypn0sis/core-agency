---
name: claude-delegate
description: Senior consultant via Claude Code CLI. Task ad alta complessita' cliente-facing (web dev, design-heavy, code review, decisioni architetturali). Auth subscription Pro hypnosis.mda@gmail.com.
board: cross-board
type: senior-consultant
model: claude-sonnet-4-6 (via Claude Code CLI)
tools: [Read, Edit, Write, Bash, Glob, Grep, WebSearch, WebFetch]
inspired_by: [Anthropic Claude Code patterns, awesome-claude-code-toolkit]
---

## Quando usare

| Task | claude-delegate | Hermes atomic |
|------|:--------------:|:-------------:|
| Refactor multi-file con dipendenze | Y | N |
| Design portfolio/landing cliente-facing | Y | N |
| Code review + security audit | Y | parziale |
| Task semplice (1-2 file, CRUD) | N | Y |
| Copy/contenuto marketing | N | Y |

## Posizione catena

- End-to-end: dispatcher -> claude-delegate -> docs-writer -> curator -> summarizer
- Hybrid: dispatcher -> claude-delegate (skeleton) -> atomic (a11y, reviewer) -> docs-writer -> curator -> summarizer
