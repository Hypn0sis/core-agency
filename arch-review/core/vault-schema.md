---
title: VAULT-SCHEMA — Dogmi del Sistema
type: reference
created: 2026-06-16
tags: [meta, schema, dogma]
---

# Vault Schema — Dogmi

> Regole fisse per TUTTI i vault (global-knowledge, board e clienti). Infrangere = caos.

## Strutture

### vault-global-knowledge/ — SINGLE SOURCE OF TRUTH per tutto il knowledge condiviso

```
vault-global-knowledge/
├── diary.md              ← SOMMARIO CONTINUO attività di TUTTI i board (append-only)
├── conversations/        ← SOLO discussioni Teo↔Wingman (integrali)
│   └── YYYY-MM-DD-topic.md
└── wiki/
    ├── entities/         ← persone, aziende, tools GLOBALI (Teo, Martin, Stack)
    ├── decisions/        ← decisioni cross-board con data + motivazione
    ├── stack/            ← stack globale, setup
    ├── contacts/         ← recapiti globali
    └── payments/         ← fatture globali, IBAN, prezzi
```

Tutti gli agenti leggono da QUI per diary, decisioni, entità condivise.
Docs-writer e Curator aggiornano QUI.

### vault-{board}/ — Dati operativi del singolo board

```
vault-{board}/
└── wiki/
    ├── entities/         ← entità di dominio del board (es. clienti sales, tool sviluppo)
    ├── stack/            ← tecnologie del board
    ├── contacts/         ← contatti del board
    └── payments/         ← pagamenti specifici del board (admin)
```

📛 NON ha `diary.md` — il diary è globale in vault-global-knowledge.
📛 NON ha `conversations/` — solo Teo↔Wingman, archiviate in vault-global-knowledge.
📛 NON ha `wiki/decisions/` — le decisioni cross-board vanno in vault-global-knowledge.

### vault-cliente/{cliente}/ — Dati operativi e relazioni col cliente

```plaintext
vault-cliente/{cliente}/
├── diary.md              ← ADVANCEMENT: milestone, stato, blocchi, prossimi passi
├── conversations/        ← trascrizioni chat col cliente (YYYY-MM-DD-topic.md)
├── wiki/
│   ├── entities/         ← referenti cliente (nome, ruolo, contatti)
│   ├── decisions/        ← decisioni cliente (ok design, approvazioni, variazioni)
│   ├── milestones/       ← milestone progetto con date e deliverable
│   ├── sito/             ← riferimenti tecnici sito (dominio, hosting, DNS, credenziali)
│   └── stack/            ← tecnologie usate per questo cliente
├── payments/             ← fatture emesse, ricevute, scadenze, storico
└── scadenze.md           ← scadenzario unico (rinnovo dominio, hosting, manutenzione, fatture)
```

I vault cliente hanno `diary.md` (advancement progetto), `conversations/`, `wiki/decisions/`,
`wiki/milestones/`, `wiki/sito/` perché documentano il rapporto col cliente —
non sono knowledge condiviso tra board.

Il template è in `vault-cliente/_template/` — copiare per ogni nuovo cliente attivo.

## Dogmi

### 1. diary.md (SOLO in vault-global-knowledge)
- **Sommario continuo** delle attività di TUTTI i board, non log verboso
- Una riga o due per sessione/task, con data e board di origine
- Formato: `## YYYY-MM-DD | {board}: {task title} — {short summary} [link a decisioni/entities]`
- Si aggiorna dal docs-writer OGNI volta che si completa un task
- Non si cancella mai — solo append
- 📛 I vault per-board NON hanno diary.md — l'unico diary è globale

### 2. conversations/ (SOLO in vault-global-knowledge e vault cliente)
- **Un file per giorno/topic**: `YYYY-MM-DD-breve-descrizione.md`
- **vault-global-knowledge**: solo discussioni Teo↔Wingman (integrali)
- **vault cliente**: chat col cliente (integrali)
- Archiviato dopo ogni sessione
- 📛 I vault per-board NON hanno conversations/

### 3. wiki/entities/
- Una pagina per entità (persona, azienda, tool)
- Frontmatter: `name`, `type: person|company|tool`, `created`, `tags`
- Collegata ad altre pagine via `[[wikilink]]`

### 4. wiki/decisions/ (SOLO in vault-global-knowledge)
- Una pagina per decisione cross-board
- Frontmatter: `date`, `status: active|superseded|cancelled`, `tags`
- Contesto: cosa si è deciso, perché, alternative scartate
- Se una decisione viene cambiata: marcare `status: superseded` e linkare la nuova
- 📛 I vault per-board NON hanno wiki/decisions/ — le decisioni sono globali

### 5. wiki/stack/
- Tecnologie usate, setup, configurazioni
- Versioni, comandi utili, note tecniche
- Procedure e blueprint (es. blueprint nuova board)

### 6. wiki/contacts/
- Recapiti reali (email, telefono, indirizzi)
- Persone di contatto con ruolo

### 7. wiki/payments/
- Per board admin: fatture emesse, scadenze
- Per clienti: IBAN, prezzi concordati, storico pagamenti

