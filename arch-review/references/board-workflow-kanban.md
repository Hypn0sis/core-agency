# Board Workflow & Kanban Integration Reference

Concrete Kanban + workflow setup commands per board, from a 4-board Wingman deployment.

## Kanban Board Creation

```bash
# One per board
hermes kanban boards create sviluppo --name "Sviluppo" \
  --default-workdir ~/wingman/boards/sviluppo/
hermes kanban boards create marketing --name "Marketing" \
  --default-workdir ~/wingman/boards/marketing/
hermes kanban boards create admin --name "Admin" \
  --default-workdir ~/wingman/boards/admin/
hermes kanban boards create sales --name "Sales" \
  --default-workdir ~/wingman/boards/sales/

# Verify
hermes kanban boards list
```

## Workflow Skills

Each board needs a workflow skill (SKILL.md) loaded globally (~/.hermes/skills/) defining:

- **Agent list** — ruolo + quando chiamarlo
- **Lifecycle** — Dispatcher → Atomico → Curator → Summarizer
- **Mini-report format** — template standardizzato
- **TODO rules** — apertura/chiusura obbligatoria
- **Summarizer ingestion** — dove scrive il summary

### Stylistic rules (per user preference)

- **Compact**: each skill under 100 lines. No filler, no exposition.
- **Clear rails**: "binari netti" — numbered rules, mandatory templates, no ambiguity.
- **No overengineering**: solve the current problem, don't predict future needs.
- **Synthetic**: "poco, sintetico e fatto benissimo."

### Mini-report template (must be identical across all boards)

```
## Mini-Report
- task:      <id/nome>
- agente:    <nome>
- esito:     ✅ completato | ⚠️ parziale | ❌ fallito
- dettagli:  <2-3 righe>
- note:      <bloccanti o "nessuna">
- todo:      <aperto/chiuso>
```

## Profile → Board Mapping

| Kanban board | Hermes profile | Workflow skill | Wingman agents dir |
|---|---|---|---|
| sviluppo | sviluppo | board-sviluppo | ~/wingman/boards/sviluppo/ |
| marketing | marketing | board-marketing | ~/wingman/boards/marketing/ |
| admin | admin | board-admin | ~/wingman/boards/admin/ |
| sales | sales | board-sales | ~/wingman/boards/sales/ |

## Task Creation Convention

```bash
hermes kanban --board <board> create "<Titolo>" --assignee <profile> --body "<Descrizione>" --goal
```

⚠️ `--board` goes BEFORE the subcommand, not after. Both `--board` and `--assignee` are required. The board determines which queue the task sits in; the assignee determines which Hermes profile runs it. Add `--goal` for open-ended tasks that need multi-turn completion; add `--skill board-<board>` to force-load the board's workflow skill into the worker.

### Pitfall: wrong argument order

```bash
# ❌ WRONG — --board after create fails
hermes kanban create --board marketing --assignee marketing "Brochure" --body "..."
# Output: hermes: error: unrecognized arguments: --board marketing

# ✅ CORRECT — --board before the subcommand
hermes kanban --board marketing create "Brochure" --assignee marketing --body "..."
```

## Worker Flow (what happens at runtime)

1. Gateway dispatcher (every 60s) polls all boards
2. Finds a ready task → checks its `assignee` field
3. Spawns a Hermes worker under that profile
4. Worker loads the profile's SOUL.md + pruned skills + global skills
5. Worker follows the board workflow skill (4-step lifecycle)
6. Worker executes, produces mini-report, signals completion
7. Kanban marks task complete, worker shuts down

## VPS Constraints (real from 1.8 GiB / 2 vCPU)

- Max 1 concurrent worker (delegation.max_concurrent_children: 1)
- Gateway only on `default` profile (~381 MiB RSS)
- Board profiles have gateway stopped (0 RAM when idle)
- 8 GB swap as peak cushion
