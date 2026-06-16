# Chain Architecture — Mappe Canoniche

## Overview

La chain architecture permette di scomporre task complessi in una sequenza di specialisti atomici.
**Il docs-writer è SEMPRE PENULTIMO.** **Curator è l'ultimo (CLOSER) — l'unico che chiude il parent task.**

Esistono **2 modalità**:
- **Catena lineare** (Sviluppo, Marketing, Sales): sequenza fissa di specialisti
- **Pool** (Admin): dispatcher sceglie lo specialista giusto in base al task

I profili **curator** (1 globale) e **summarizer** (1 globale) sono trasversali a tutti i board.
**Tutte le catene ora usano B1: dispatcher crea TUTTI i sub-task in una volta.**
B2 (catena sequenziale con handoff) è **deprecato**.

### Lifecycle end-to-end

```
Wingman → parent task
  → Dispatcher → crea TUTTI i sub-task (B1) → kanban_complete
    → Specialist 1 → execute → kanban_complete
    → ...
    → Docs-writer (PENULTIMO) → documenta → vault-global-knowledge → crea task per Curator → kanban_complete
    → Curator (ULTIMO, CLOSER) → review ciclo vita → chiude parent → crea task per Summarizer → kanban_complete
    → Summarizer → report su vault-global-knowledge → kanban_complete
```

## Catene per Board

### Sviluppo

**B1:** architect → builder → tester → reviewer → docs-writer → Curator → Summarizer

| Anello | Profilo | Cosa fa | Dopo |
|--------|---------|---------|------|
| 1 | `sviluppo-architect` | ADR, struttura, tech stack | kanban_complete |
| 2 | `sviluppo-builder` | Codice, file, config | kanban_complete |
| 3 | `sviluppo-tester` | Test, validazione | kanban_complete |
| 4 | `sviluppo-reviewer` | Qualità, sicurezza | kanban_complete |
| **5** | **`sviluppo-docs-writer`** | **Documenta, vault-global-knowledge, crea Curator** | **PENULTIMO** |
| 6 | `curator` (globale) | **Review ⛔ CHIUDE parent → crea Summarizer** | **ULTIMO** |
| 7 | `summarizer` (globale) | Report su vault-global-knowledge | kanban_complete |

Opzionali: data-modeler (tra 1 e 2), integrator (tra 2 e 3), ops (tra 4 e 5), optimizer (task specifico).

### Marketing

**B1:** strategist → copywriter → visual-creator → publisher → Curator → Summarizer

| Anello | Profilo | Cosa fa | Dopo |
|--------|---------|---------|------|
| 1 | `marketing-strategist` | Piano editoriale, tone of voice | kanban_complete |
| 2 | `marketing-copywriter` | Testi, copy, post | kanban_complete |
| 3 | `marketing-visual-creator` | Grafiche, video | kanban_complete |
| **4** | **`marketing-publisher`** | **Pubblica, vault-global-knowledge, crea Curator** | **PENULTIMO** |
| 5 | `curator` (globale) | **Review ⛔ CHIUDE parent → crea Summarizer** | **ULTIMO** |
| 6 | `summarizer` (globale) | Report su vault-global-knowledge | kanban_complete |

Opzionali: analyst, community-manager, scheduler, seo-specialist, docs-writer.
Se marketing-docs-writer presente → è penultimo (al posto di publisher).

### Sales

**B1:** prospector → proposal-writer → negotiator → docs-writer → Curator → Summarizer

| Anello | Profilo | Cosa fa | Dopo |
|--------|---------|---------|------|
| 1 | `sales-prospector` | Lead research, scoring | kanban_complete |
| 2 | `sales-proposal-writer` | Proposal, offerta | kanban_complete |
| 3 | `sales-negotiator` | Negoziazione, closing | kanban_complete |
| **4** | **`sales-docs-writer`** | **Contratto, vault-global-knowledge, crea Curator** | **PENULTIMO** |
| 5 | `curator` (globale) | **Review ⛔ CHIUDE parent → crea Summarizer** | **ULTIMO** |
| 6 | `summarizer` (globale) | Report su vault-global-knowledge | kanban_complete |

Opzionali: account-manager, collections-agent, competitor-analyst, crm-keeper, pricing-manager, revenue-tracker.

### Admin (Pool)

Admin è un pool — dispatcher sceglie lo specialista giusto. Docs-writer è penultimo (vault-global-knowledge), poi Curator → Summarizer.

Specialisti: admin-onboarder, admin-asset-keeper, admin-billing-officer, admin-compliance-check, admin-contract-manager, admin-reporter, **admin-docs-writer (penultimo)**.

## Regole Obbligatorie

1. **B1: dispatcher crea TUTTI i sub-task** — SENZA `--skill`. I sub-task ereditano i skill del parent e crashano.
2. **Ogni specialista esegue e complete** — skill si carica manualmente con `skill_view(name='board-{name}')`.
3. **Docs-writer è PENULTIMO** — documenta, vault-global-knowledge, crea task per Curator, kanban_complete. ⛔ NON chiude parent.
4. **Curator è ULTIMO (closer)** — review ciclo vita → chiude parent → crea Summarizer → kanban_complete.
5. **`kanban_complete` è OBBLIGATORIO** — protocol violation senza.

## Fallimento

Specialista fallisce → segnala nel summary. Curator non riceve task. Parent non va chiuso. L'umano decide.

## Passaggio Contesto

Dispatcher include `PARENT_ID: {id}` nel `--body` di OGNI sub-task. Docs-writer passa PARENT_ID a Curator.

## Checklist Deploy Nuova Board

1. [ ] Creare SOUL.md per ogni specialista
2. [ ] Docs-writer SOUL: crea Curator, NON chiude parent
3. [ ] Curator SOUL: review + close parent + Summarizer
4. [ ] Dispatcher SOUL: B1, tutti i sub-task in una volta
5. [ ] Board skill: catena docs-writer → Curator
6. [ ] Verifica: grep "ULTIMO\|chiude parent" su SOUL.md (zero residui vecchi)
7. [ ] Test: task semplice → Curator chiude parent
