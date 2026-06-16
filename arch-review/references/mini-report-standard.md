# Mini-Report Standard — Ogni specialista produce questo formato

> **Applicato a 30 specialisti (16/06/2026).** Ogni agente atomico DEVE
> produrre un mini-report strutturato in `kanban_complete(summary=...)`.

## Formato canonico

```
## Mini-Report
- task:      <id>
- agente:    <profile-name>
- esito:     ✅ completato | ❌ fallito
- dettagli:  <2-3 righe sul lavoro svolto>
- bloccanti: @nessuno | @<descrizione>
```

## Dove va

Nel `summary=` del `kanban_complete()`. È machine-readable (sezioni key: value)
e human-readable allo stesso tempo.

## Regole

1. **task**: l'ID kanban del sub-task (da `$HERMES_KANBAN_TASK` o `kanban_show`)
2. **agente**: il nome del profilo (es. `sviluppo-builder`, `sales-negotiator`)
3. **esito**: ✅ se completato, ❌ se fallito (usa `kanban_block` invece di `kanban_complete` per bloccanti)
4. **dettagli**: 2-3 righe — cosa è stato fatto, artefatti prodotti, decisioni prese
5. **bloccanti**: `@nessuno` se tutto OK, altrimenti descrizione sintetica del problema

## Esempio concreto

```python
kanban_complete(summary="""## Mini-Report
- task:      t_a1b2c3d4
- agente:    sviluppo-builder
- esito:     ✅ completato
- dettagli:  Implementata funzione rate-limiter con token bucket.
             Keys su user_id con fallback IP. 14 test, tutti pass.
- bloccanti: @nessuno
""")
```

## Fallimento

Se lo specialista non può completare (bloccante, mancano dati, errore irrecoverabile):

```python
kanban_block(reason="## Mini-Report\n- task: ...\n- agente: ...\n- esito: ❌ bloccato\n- dettagli: ...\n- bloccanti: @<descrizione problema>")
```

📛 **Non usare `kanban_complete` con esito ❌** — il task deve rimanere aperto
per retry o decisione umana. `kanban_block` fa proprio questo.

## Perché

- Standardizzare l'output di 35+ specialisti su 4 board
- Curator può parsare i mini-report per la review
- Il summary è auto-contenuto — non serve aprire tool output per capire cosa è successo
- Consistenza cross-board: stesso formato per sviluppo, marketing, admin, sales
