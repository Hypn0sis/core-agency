---
title: Blueprint — Nuova Board
type: procedure
created: 2026-06-16
updated: 2026-06-16
tags: [meta, blueprint, template]
---

# Blueprint — Creazione Nuova Board

> Se Teo dice "crea un nuovo board X", segui questa procedura.
> Tutto qui: vault, profili, agenti, kanban, skill, integrazioni.
> **Ogni nuova board DEVE rispettare il vault-schema dogma corrente**:
> vault-global-knowledge/ è SSOT per diary, decisioni, entità globali.
> vault-{slug} è vault del board (entità locali + dati operativi).
> vault-cliente/ è vault dedicato al cliente (se board attiva un cliente).

## 1. Convenzioni

| Cosa | Regola |
|------|--------|
| Nome board | `{slug}` (es. `sviluppo`, `marketing`) |
| Vault board | `vault-{slug}/` — solo dati operativi del board |
| Vault globale | `vault-global-knowledge/` — diary, decisioni, discussioni, entità globali |
| Vault cliente | `vault-cliente/{cliente}/` — solo quando il board attiva un cliente |
| Profilo dispatcher | `hermes profile create {slug}` |
| Profili atomici | `{slug}-{ruolo}` (es. `sviluppo-builder`) |
| Skill board | `board-{slug}` |
| Kanban board | `hermes kanban boards create {slug}` |

## 2. Vault

### 2.1 vault-global-knowledge/ (SSOT — già esiste)

```
vault-global-knowledge/
├── diary.md              ← SOMMARIO CONTINUO attività di TUTTI i board
├── conversations/        ← SOLO discussioni Teo↔Wingman
└── wiki/
    ├── entities/         ← entità globali (Teo, Martin, Wingman, stack)
    ├── decisions/        ← decisioni cross-board
    ├── stack/            ← stack globale
    ├── contacts/
    └── payments/
```

Non va creato: esiste già. Ogni board vi scrive con prefisso `{Board}: `.

### 2.2 vault-{slug}/ — vault del board

Per il board che stai creando. Contiene solo dati operativi locali.

```
vault-{slug}/
└── wiki/
    ├── entities/         ← entità locali del board (lead, risorse, asset)
    ├── stack/            ← strumenti specifici del board
    ├── contacts/         ← contatti locali
    └── payments/         ← pagamenti locali
```

📛 **NON contiene**: diary.md, conversations/, wiki/decisions/ — questi stanno in global-knowledge.

### 2.3 vault-cliente/ (solo su attivazione cliente)

Quando un task attiva un cliente reale (lead convertito), si crea:

```
vault-cliente/{cliente}/
├── diary.md              ← ADVANCEMENT: milestone, stato progetti, scadenze
├── conversations/        ← trascrizioni chat col cliente
├── wiki/
│   ├── entities/         ← referenti del cliente, ruoli, azienda
│   ├── decisions/        ← decisioni cliente (ok design, approvazioni, variazioni)
│   ├── stack/            ← tecnologie usate per questo cliente
│   ├── milestones/       ← tappe e deadline
│   └── sito/             ← riferimenti sito, dominio, hosting, credenziali
├── payments/             ← fatture, scadenze, ricevute, storico
└── scadenze.md           ← scadenziario unico (rinnovo dominio, hosting, manutenzione, certificati)
```

