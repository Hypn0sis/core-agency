# vault-cliente/{cliente}/ — Struttura Completa

> **Template in `~/wingman/vault-cliente/_template/`** — copiare per ogni nuovo cliente attivo:
> `cp -r ~/wingman/vault-cliente/_template/ ~/wingman/vault-cliente/{cliente}/`

## Albero

```
vault-cliente/{cliente}/
├── diary.md               ← ADVANCEMENT: milestone, stato, blocchi, prossimi passi
├── conversations/         ← trascrizioni chat col cliente (YYYY-MM-DD-topic.md)
├── wiki/
│   ├── entities/          ← referenti cliente (nome, ruolo, telefono, email)
│   ├── decisions/         ← decisioni cliente (ok design, approvazioni, variazioni)
│   ├── milestones/        ← milestone progetto con date e deliverable
│   ├── sito/              ← riferimenti tecnici (dominio, hosting, DNS, piattaforma)
│   └── stack/             ← tecnologie usate per questo cliente
├── payments/              ← fatture emesse, ricevute, scadenze, storico pagamenti
└── scadenze.md            ← scadenzario unico (rinnovo dominio, hosting, manutenzione, fatture)
```

## Ogni cartella nel dettaglio

### `diary.md`
- **Formato**: advancement del progetto, non log
- **Frontmatter**: cliente, stato (lead|attivo|completato|chiuso), data_attivazione, prossima_scadenza
- **Entry**: `## YYYY-MM-DD | {fase milestone}` con avanzamento, prossimo step, bloccanti
- **Non cancellare mai** — solo append

### `conversations/`
- **Un file per sessione**: `YYYY-MM-DD-topic.md`
- Trascrizioni integrali o riassunti fedeli delle chat col cliente
- Data nel nome file per ordinamento cronologico

### `wiki/entities/`
- **Una pagina per referente**: nome, ruolo, telefono, email, note
- Frontmatter: `name`, `role`, `telefono`, `email`, `created`

### `wiki/decisions/`
- **Una pagina per decisione**: ok design, approvazioni, variazioni budget
- Frontmatter: `date`, `status: active|superseded`, `tags: [cliente, decisione]`
- Contesto: cosa ha portato alla decisione, cosa si è deciso, alternative scartate
- Se cambiata: marcare `status: superseded` e linkare nuova decisione

### `wiki/milestones/`
- **Una pagina per milestone**: con data e deliverable
- Frontmatter: `data`, `status: active|completato|cancellato`, `tipo: design|sviluppo|consegna|revisione`
- Contenuto: descrizione, deliverable checklist, stato (✅/🔄/🔜/❌)

### `wiki/sito/`
- **Unico file** `sito.md` per cliente
- Dominio: nome, provider DNS, scadenza
- Hosting: provider, piano, scadenza, costo rinnovo
- Piattaforma: tipo (statico/WordPress/altro), path codice, metodo deploy
- Credenziali: tabella servizi con URL e riferimento vault-admin

### `wiki/stack/`
- Tecnologie usate per QUESTO cliente (es. framework, librerie, strumenti)
- Versioni, note tecniche specifiche del progetto

### `payments/`
- **Una pagina per fattura/pagamento**
- Frontmatter: `date`, `importo`, `stato: emessa|pagata|scaduta`, `tipo: una_tantum|ricorrente`
- Contenuto: data emissione, scadenza, importo, tipo, note pagamento
- Se ricorrente: marcare `tipo: ricorrente` e aggiungere `recurring: true`

### `scadenze.md`
- **Scadenzario unico** — tabella con tutte le scadenze del cliente
- Colonne: Scadenza | Cosa | Importo | Stato | Note
- **Regola**: aggiornare DOPO ogni modifica a `payments/` o `wiki/sito/`
- Cose da tracciare: rinnovo dominio, rinnovo hosting, fatture, manutenzioni programmate

## Quando creare

> **Solo al momento dell'attivazione del cliente.** I lead vivono in
> `vault-sales/wiki/entities/`. Quando un lead diventa cliente pagante:
> 1. Copiare `_template/` in `{cliente}/`
> 2. Popolare con dati reali
> 3. Aggiungere entità in `vault-global-knowledge/wiki/entities/` con tag `client`
