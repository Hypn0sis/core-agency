# 🔍 Prompt di Review — Architettura Multi-Agent Wingman

## Obiettivo

Analizzare in modo **critico e approfondito** l'architettura multi-agent descritta nei documenti allegati. Obiettivo: validare che **tutto sia autoconsistente**, che ogni agente sappia cosa fare e chi ingaggiare, e che i workflow non abbiano gap, buchi logici o contraddizioni.

## Package incluso

Il package `arch-review.tar.gz` contiene 30 file organizzati in 6 cartelle.

### Come eseguire la review

1. **Leggi in ordine**: prima i dogmi (vault-schema), poi il blueprint, poi la skill master, poi le catene, poi le skills board, poi i profili, poi i template
2. **Prendi appunti** su ogni incongruenza
3. Alla fine **produci report strutturato** (vedi template sotto)

---

## Domande guida per ogni area

### 1. vault-schema.md (dogma)
- Le 3 strutture vault (global-knowledge, board, cliente) sono coerenti? Nessuna sovrapposizione?
- I dogmi (1-13) sono consistenti tra loro? Nessun dogma annulla un altro?
- Il flusso di auto-aggiornamento è completo e deterministico?
- I "dogmi risolti" (Punti 1-13) sono veramente risolti o lasciano code aperte?

### 2. blueprint-nuova-board.md
- La procedura è eseguibile da un LLM senza ambiguità?
- La checklist è completa? Manca qualche passo?
- vault-cliente è integrato correttamente nel flusso di creazione board?
- I template forniti sono coerenti con la struttura descritta?

### 3. multi-board-agent-architecture/SKILL.md (master)
- L'architettura descritta è coerente con vault-schema e blueprint?
- Ci sono contraddizioni con i documenti core?
- I riferimenti a `vault-{board}/diary.md` o `reports/` sono tutti migrati a global-knowledge?
- La sezione dei "perché" è allineata con le decisioni effettive?

### 4. chain-architecture.md
- La catena dispatcher → specialisti → docs-writer → curator → summarizer ha buchi?
- I ruoli penultimo (docs-writer) e ultimo (curator) sono ben definiti?
- Cosa succede se docs-writer fallisce? Se curator fallisce? Se un specialista fallisce?
- I 4 board (sviluppo, marketing, admin, sales) hanno tutti una catena completa?
- Le tabelle dei ruoli sono corrette? Tutti i profili menzionati esistono?

### 5. Board skill SKILL.md (×4)
- Ogni board ha dispatcher + specialisti giusti per il suo dominio?
- Le regole B1 ("dispatcher crea tutti i task in una volta") sono identiche in tutte?
- Il docs-writer di ogni board punta a vault-global-knowledge/diary.md?
- Le exclusion rules (📛) sono sufficienti? Ce ne sono di contraddittorie?
- I riferimenti incrociati tra board (cross-board) sono specificati?

### 6. Dispatcher SOUL.md (×4)
- Ogni dispatcher sa quali specialisti ingaggiare e in che ordine?
- C'è abbastanza contesto nel suo SOUL.md o deve sempre caricare la board skill?
- PARENT_ID è passato correttamente a tutti i sub-task?
- dispatcher NON passa `--skill` (regola B1)? È esplicitato?

### 7. Curator e Summarizer
- Curator sa revisionare TUTTI i board? Ha abbastanza contesto?
- Summarizer scrive su vault-global-knowledge/diary.md o altrove?
- Curator crea task per Summarizer con PARENT_ID corretto?

### 8. vault-cliente
- La struttura è completa per un progetto reale?
- Il template è coerente con vault-schema?
- Manca qualcosa? (es. contratti, SLA, report cliente)
- scadenze.md è auto-aggiornante o va mantenuto manualmente?

### 9. vault-schema-digest + mini-report-standard
- Il digest riassume correttamente vault-schema?
- Il mini-report standard è coerente con ciò che i SOUL.md richiedono?
- Il formato mini-report è facile da parsare da un altro LLM?

### 10. gap-analysis-2026-06-16.md
- I gap identificati sono stati tutti risolti? C'è un rimando a ogni fix?
- Quali gap rimangono aperti?

### 11. global-knowledge vault (entities, decisions, conversation)
- Le entità (Teo, Wingman, Martin) sono complete e aggiornate?
- Le decisioni (B1, centralizzazione) sono coerenti con vault-schema?
- La conversazione di review ha informazioni che contraddicono i documenti?

### 12. CONSISTENZA CROCIATA (più importante)
- vault-schema dogma → blueprint → chain-architecture → board skills → SOUL.md: sono allineati?
- Se vault-schema dice X, lo troviamo in blueprint, nelle board skill e nei SOUL.md?
- Ci sono **regole duplicate in conflitto**? (es. "docs-writer scrive vault-global-knowledge" VS "scrive vault-{board}")
- Tutti i percorsi file menzionati esistono davvero? O sono ipotetici?
- La terminologia è uniforme? (es. "closer" VS "curator", "publisher" VS "docs-writer", "report" VS "diary entry")

---

## Template Report Finale

```markdown
# Review Architettura Wingman — Report

## Riepilogo
{Esito: ✅ Consistente / ⚠️ Minori / ❌ Bloccante + conteggio findings}

## Findings Critici (bloccanti)
{Errori che rompono il flusso — es. "docs-writer punta a vault-sviluppo/diary.md, ma vault-schema dice global-knowledge"}

## Findings Maggiori
{Incongruenze che richiedono fix — es. "board-sales menziona presenter/closer ma i profili si chiamano proposal-writer/negotiator"}

## Findings Minori
{Typos, refs orphan, inconsistency naming}

## Verifiche Passate
{Cose che hanno retto alla verifica incrociata — elencare le principali}

## Domande Aperte
{Cose non chiare che richiedono decisione umana}

## Raccomandazioni
{Ordine di priorità per fix}
```

## Output richiesto

1. **Report strutturato** seguendo il template sopra
2. **Per ogni finding**: file + riga + citazione + spiegazione + fix proposto
3. **Voto finale**: ✅ Consistente / ⚠️ Minori / ❌ Bloccante

---

## Esempio di finding

```
❌ CRITICO — board-sviluppo SKILL.md:57
"Docs-writer (penultimo): Aggiorna vault-sviluppo/diary.md"
MA vault-schema dogma dice: "diary.md SOLO in vault-global-knowledge"
FIX: vault-sviluppo/diary.md → vault-global-knowledge/diary.md
```
