# Gap Analysis — 2026-06-16

> Critical architecture review of the Wingman multi-board system.
> See `~/.hermes/skills/autonomous-ai-agents/multi-board-agent-architecture/SKILL.md`
> section "Self-Consistency Protocol" for the fixes implemented.

## Sessione di Review

Surveyed all 50 agent markdown files, 41 Hermes profiles, 4 board skills, 4 vaults,
and every SOUL.md. Found **12 gaps** across three severity levels.

---

## 🔴 GAP: B1/B2 Desync in board-marketing e board-sales

| Board | SOUL.md (dispatcher) | board-{name} SKILL.md |
|-------|---------------------|----------------------|
| Sviluppo | ✅ B1 | ✅ B1 |
| Marketing | ✅ B1 — crea tutti i task | ❌ DICEVA B2 |
| Sales | ✅ B1 — crea tutti i task | ❌ DICEVA B2 |
| Admin | ✅ Pool | ✅ Pool |

**Rischio**: worker carica skill_view → legge B2 → si comporta diversamente dal
SOUL.md. Crash imprevedibile.

**Fix**: board-marketing e board-sales SKILL.md allineate a B1.

## 🔴 GAP: Parent Task Mai Chiuso

Flusso attuale:
```
Wingman → Kanban parent task
  → Dispatcher crea sub-task → kanban_complete (chiude sé stesso)
    → Specialisti completano → kanban_complete (chiudono sub-task)
    → ❌ PARENT TASK RIMANE APERTO
```

Nessuno chiude il parent. Disponibile per dispatch ma non dovrebbe esserlo.

**Fix preventivo**: docs-writer (ultimo specialista) dovrebbe:
1. Completare il suo lavoro
2. Aggiornare vault (diary + wiki)
3. Scrivere report in reports/{board}/summary.md
4. Chiudere parent task (via kanban_complete sul parent)

## 🔴 GAP: Vault Auto-Aggiornamento Inesistente

Vault-schema dichiara:
> Ogni task completato → aggiornamento automatico diary + conversations + wiki

Ma nessun SOUL.md di specialista menziona il vault. L'output dei task si perde.

## 🔴 GAP: Curator e Summarizer Orfani

Profili `curator` e `summarizer` esistono, hanno SOUL.md, ma **nessuno li chiama**.
Nessun kanban task, nessun cronjob, nessun dispatcher li attiva. Zombie.

## 🔴 GAP: admin-organizer Ref Stale

`board-sviluppo/SKILL.md` cross-board sezione conteneva:
```
- Deploy / risorse → admin-organizer ❌
```
admin-organizer è stato cancellato (era uno dei 4 profili errati).

**Fix**: puntato a sviluppo-ops (deploy) e admin-asset-keeper (credenziali/domini).

## 🟡 GAP: Clienti Senza Vault Dedicato

Bergamaschi ha entità in vault-marketing e vault-sales invece di vault-bergamaschi/.
boards/sales/leads/ ha 4 file CRM fuori vault.

## 🟡 GAP: boards/ Ha Contenuti Estranei

- boards/admin/contratti/ — 5 template contrattuali (dovrebbero essere in vault)
- boards/sales/leads/ — 4 file CRM/dati lead

boards/ doveva contenere SOLO i 50 agent .md. Ha roba extra.

## 🟡 GAP: Reports Incompleti

- reports/admin/ — **vuoto**
- reports/marketing/ — non ha summary.md
- reports/sviluppo/ e reports/sales/ — hanno summary ma nessuno li aggiorna
  automaticamente

## 🟢 GAP: Mini-Report Non Standardizzato

Ogni specialista scrive summary diverso in kanban_complete. Il formato
standardizzato (task, agente, esito, dettagli, note) è definito ma non imposto.

## 🟢 GAP: Template SOUL.md Specialista Non Uniforme

Blueprint definisce un template, ma i SOUL.md attuali differiscono per dettaglio
e istruzioni (alcuni menzionano vault, altri no).

## 🟢 GAP: Nessuna Metrica

Nessun tracciamento di: tempi medi task, crash rate, throughput, errori per board.
Impossibile identificare colli di bottiglia.

## 🟢 GAP: global-knowledge Vault Non Creato

Il vault cross-board è stato nominato ma non ancora implementato.

---

## Decisioni dalla Review

1. **B1 è LO STANDARD**: dispatcher crea tutti i sub-task, specialisti eseguono
   e completano. B2 deprecato.
2. **Post-completamento**: docs-writer (penultimo specialista) documenta e aggiorna vault,
   poi crea task per Curator. Curator (ultimo) revisiona e chiude il parent task.
3. **Curator/Summarizer**: da integrare come task finale nel flusso (docs-writer
   crea task per Curator, Curator crea task per Summarizer).
4. **Vault clienti**: vault-{cliente}/ separato dai board vault.

---

## Stato Risoluzione Gap (aggiornamento al 2026-06-16 ~giorno 2)

### ✅ 🔴 B1/B2 Desync in board-marketing e board-sales — RISOLTO
Board-marketing e board-sales SKILL.md allineate a B1.

### ✅ 🔴 Parent Task Mai Chiuso — RISOLTO
Curator chiude il parent task (Invariant 1-2). Non docs-writer.

### ✅ 🔴 Curator e Summarizer Orfani — RISOLTO
1. `config.yaml` — aggiunta `models.summarizer` (provider: auto, timeout: 300)
2. Flusso: docs-writer → crea task per Curator → Curator chiude parent + crea task per Summarizer
3. Dogmatizzato in vault-schema.md e board-{name} skills

### ✅ 🔴 Vault Auto-Aggiornamento Inesistente — RISOLTO PARZIALMENTE
Docs-writer aggiorna vault (diary + wiki + entità) come parte del suo lavoro.
**NOTA:** non verificato con un task reale end-to-end.

### ✅ 🔴 admin-organizer Ref Stale — RISOLTO
Cross-board references in board-sviluppo skill puntate a sviluppo-ops e admin-asset-keeper.

| ### ✅ 🟡 Clienti Senza Vault Dedicato — RISOLTO
Policy stabilita: vault cliente creato al momento dell'attivazione.
Lead data migrato in vault-sales/wiki/entities/. boards/sales/leads/ diventa parte del Canonical Agent Registry.

### ✅ 🟡 boards/ Contenuti Estranei — NON È UN GAP
boards/ è il Canonical Agent Registry (58 agent markdown + lead/contratto files per sales/admin).
boards/ e vault servono scopi diversi: boards/ = agente definizioni, vault = knowledge storage.
Mantenere separazione.

### ✅ 🟡 Reports e Vault — RISOLTO
`reports/` directory deprecata (DEPRECATED.md). 3 report migrati nei vault.
Flusso attuale: docs-writer → vault diary, Summarizer → report cross-board.

### 🟢 Mini-Report Non Standardizzato — ANCORA APERTO
Il formato è definito nei board skill ma non ancora imposto nei kanban summary.

### 🟢 Template SOUL.md Specialista Non Uniforme — ANCORA APERTO  
Blueprint definito ma SOUL.md attuali differiscono per dettaglio.
Skills sync risolta (symlink) — aggiornare SOUL.md è separato.

### 🟢 Nessuna Metrica — ANCORA APERTO
Nessun tracciamento di tempi, crash rate, throughput.

### 🟢 global-knowledge Vault Non Creato — ANCORA APERTO