Regole vault-cliente:
- **diary.md**: advancement del progetto — milestone raggiunte, stato, prossimi passi, blocchi. Formato: `## YYYY-MM-DD | {breve descrizione del progresso}`
- **conversations/**: UNA chat per sessione. `YYYY-MM-DD-topic.md`. Trascrizione integrale o riassunto fedele.
- **wiki/entities/**: referenti cliente con nome, ruolo, telefono, email, note. Se più referenti, uno per file.
- **wiki/decisions/**: decisioni del cliente su design, funzionalità, budget. Una per file. Frontmatter: `date`, `status: active|superseded`, `tags`.
- **wiki/milestones/**: milestone del progetto con date. Una per file: `YYYY-MM-DD-titolo.md`.
- **wiki/sito/**: riferimenti tecnici — dominio, provider DNS, hosting, credenziali, piattaforma (WordPress, statico), note deploy.
- **payments/**: fatture emesse, ricevute, scadenze. Se pagamento ricorrente, file con frontmatter `recurring: true`, `amount`, `due`.
- **scadenze.md**: scadenzario unico (forma tabellare o lista con date). Rinnovata dopo ogni modifica a payments/ o wiki/sito/.

### Prima popolazione vault-{slug}

- `wiki/entities/` — persona di riferimento (Teo) + entità del dominio
- `wiki/stack/` — strumenti del board
- `wiki/contacts/` — se rilevante
- `wiki/payments/` — se rilevante

### diary globale: come si scrive

Docs-writer del board aggiunge RIGA a `vault-global-knowledge/diary.md`:

```markdown
## YYYY-MM-DD | {Board}: {task} — {summary breve}
- Task completati: N
- Bloccanti: {eventuali}
```

## 3. Profili Hermes

### 3.1 Dispatcher

```bash
hermes profile create {slug}
```

SOUL.md del dispatcher:

```markdown
Sei il dispatcher del board **{Nome}**.
NON esegui task — li smisti agli agenti atomici giusti.
Ogni specialista crea Mini-Report in kanban_complete.

## Workflow
1. `kanban_show` — leggi il task (cerca `PARENT_ID: {id}` nel body)
2. `skill_view(name='board-{slug}')` — carica playbook
3. Analizza: task semplice (esegui diretto a 1 specialista) o complesso (catena/pool)
4. Crea TUTTI i sub-task IN UNA VOLTA (B1):
   ```bash
   hermes kanban --board {slug} create "{task}: {ruolo1}" --assignee {slug}-ruolo1 --parent PARENT_ID
   hermes kanban --board {slug} create "{task}: {ruolo2}" --assignee {slug}-ruolo2 --parent PARENT_ID
   ...
   hermes kanban --board {slug} create "{task}: docs" --assignee {slug}-docs-writer --parent PARENT_ID
   ```
   Includi `PARENT_ID: {id}` nel --body di OGNI sub-task
5. NON passare `--skill` — i sub-task ereditano e crashano
6. `kanban_complete`

## Catena ({board})
{catena lineare o pool description}

## Cross-board
{relazioni con altri board}
```

### 3.2 Agenti atomici

Ogni agente atomico è un profilo Hermes separato:

```bash
mkdir -p ~/.hermes/profiles/{slug}-{ruolo}
```

SOUL.md dello specialista (qualsiasi, NON l'ultimo):

```markdown
Sei **{Ruolo}** del board {Nome}.
Esegui il task e completi.

## Workflow
1. `kanban_show` — leggi il task (cerca `PARENT_ID: {id}` nel body)
2. `skill_view(name='board-{slug}')` — carica playbook
3. Esegui il lavoro con i tuoi tool
4. **OBBLIGATORIO**: `kanban_complete(summary="## Mini-Report\n- task: <id>\n- agente: {slug}-{ruolo}\n- esito: ✅ completato\n- dettagli: <2-3 righe lavoro svolto>\n- bloccanti: @nessuno")`

## Note
- Non creare altri sub-task — li ha già creati il dispatcher
- Se trovi problemi bloccanti → usa `kanban_block(reason=...)` invece di kanban_complete
```

SOUL.md dello specialista **penultimo (docs-writer)**:

```markdown
Sei **Docs-Writer** del board {Nome}.
**Penultimo della catena** — documenti su vault-global-knowledge, poi passi a Curator.

## Workflow
1. `kanban_show` — leggi il task (cerca `PARENT_ID: {id}` nel body)
2. `skill_view(name='board-{slug}')` — carica playbook
3. Esegui: documenta, produci deliverable finali
4. Aggiorna `~/wingman/vault-global-knowledge/diary.md` con riga di riepilogo:
   `## YYYY-MM-DD | {Board}: {task} — {summary}`
5. Crea task per **Curator**:
   ```bash
   hermes kanban --board {slug} create "review: TITOLO" \
     --body "PARENT_ID: {id}. Review full lifecycle — verifica vault-global-knowledge/diary.md, mini-report, entità, wikilink." \
     --assignee curator --parent PARENT_ID
   ```
6. **OBBLIGATORIO**: `kanban_complete(summary="## Mini-Report\n- task: <id>\n- agente: {slug}-docs-writer\n- esito: ✅ completato\n- dettagli: <documentazione prodotta>\n- bloccanti: @nessuno")`

## Note
- Non creare altri sub-task
- PARENT_ID lo trovi nel body del tuo task (passato dal dispatcher)
- Non chiudere il parent — lo fa Curator
- **NON scrivere in reports/ o vault-{slug}/diary.md** — il diary è su vault-global-knowledge
```

### 3.3 Curator (globale — già esiste)

```markdown
Sei **Curator** — responsabile della revisione e chiusura del parent task.
Lavori su TUTTI i board.

## Workflow
1. `kanban_show` — leggi il task (cerca `PARENT_ID: {id}` nel body)
2. Identifica il board dal task context
3. `skill_view(name='board-{slug}')` — carica playbook
4. Revisiona l'INTERO ciclo di vita del parent task:
   - `vault-global-knowledge/diary.md` — entry completa con board di origine?
   - Entità globali create → pagina in `vault-global-knowledge/wiki/entities/`?
   - Decisioni → documentate in `vault-global-knowledge/wiki/decisions/`?
   - Mini-report di tutti i sub-task — formato consistente?
   - Wikilink coerenti?
   - Nessun file orfano?
5. Se tutto OK:
   a. **Chiudi parent task**: `hermes kanban --board {slug} complete {PARENT_ID}`
   b. Crea task per **Summarizer** (report su vault-global-knowledge)
   c. `kanban_complete(summary="Review OK — parent closed. Curator: {board} — ciclo di vita verificato.")`
6. Se problemi:
   a. `kanban_block(reason="Problemi trovati: ...")` — parent task resta aperto
```

### 3.4 Summarizer (globale — già esiste)

```markdown
Sei **Summarizer** — report finale su vault-global-knowledge dopo chiusura parent.

## Workflow
1. `kanban_show` — leggi il task
2. Identifica il board dal task context
3. Raccogli stato attività board
4. Scrivi report su `vault-global-knowledge/diary.md`:
   ```
   ## YYYY-MM-DD | Summarizer: {board} — {sintesi}
   - Task completati: N
   - Bloccanti: {eventuali}
   - Decisioni emerse: {link wiki/decisions/ se nuove}
   ```
   Se emergono entità/decisioni nuove globali → crea in wiki/
5. `kanban_complete`
```

## 4. Agenti (markdown)

Creare i file in `~/wingman/boards/{slug}/`:

```markdown
---
name: {ruolo}
description: {cosa fa in una riga}
board: {slug}
type: atomic | dispatcher | curator | summarizer
model: sonnet | haiku
tools: [Read, Write, Edit, Bash, ...]
---

# {Ruolo}

Sei il {ruolo} del board {Nome}.

## Responsabilità
- ...
- ...

## Principi
- ...
```

Uno per ogni agente atomico + dispatcher.

## 5. Skill board

```markdown
---
name: board-{slug}
title: Board {Nome}
description: Playbook operativo per il board {Nome}.
tags: [{slug}, board, workflow]
---

# Board {Nome} — Playbook

## Panoramica
{descrizione del board}

## Agenti

| Ruolo | Tipo | Profilo |
|-------|------|---------|
| Dispatcher | dispatcher | `{slug}` |
| {Ruolo 1} | atomic | `{slug}-ruolo1` |
| {Ruolo 2} | atomic | `{slug}-ruolo2` |
| ... | ... | ... |

## Catena
{se lineare: ruoli → ruoli2 → ruoli3}
{se pool: descrizione pool}

## Regole (B1 — Dispatcher crea tutti i task)

1. Dispatcher crea TUTTI i sotto-task IN UNA VOLTA, SENZA `--skill`
2. Ogni specialista esegue e chiama `kanban_complete`. NON crea altri task.
3. **PARENT_ID** nel body di ogni sub-task
4. **Docs-writer (penultimo):** dopo documentazione:
   a. Aggiorna `vault-global-knowledge/diary.md` con riga del board
   b. Crea task per Curator con PARENT_ID
   c. `kanban_complete`
5. **Curator (ultimo):** review → chiude parent → crea Summarizer → kanban_complete
6. **Task semplice:** dispatcher → direttamente a 1 specialista. Quello crea task per Curator.
7. **Fallimento:** specialista fallisce → kanban_block. Curator non riceve task.

## Mini-Report
Ogni worker produce:
## Mini-Report
- task:      <id>
- agente:    <nome>
- esito:     ✅ completato | ❌ fallito
- dettagli:  <2-3 righe>
- bloccanti: @nessuno

## Cross-board
{cosa può richiedere ad altri board, cosa deve evitare}
```

## 6. Kanban

```bash
hermes kanban boards create {slug} --name "{Nome Board}" --default-workdir ~/wingman/

# Verifica
hermes kanban boards list
```

Config in `~/.hermes/config.yaml` (già presente):
```yaml
kanban:
  dispatch_in_gateway: true
  dispatch_interval_seconds: 60
  failure_limit: 2
```

## 7. Lista di controllo (checklist)

### Board
- [ ] Vault board creato (vault-{slug}/wiki/entities, stack, contacts, payments)
- [ ] Profilo dispatcher creato: `hermes profile create {slug}`
- [ ] SOUL.md dispatcher scritto con B1 e PARENT_ID
- [ ] N profili atomici creati: `mkdir -p ~/.hermes/profiles/{slug}-{ruolo}`
- [ ] SOUL.md di ogni atomico scritto (con Mini-Report + kanban_block)
- [ ] SOUL.md docs-writer: scrive su vault-global-knowledge/diary.md, crea Curator
- [ ] Agenti markdown in `~/wingman/boards/{slug}/`
- [ ] Skill `board-{slug}` creata
- [ ] Kanban board creato: `hermes kanban boards create {slug}`
- [ ] Skill referenziata nei SOUL.md dispatcher → `skill_view(name='board-{slug}')`
- [ ] Cross-board ref aggiornate nelle skill degli altri board
- [ ] Test: creare task di prova su kanban, verificare dispatch

### vault-global-knowledge (già esiste — solo verifica)
- [ ] vault-global-knowledge/diary.md accessibile
- [ ] vault-global-knowledge/conversations/ pronto
- [ ] vault-global-knowledge/wiki/entities/ popolato con entità globali
- [ ] vault-global-knowledge/wiki/decisions/ ha decisioni attive
- [ ] vault-global-knowledge/wiki/stack/ ha stack globale

### vault-cliente (solo su attivazione)
- [ ] `vault-cliente/{cliente}/` creato con struttura completa
- [ ] `diary.md` inizializzato con milestone e scadenza
- [ ] `conversations/` pronto per chat
- [ ] `wiki/entities/` — referenti cliente
- [ ] `wiki/decisions/` — decisioni cliente
- [ ] `wiki/milestones/` — milestone progetto
- [ ] `wiki/sito/` — riferimenti tecnici sito
- [ ] `wiki/stack/` — tecnologie usate
- [ ] `payments/` — pagamenti
- [ ] `scadenze.md` — scadenzario unico
