---
date: 2026-06-16
status: active
tags: [workflow, architettura, decisione]
---

# Decisione: B1 con Curator-as-closer

## Contesto
Due modelli possibili per il workflow multi-agente:
- **B1**: Dispatcher crea TUTTI i sub-task in una volta, poi kanban_complete.
- **B2**: Dispatcher crea sub-task in batch, attende risultati, poi passa a Curator.

## Decisione
**Scelta B1**.
- Dispatcher crea tutti i sub-task, passa PARENT_ID nel body
- Specialisti eseguono e kanban_complete
- Docs-writer (penultimo) crea task per Curator con PARENT_ID
- Curator revisiona ciclo di vita, CHIUDE parent task
- Curator crea task per Summarizer
- Summarizer scrive report su global-knowledge

## Motivi
- Semplicità: meno round trip, dispatcher snello
- Curator è l'unico autorizzato a chiudere il parent
- Docs-writer non chiude parent — lo passa a Curator
