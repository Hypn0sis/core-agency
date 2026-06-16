# Architettura Wingman — Review Package

## Struttura

```
arch-review/
├── README.md                          ← questo file
├── core/
│   ├── vault-schema.md                ← DOGMA: regole fisse per TUTTI i vault
│   └── blueprint-nuova-board.md       ← PROCEDURA: creazione nuovo board
├── global-knowledge/
│   ├── diary.md                       ← Diario globale append-only
│   ├── conversation.md                ← Trascrizione sessione review + fix
│   ├── decision-global-knowledge.md   ← Decisione: centralizzazione knowledge
│   ├── decision-b1-curator.md         ← Decisione: B1 Curator-as-closer
│   ├── entity-teo.md                  ← Entità: fondatore
│   ├── entity-wingman.md              ← Entità: agente orchestratore
│   └── entity-martin-nello.md         ← Entità: partner
├── multi-board-skill/
│   └── SKILL.md                       ← MASTER: skill architetturale multi-board (1407 righe)
├── board-skills/
│   ├── board-sviluppo SKILL.md        ← Playbook board sviluppo
│   ├── board-marketing SKILL.md       ← Playbook board marketing
│   ├── board-admin SKILL.md           ← Playbook board admin
│   └── board-sales SKILL.md           ← Playbook board sales
├── profiles/
│   ├── dispatcher-sviluppo-soul.md    ← SOUL.md dispatcher sviluppo
│   ├── dispatcher-marketing-soul.md   ← SOUL.md dispatcher marketing
│   ├── dispatcher-admin-soul.md       ← SOUL.md dispatcher admin
│   ├── dispatcher-sales-soul.md       ← SOUL.md dispatcher sales
│   ├── curator-soul.md                ← SOUL.md Curator (globale)
│   └── summarizer-soul.md             ← SOUL.md Summarizer (globale)
├── references/
│   ├── chain-architecture.md          ← Catena workflow completa
│   ├── vault-schema-digest.md         ← Riepilogo vault schema
│   ├── vault-cliente-structure.md     ← Struttura vault cliente
│   ├── gap-analysis-2026-06-16.md     ← Gap analysis pre-fix
│   ├── mini-report-standard.md        ← Standard mini-report
│   └── board-workflow-kanban.md       ← Workflow kanban board
└── templates/
    └── vault-cliente-template/
        ├── diary.md                   ← Advancement progetto
        ├── scadenze.md                ← Scadenzario unico
        ├── payments/fattura-template.md
        └── wiki/decisions/entities/milestones/sito/
```

## Come usare

1. Scompatta
2. Dai il **prompt di review** (vedi sotto) a un LLM
3. L'LLM analizzerà il package e produrrà un report

## Di che si tratta

Architettura a **4 board** (Sviluppo, Marketing, Admin, Sales) con agenti atomici specializzati.
Ogni board ha il suo dispatcher, una catena di specialisti, un curator globale e un summarizer.
La knowledge è centralizzata in `vault-global-knowledge/`.

### Tre tipi di vault

| Vault | Contenuto |
|-------|-----------|
| `vault-global-knowledge/` | SSOT: diary globale, decisioni, conversazioni Teo↔Wingman, entità globali |
| `vault-{board}/` | Solo wiki locali (entities, stack, contacts, payments) — NO diary |
| `vault-cliente/{cliente}/` | Cliente: diary advancement, chat, milestone, sito, scadenze, pagamenti |

### Flusso task

1. Teo crea parent task su kanban (assignee = dispatcher del board)
2. Dispatcher crea TUTTI i sub-task in una volta (B1), ognuno con PARENT_ID
3. Specialisti eseguono in parallelo/ordine, producono mini-report in kanban_complete
4. Docs-writer (penultimo): documenta su vault-global-knowledge/diary.md, crea task per Curator
5. Curator (ultimo): revisiona ciclo di vita, se OK chiude parent e crea Summarizer
6. Summarizer: report su vault-global-knowledge

### Numero agenti

- 4 dispatcher
- 30 specialisti atomici
- 1 curator globale
- 1 summarizer globale
- ~35 SOUL.md normalizzati con mini-report + PARENT_ID + kanban_block
