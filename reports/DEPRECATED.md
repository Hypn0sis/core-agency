# DEPRECATED — Report Legacy

## 2026-06-16: reports/ directory deprecata

Questa directory conteneva report generati dal vecchio flusso (pre-vault).

**Motivo deprecazione:** Il nuovo flusso Summarizer produce report nei vault direttamente.

### Report migrati

| File originale | Nuova destinazione |
|---|---|
| reports/sviluppo/summary.md | vault-sviluppo/diary.md |
| reports/marketing/pipeline-lead-bergamo-giugno2026.md | vault-marketing/wiki/entities/pipeline-lead-bergamo-giugno2026.md |
| reports/sales/summary.md | vault-sales/diary.md |

### Flusso attuale
- **Docs-writer** (penultimo) → scrive report + aggiorna vault diary
- **Curator** (ultimo) → review + close parent + crea task Summarizer
- **Summarizer** → report cross-board nel vault del board di destinazione

Non scrivere più nuovi file in questa directory. Usa il vault del board.