## Auto-aggiornamento

Ogni task completato su kanban → aggiornamento:
1. Docs-writer aggiunge riga a `vault-global-knowledge/diary.md` con board di origine
2. Se nascono decisioni/entità nuove globali → crea/aggiorna pagina in vault-global-knowledge
3. Entità/stack/contatti per-board → aggiorna vault del board specifico
4. (Solo vault cliente) Se task su cliente → archivia conversazione in vault-cliente

Zero comandi "salva" manuali.

## Dogmi Risolti

### Punto 1: Scisma B1/B2 (risolto 16/06)
- **Scelta: B1**. Il dispatcher crea TUTTI i sub-task in una volta.
- B2 (dispatcher subisce task curati, poi li passa) **scartato**.
- Motivazione: semplicità, meno round trip, dispatcher snello.

### Punto 2: admin-organizer rif morta (risolto 16/06)
- Il profilo `admin-organizer` **non esiste più** — era una ref morta nei file originali.
- Non ricreare. Admin usa Pool: dispatcher sceglie one shot lo specialista giusto.

### Punto 3: Curator chiude parent task (risolto 16/06)
- **Curator è l'unico che chiude il parent task**, dopo aver revisionato l'intero ciclo di vita.
- Docs-writer è penultimo — crea task per Curator e `kanban_complete`.
- Summarizer è triggerato da Curator, non da docs-writer.
- Vedi sezione Task Lifecycle sopra.

### Punto 4: Curator/summarizer orfani (risolto 16/06)
- **Risolto dal dogma Curator-as-closer**:
  - Docs-writer crea task per Curator → Curator non più orfano
  - Curator chiude parent e crea task per Summarizer → Summarizer non più orfano
- Summarizer model entry aggiunta in config.yaml per routing trasparente

### Punto 5: Ref stale/doc anti-dogma nei vault/wiki (risolto 16/06)
- Scansione completata su vault-admin, vault-sviluppo, vault-marketing, vault-sales, boards/
- **Nessun ref stale trovato** — vault già allineati dopo bonifica Curator dogma
- Blueprint aggiornato con checklist curator-as-closer già presente

### Punto 6: Report moribondi → vault-global-knowledge (risolto 16/06)
- `~/wingman/reports/` directory legacy pre-vault **deprecata**
- 3 report migrati in vault-global-knowledge:
  - `reports/sviluppo/summary.md` → `vault-global-knowledge/diary.md` (riga board sviluppo)
  - `reports/marketing/pipeline-lead-bergamo-giugno2026.md` → `vault-global-knowledge/wiki/entities/pipeline-lead-bergamo-giugno2026.md`
  - `reports/sales/summary.md` → `vault-global-knowledge/diary.md` (riga board sales)
- Flusso attuale: docs-writer → vault-global-knowledge/diary.md, Summarizer → vault-global-knowledge/diary.md
- `reports/DEPRECATED.md` creato come avviso

### Punto 7: Clienti senza vault (risolto 16/06)
- **Policy**: vault cliente si crea al momento dell'attivazione cliente, non prima
- Lead files (root level): migrati in `vault-sales/wiki/entities/`
  - `pipeline-lead-gen.md`, `lead-script-contatto.md`, `lead-research.md`, `lead-pipeline.md`, `pipeline-lead-bergamo.csv`
- Lead Fasan Claudio (4 files): restano in `boards/sales/leads/` — fanno parte delle definizioni agente Sales
- Quando un lead diventa cliente attivo → creare `vault-{cliente}/` con struttura canonica, migrare dati da vault-sales
- Bergamaschi (pilota): vault creato al termine dell'outreach freeze

### Punto 8: boards/ non vault (risolto 16/06)
- **Non è un gap.** boards/ è il Canonical Agent Registry (58 agent markdown).
- boards/ e vault hanno scopi diversi: boards/ = agente definizioni, vault = knowledge storage.
- La relazione è: boards/ → profili Hermes/SOUL.md → esecuzione → vault (risultati).
- boards/ NON va convertito in vault. Mantenere separazione.

### Punto 9: Gestione errori (risolto 16/06)
- La gestione errori è già definita nel dogma Task Lifecycle (vault-schema.md):
  - Se specialista fallisce → Curator non riceve task → parent task NON chiuso
  - Se Curator trova problemi → `kanban_block` con dettagli → parent resta aperto
  - Worker failure auto-retry: gateway ha `failure_limit: 2` (config.yaml)
  - Worker exit senza `kanban_complete` → protocol violation → task marked as crashed
- Aggiunta regola mancante: **nessuno specialista può bypassare il Curator** — se task fallisce o è bloccante, non creare task Curator, fare `kanban_block` direttamente
- **Conteggio boards/ confermato**: 58 file, 4 board, 12 dispatcher/curator/summarizer intatti

### Punto 10: Sync skills duplicate (risolto 16/06)
- **Problema:** i 4 profili board (sviluppo, marketing, admin, sales) avevano COPIE stale delle board-* skills
  - 16 copie totali (4 board-* × 4 profili) fuori sync con la root
  - Root skill aggiornata con B1 + Curator closer, ma profili caricavano versione vecchia
