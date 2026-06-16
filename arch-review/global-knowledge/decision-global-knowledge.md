---
date: 2026-06-16
status: active
tags: [meta, architettura, decisione]
---

# Decisione: Centralizzazione knowledge in vault-global-knowledge

## Contesto
L'architettura multi-board creava isolamento della conoscenza:
- Entità duplicate (Teo in 3 vault, mai sincronizzate)
- Decisioni non visibili cross-board
- Diary frammentati per board
- Summarizer scriveva in reports/ deprecato

## Decisione
Tutto il knowledge condiviso vive in **vault-global-knowledge/**:
- **conversations/** — SOLO le discussioni Teo–Wingman. Nessuna conversazione nei vault per-board.
- **wiki/decisions/** — decisioni cross-board e per-board, visibili a tutti.
- **diary.md** — timeline globale di TUTTI i board. Una riga per task/sessione.
- **wiki/entities/** — entità globali (Teo, Martin, clienti attivi, tools condivisi).

I vault per-board restano per dati operativi board-specifici:
- `wiki/entities/` — entità di dominio del board
- `wiki/stack/` — tecnologie/tools del board
- `wiki/contacts/` — contatti del board
- `wiki/payments/` — pagamenti del board (admin)

## Alternative scartate
- **Status quo** (vault isolati): duplicazione entità, decisioni invisibili cross-board
- **Vault singolo per tutto**: troppo rumore, nessuna separazione per dominio

## Impatto
- Ogni docs-writer aggiorna `vault-global-knowledge/diary.md` invece del diary per-board
- Il Summarizer scrive su global-knowledge invece che reports/
- Il Curator revisiona global-knowledge invece che diary per-board
- conversations/ rimosse da vault per-board (esistenti e future)
- La struttura vault-schema viene rivista: conversations/decisions/diary → solo global-knowledge
