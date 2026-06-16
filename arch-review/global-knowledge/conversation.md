# Conversazione 2026-06-16 — Review architettura + Fix global-knowledge

## Partecipanti
- **Teo** (@Hypnosis_21809) — Founder
- **Wingman** (Hermes Agent) — Supremo coordinatore

## Temi trattati

### 1. Review critica architettura
Teo ha chiesto una revisione approfondita dell'intera architettura multi-board, evidenziando:
- Workflow e automatismi
- Se ogni agente sa cosa fare e chi ingaggiare dopo
- Autoconsistenza del sistema
- Chi è il garante della documentazione

### 2. Centralizzazione knowledge — vault-global-knowledge
**Decisione chiave**: discussioni, decisioni e diary vanno SOLO in vault-global-knowledge.
- vault-global-knowledge/ è il SINGLE SOURCE OF TRUTH per tutto il knowledge condiviso
- diary.md — timeline globale con prefisso board
- conversations/ — SOLO discussioni Teo↔Wingman
- wiki/decisions/ — decisioni cross-board
- wiki/entities/ — entità globali

### 3. Struttura vault-cliente
Teo ha richiesto una struttura vault-cliente facilmente navigabile con:
- diary.md: advancement progetto, milestone, scadenze
- conversations/: trascrizioni chat cliente
- wiki/entities/: referenti cliente
- wiki/decisions/: decisioni cliente
- wiki/milestones/: milestone progetto
- wiki/sito/: riferimenti sito, dominio, hosting
- payments/: fatture, pagamenti
- scadenze.md: scadenzario unico

### 4. Fix eseguiti (in ordine)

| # | Fix | Stato |
|---|-----|-------|
| P1 | Sales SOUL.md — corretti profili presentar/closer → proposal-writer/negotiator | ✅ |
| P2 | vault-global-knowledge/ creato | ✅ |
| P3 | vault-schema dogma aggiornato (Punto 13) | ✅ |
| P4a | Summarizer SOUL.md → global-knowledge | ✅ |
| P4b | Board skill SKILL.md (×4) aggiornate | ✅ |
| P4c | Docs-writer SOUL.md (×4) → global-knowledge | ✅ |
| P4d | 30 specialisti normalizzati (mini-report + error handling) | ✅ |
| P4e | Curator SOUL.md → global-knowledge | ✅ |
| P5 | multi-board-agent-architecture skill | ✅ |
| P6 | blueprint-nuova-board.md riscritto | ✅ |
| P7 | Final verification | 🔄 |

## Decisioni

1. **Knowledge centralizzato**: vault-global-knowledge SSOT per diary, decisioni, entità globali, conversazioni Teo↔Wingman
2. **Board vault**: perdono diary.md, conversations/, wiki/decisions/ — solo dati operativi locali
3. **Cliente vault**: struttura separata per ogni cliente attivo
4. **vault-schema Dogma Punto 13**: Knowledge centralizzato (16/06/2026)
5. **Blueprint aggiornato**: riflette la triplice struttura (global-knowledge / board / cliente)
