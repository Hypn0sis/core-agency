# vault-schema-digest — Dove scrivere cosa

## Principio: vault-global-knowledge è SSOT per tutto il knowledge condiviso

```
vault-global-knowledge/   ← SINGLE SOURCE OF TRUTH per cross-board knowledge
└── diary.md              ← SOMMARIO CONTINUO attività di TUTTI i board
└── conversations/        ← SOLO discussioni Teo↔Wingman (archivi integrali)
└── wiki/
    ├── entities/         ← Entità globali (Teo, Martin, Wingman, stack, clienti attivi)
    ├── decisions/        ← Decisioni cross-board (solo globali)
    ├── stack/            ← Stack e strumenti globali
    ├── contacts/         ← Contatti globali
    └── payments/         ← Pagamenti e abbonamenti (admin)
```

## Regole per gli agenti

### docs-writer (penultimo della catena)
- Scrive UNA riga in `vault-global-knowledge/diary.md`:
  ```
  ## YYYY-MM-DD | {Board}: {task} — {summary}
  ```
- Se crea entità globali (Teo, Martin, nuovi clienti attivi, nuovi strumenti) → file in `wiki/entities/`
- Se emergono decisioni cross-board → file in `wiki/decisions/`
- **NON scrive più in `reports/`** — deprecato
- **NON scrive più in per-board vault diary** — centralizzato

### curator (ultimo, closer)
- Revisiona `vault-global-knowledge/diary.md` per completezza entry
- Verifica entità in `vault-global-knowledge/wiki/entities/`
- Verifica decisioni in `vault-global-knowledge/wiki/decisions/`
- NO controlli su `reports/`

### summarizer (post-curator)
- Legge `vault-global-knowledge/diary.md`
- Aggiunge report finale sempre in `vault-global-knowledge/diary.md`

### Per-board vault (sviluppo, marketing, admin, sales)
- Contengono solo: `wiki/stack/`, `wiki/contacts/`, `wiki/payments/` (dati specifici del board)
- **NON contengono**: diary.md, conversations/, wiki/decisions/ (stanno in global-knowledge)

### vault-cliente/{cliente}/ (per clienti attivi)

**Ha struttura ricca** perché documenta l'intero rapporto col cliente.

```
vault-cliente/{cliente}/
├── diary.md              ← ADVANCEMENT: milestone, stato, blocchi, prossimi passi
├── conversations/        ← trascrizioni chat col cliente (YYYY-MM-DD-topic.md)
├── wiki/
│   ├── entities/         ← referenti cliente (nome, ruolo, telefono, email)
│   ├── decisions/        ← decisioni cliente (ok design, approvazioni, variazioni)
│   ├── milestones/       ← milestone progetto con date e deliverable
│   ├── sito/             ← riferimenti tecnici (dominio, hosting, DNS, piattaforma)
│   └── stack/            ← tecnologie usate per questo cliente
├── payments/             ← fatture emesse, ricevute, scadenze, storico pagamenti
└── scadenze.md           ← scadenzario unico (rinnovo dominio, hosting, manutenzione, fatture)
```

**Template in `~/wingman/vault-cliente/_template/`** — copiare per ogni nuovo cliente attivo.
Entità del cliente → anche in `vault-global-knowledge/wiki/entities/` con tag `client`.

## Cosa c'era prima (stale, non usare più)
| Vecchio | Nuovo |
|---------|-------|
| `~/wingman/vault-{board}/diary.md` | `~/wingman/vault-global-knowledge/diary.md` |
| `~/wingman/reports/{board}/summary.md` | ❌ deprecato — non scrivere, non leggere |
| `~/wingman/vault-admin/diary.md` (aggregato) | `~/wingman/vault-global-knowledge/diary.md` |

## Dogma vault-schema
- **Punto 13 risolto**: knowledge centralizzato in vault-global-knowledge (16/06/2026)
- Source of truth completo: `~/wingman/vault-admin/wiki/stack/vault-schema.md`
