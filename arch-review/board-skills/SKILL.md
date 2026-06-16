---
name: board-sales
title: Sales Board — Catena Specialistica
description: Playbook operativo per il Board Sales. Definisce come il dispatcher e la catena di specialisti (prospector→proposal-writer→negotiator→docs-writer) gestiscono lead e chiusure.
tags:
  - board-sales
  - workflow
  - dispatcher
  - chain
  - specialisti
triggers:
  - "board-sales loaded"
  - "sales task"
  - "lead management"
  - "outreach"
---

# Board Sales — Catena Specialistica

> **Architettura B1 (PREFERRED):** L'agente dispatcher (`~/.hermes/profiles/sales/SOUL.md`) crea TUTTI i sotto-task specialistici contemporaneamente.
>
> Ogni specialista esegue il suo compito, poi chiama `kanban_complete`. **NON crea altri task** — i task per tutti gli specialisti sono già stati creati dal dispatcher.
>
> L'ultimo specialista (docs-writer) scrive il report prima di completare.

## Catena Sales

```
┌─────────────┐   ┌────────────────┐   ┌────────────┐   ┌──────────────┐
│  PROSPECTOR │ → │ PROPOSAL WRITER│ → │ NEGOTIATOR │ → │ DOCS WRITER  │
│ Lead ricerca │   │  Offerte       │   │  Outreach  │   │  Chiude docs │
│  kanban→    │   │  kanban→       │   │  kanban→   │   │  COMPLETA    │
└─────────────┘   └────────────────┘   └────────────┘   └──────────────┘
```

## Profili Specialisti

| Profilo | Assegnato quando | Cosa fa | Passa a |
|---------|-----------------|---------|---------|
| `sales-prospector` | Ricerca lead | PagineGialle, web research, scoring, aggiornamento pipeline | `sales-proposal-writer` |
| `sales-proposal-writer` | Scrittura offerte | Proposte personalizzate, preventivi, bundle recommendation | `sales-negotiator` |
| `sales-negotiator` | Contatto lead | Outreach, chiamate, DM, email, follow-up, upsell | `sales-docs-writer` |
| `sales-docs-writer` | Documentazione chiusura | Deal docs, pipeline update, handoff ad Admin | **FINE** — report + kanban_complete |
| `sales-account-manager` | Post-vendita | Retention, upsell, customer success, QBR, referral | Dopo docs-writer |
| `sales-collections-agent` | Solleciti | Scadenze, morosi, piani di rientro, escalation | Task specifico |
| `sales-competitor-analyst` | Competitor | Monitoraggio, feature comparison, battle cards, pricing gap | Prima di prospector |
| `sales-crm-keeper` | CRM | Pipeline stages, follow-up reminders, data quality, lead routing | In parallelo a prospector |
| `sales-pricing-manager` | Pricing | Scontistica, pacchetti, upsell/cross-sell, revenue optimization | Prima di proposal-writer |
| `sales-revenue-tracker` | Revenue | MRR/ARR tracking, forecast, trend analysis, churn impact | Task specifico |

## Regole B1 (Dispatcher crea tutti i task)

1. Il dispatcher analizza il task e crea TUTTI i sotto-task (prospector, proposal-writer, negotiator, docs-writer) IN UNA VOLTA, SENZA `--skill`
2. Ogni specialista esegue il suo compito e chiama `kanban_complete`. **NON crea altri task.**
3. **PARENT_ID** passato dal dispatcher nel body: `PARENT_ID: {id}`. Ogni specialista lo cerca.
4. **Docs-writer (penultimo):** dopo documentazione:
   a. Aggiorna `vault-global-knowledge/diary.md` con riga del board sales
   b. **Crea task per Curator** con PARENT_ID nel body
   c. `kanban_complete`
5. **Curator (ultimo):** revisiona ciclo di vita. Se OK:
   a. **Chiude parent task**: `hermes kanban --board sales complete {PARENT_ID}`
   b. Crea task per Summarizer
   c. `kanban_complete`
   d. Se problemi → `kanban_block`
6. **Task semplice** (es. follow-up): dispatcher → direttamente a negotiator. Negotiator crea task per Curator (salta docs-writer). Curator chiude.
7. **Fallimento**: se uno specialista fallisce, Curator non riceve task. Parent task NON va chiuso.

## Creazione Task

```bash
# Wingman: task su board sales
hermes kanban --board sales create "TITOLO" --assignee sales --body "desc" --goal

# Dispatcher: crea TUTTI i sotto-task per la catena (una volta sola)
hermes kanban --board sales create "TITOLO: prospect" --assignee sales-prospector --parent TASK_ID
hermes kanban --board sales create "TITOLO: proposal" --assignee sales-proposal-writer --parent TASK_ID
hermes kanban --board sales create "TITOLO: negotiate" --assignee sales-negotiator --parent TASK_ID
hermes kanban --board sales create "TITOLO: close" --assignee sales-docs-writer --parent TASK_ID
```

⚠️ **I sotto-task ereditano i `--skill` dal parent. NON passare `--skill` sul parent** — i figli crashano perché lo specialista non risolve la skill (HERMES_HOME diverso). Ogni specialista carica la skill on-demand via `skill_view()` nel SOUL.md.

⚠️ **Per task con lead già identificato**: dispatcher → direttamente a `--assignee sales-proposal-writer`, salta prospector.

## ⚠️ Pitfall: Protocol Violation

Ogni agente specialista DEVE chiamare `kanban_complete(summary=...)` alla fine del suo lavoro. Se esce senza chiamarla, il gateway segnala "protocol violation" e crasha il task.

## ⚠️ Pitfall: Duplicazione Task

In B1 il dispatcher crea TUTTI i sub-task. Nessuno specialista crea altri task — esegue e completa. Se vedi task duplicati, il dispatcher ha creato due volte gli stessi sub-task.

## Cross-board

- Case studies / contenuti → `kanban_create --board marketing --assignee marketing-copywriter`
- Client websites → `kanban_create --board sviluppo --assignee sviluppo-builder`
- Contratti / SLA → `kanban_create --board admin --assignee admin-contract-manager`
- Fatture / pagamenti → `kanban_create --board admin --assignee admin-billing-officer`

## Riferimenti

- Profili: `~/.hermes/profiles/sales-*/SOUL.md`
- Dispatcher: `~/.hermes/profiles/sales/SOUL.md`
- Vault globale: `~/wingman/vault-global-knowledge/`
- Lead: `~/wingman/lead-research.md`, `~/wingman/lead-script-contatto.md`, `~/wingman/email-hooks.md`
- Offer/pricing: `~/wingman/offerta-servizi-digitali.md`