- **Fix:** convertite tutte e 16 le copie in **symlink** alla root:
  `~/.hermes/profiles/{profile}/skills/autonomous-ai-agents/board-{name}/` → `~/.hermes/skills/autonomous-ai-agents/board-{name}/`
- **Regola**: per i profili board, le skills board-* DEVONO essere symlink, non copie.
  - Un update alla root si propaga automaticamente a tutti i profili
  - Creare nuovi profili con symlink (non `--copy-skills`)

### Punto 11: Task crashati (risolto 16/06)
- 2 task sviluppo crashati il 15/06 (col vecchio workflow che usava delegate_task):
  - `t_5256d176` — Landing Page TeoDigital (archiviato)
  - `t_ef0d5a93` — Portfolio Storefront (archiviato)
  - `t_342dcc7` — non più esistente
- **Risoluzione:** task già archiviati dal gateway. Da ricreare col workflow B1 quando si testa la pipeline
- **Lezione:** worker che chiama `delegate_task` causa crash — il worker deve eseguire direttamente o creare sub-task via kanban

### Punto 12: Memoria piena (risolto 16/06)
- Memoria al 97% (2,154/2,200 chars)
- **Risoluzione**: compressi dati obsoleti — task completati, conteggi intermedi, pricing draft eliminati
- Mantenuti: preferenze utente, dogma architetturale, zona operativa, hook script, pricing finale
- **Regola**: memoria riservata a fatti stabili — preferenze utente, dogma risolti, convenzioni durature. Task progress e conteggi transitori vanno in session_search

### Punto 13: Knowledge centralizzato in vault-global-knowledge (risolto 16/06)
- **Problema**: entità duplicate in 4 vault, decisioni non visibili cross-board, diary frammentati, reports/ deprecato usato ancora
- **Soluzione**: vault-global-knowledge/ come SINGLE SOURCE OF TRUTH per:
  - `diary.md` — timeline globale (tutti i board scrivono qui)
  - `conversations/` — SOLO discussioni Teo↔Wingman
  - `wiki/decisions/` — decisioni cross-board
  - `wiki/entities/` — entità globali (Teo, Martin, Wingman, stack)
- **Impatto su vault per-board**: perdono diary.md, conversations/, wiki/decisions/
- **Flusso aggiornato**: docs-writer → global-knowledge diary → curator → global-knowledge review → summarizer → global-knowledge report
- **vault-cliente** arricchito: ora include wiki/sito/, wiki/milestones/, scadenze.md
- **Template cliente** in `vault-cliente/_template/` pronto per copia

## Task Lifecycle — Dogma

### Catena: il dispatcher crea TUTTI i sub-task, il curator chiude il parent

```
Wingman → parent task (assignee = dispatcher)
  → Dispatcher crea N sub-task (uno per specialista) → kanban_complete
    → Specialista 1 → esegue → kanban_complete
    → ...
    → Specialista N-1 (docs-writer) → documenta, aggiorna vault-global-knowledge → kanban_complete
    → Curator → revisiona INTERO ciclo di vita → se OK, CHIUDE parent task → kanban_complete
    → Summarizer → report su vault-global-knowledge (triggerato da curator)
```

### Regole

1. **Il dispatcher crea TUTTI i sub-task in una volta**, mai uno alla volta. Non passa `--skill`.
2. **Ogni specialista esegue e completa**. Non crea altri task.
3. **Docs-writer è penultimo** — documenta, aggiorna vault-global-knowledge/diary.md, **crea task per Curator**, poi `kanban_complete`.
4. **Curator è l'ultimo** — riceve task da docs-writer:
   a. Legge `PARENT_ID: {id}` nel body (passato da docs-writer)
   b. Revisiona: vault-global-knowledge/diary.md, entità, decisioni, report, formato, coerenza wikilink
   c. Se tutto OK → **chiude parent task**: `hermes kanban --board {board} complete {PARENT_ID}`
   d. Crea task per Summarizer (report su vault-global-knowledge)
   e. `kanban_complete`
   f. Se trova problemi → `kanban_block(reason=...)` — parent task resta aperto
5. **Il docs-writer passa `PARENT_ID` nel body del task per Curator** — obbligatorio.
6. **Task semplice** (fix minore): dispatcher → direttamente builder. Builder crea task per Curator, che chiude. Nessun docs-writer intermedio.
7. **Fallimento**: se uno specialista fallisce, segnala nel summary. Curator non riceve task. Parent task NON va chiuso. Il dispatcher umano decide se ricreare.

## Ruoli

- **Agenti atomici**: eseguono task, passano contesto al prossimo agente
- **Agenti atomici** contattano [[curator]], [[summarizer]], docs-writer per aggiornarli
- **Curator**: revisiona qualità output
- **Summarizer**: produce summary delle attività (non archivia chat)
- **Ogni agente**: responsabile di ingaggiare i successivi e aggiornarli

## Git Sync

Ogni vault è un repo git separato → GitHub privato → Obsidian locale.
Non si mischiano — ogni vault ha la sua storia.
