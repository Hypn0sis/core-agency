---
name: lead-pipeline
description: Documento operativo per la gestione della pipeline lead B2B locale - CORE. digital agency
board: sales
type: atomic
---

# Lead Pipeline Operativa - CORE. digital agency

> Documento operativo. Ogni sezione e' uno step eseguibile. Leggi, apri il browser, inizia.

---

## 1. Fonti Lead

### 1.1 PagineGialle.it

**Perche' funziona:** elenca attivita' senza sito, senza filtro "ha presenza digitale". E' la fonte piu' densa di lead freddi digitalmente.

**Categorie prioritarie (in ordine di conversione attesa)**

| # | Categoria PG | Query da usare |
|---|-------------|----------------|
| 1 | Macellerie e salumerie | "macellerie" |
| 2 | Panifici e forni | "panifici" / "forni" |
| 3 | Pasticcerie | "pasticcerie" |
| 4 | Ristoranti e trattorie | "ristoranti" / "trattorie" |
| 5 | Pizzerie | "pizzerie" |
| 6 | Parrucchieri | "parrucchieri" |
| 7 | Barbieri | "barbieri" |
| 8 | Estetiste e centri benessere | "estetiste" / "centri estetici" |
| 9 | Negozi abbigliamento | "abbigliamento" |
| 10 | Fioristi | "fiorai" / "fioristi" |
| 11 | Artigiani (idraulici, elettricisti, falegnami) | "idraulici" / "falegnami" |
| 12 | B&B e affittacamere | "bed and breakfast" / "affittacamere" |
| 13 | Palestre e centri sportivi | "palestre" |
| 14 | Studi medici e odontoiatrici | "dentisti" / "medici" |

**Procedura step-by-step**

1. Vai su `paginegialle.it`
2. Campo "cosa": inserisci categoria (es. "macellerie")
3. Campo "dove": inserisci il comune o la zona target
4. Nella lista risultati: apri ogni scheda
5. Per ogni attivita' controlla:
   - C'e' un link sito web nella scheda? -> se NO, lead potenziale
   - C'e' un link social nella scheda? -> se NO, ulteriore segnale
   - Quante recensioni ha? -> 0 recensioni = presenza digitale assente
6. Copia nome, telefono, indirizzo in foglio tracking
7. Non qualificare qui: vai a step verifica web (sezione 3)

**Filtri: cosa cercare**
- Schede senza link sito
- Schede senza link social
- Numero di telefono fisso presente (attivita' stabile)
- Nome individuale o familiare (es. "Panificio Rossi" non "Pane&Gusto Srl con 5 sedi")

**Cosa escludere**
- Franchising o catene (nome uguale in piu' comuni -> stessa corporate)
- Attivita' con sito gia' linkato nella scheda PG -> vai direttamente a verifica qualita' sito
- Attivita' con 0 telefono e 0 indirizzo -> scheda zombie
- "In liquidazione" o partita IVA cessata -> segnalato a volte nella scheda stessa

---

### 1.2 Google Maps

**Perche' funziona:** mostra la scheda GMB (Google My Business) con recensioni, foto, link sito. Leggere la scheda GMB e' leggere lo stato digitale dell'attivita' in tempo reale.

**Keywords per tipologia business**

| Tipologia | Query Google Maps |
|-----------|------------------|
| Alimentari | "macelleria [comune]" / "panificio [comune]" / "alimentari [comune]" |
| Ristorazione | "ristorante [comune]" / "trattoria [comune]" / "pizzeria [comune]" |
| Benessere | "parrucchiere [comune]" / "estetista [comune]" / "barbiere [comune]" |
| Fitness | "palestra [comune]" / "centro sportivo [comune]" |
| Artigiani | "idraulico [comune]" / "falegname [comune]" / "elettricista [comune]" |
| Ricettivo | "b&b [comune]" / "affittacamere [comune]" / "agriturismo [comune]" |
| Professionisti | "studio dentistico [comune]" / "commercialista [comune]" |

**Procedura ricerca Google Maps**

1. Apri Google Maps su browser (non app)
2. Cerca la query (es. "ristorante [comune]")
3. Nella lista a sinistra: scorri tutte le schede visibili
4. Clicca su ogni attivita' e leggi la scheda destra:
   - **Sito web**: c'e' il bottone "Sito web"? Se no -> lead
   - **Foto**: quante? Aggiornate? Se poche e vecchie -> segnale positivo
   - **Recensioni**: quante e che voto? Se 4+ stelle e 20+ recensioni -> attivita' sana, ha senso investire
   - **Ultimo aggiornamento scheda**: GMB mostra "Risponde solitamente entro X" -> attivita' attiva
   - **Orari**: ha orari aggiornati? Se no -> scheda abbandonata = lead con urgenza
5. Premi "Mostra altri risultati" fino a esaurire la lista
6. Copia i lead candidati nel foglio tracking

**Segnali da leggere sulla scheda GMB**

| Segnale | Significato | Priorita' lead |
|---------|------------|----------------|
| Nessun link sito | Assenza digitale totale | ALTA |
| Link sito presente ma rotto | Sito scaduto o non rinnovato | ALTA |
| 0-5 foto, tutte vecchie | Scheda abbandonata | ALTA |
| 0 risposte alle recensioni | Non gestisce la reputazione online | MEDIA |
| Nessun post GMB negli ultimi 90gg | Presenza inattiva | MEDIA |
| Poche recensioni (<15) nonostante anni attivita' | Non incentiva i clienti | MEDIA |
| Scheda senza descrizione attivita' | Setup minimo | BASSA |

---

### 1.3 Camera di Commercio (CCIAA)

**Perche' funziona:** database ufficiale di tutte le imprese italiane registrate. Permette di trovare attivita' per ATECO, dimensione, anzianita', forma giuridica. Fonte certificata, dati aggiornati.

**Link utili CCIAA e portali collegati**

| Portale | URL | Cosa fare |
|---------|-----|-----------|
| Registro Imprese | `registroimprese.it` | Ricerca per comune + ATECO + forma giuridica |
| Telemaco | `telemaco.infocamere.it` | Visure e liste imprese (accesso a pagamento, utile in fase scale) |
| InfoCamere OpenData | `opendata.infocamere.it` | Dataset scaricabili per analisi offline |
| Startup Italiane | `startup.registroimprese.it` | Da ESCLUDERE (non target PMI mature) |
| ATECO Explorer | `ateco.infocamere.it` | Trova il codice ATECO esatto per categoria |

**Codici ATECO prioritari per CORE.**

| ATECO | Descrizione |
|-------|-------------|
| 47.22 | Commercio al dettaglio di carni e prodotti a base di carne |
| 47.24 | Commercio al dettaglio di pane, torte, dolciumi |
| 56.10 | Ristoranti e attivita' di ristorazione mobile |
| 56.30 | Bar e altri esercizi simili senza cucina |
| 96.02 | Servizi degli istituti di bellezza e parrucchieri |
| 96.04 | Centri benessere fisico (palestre) |
| 93.11-93.19 | Attivita' sportive |
| 55.20 | Alloggi per vacanze, B&B, affittacamere |
| 43.21-43.22 | Installazioni elettriche, idrauliche (artigiani) |
| 16.10-16.29 | Falegnamerie |
| 86.23 | Studi odontoiatrici |
| 69.20 | Attivita' di contabilita' e consulenza fiscale |

**Filtri da applicare nella ricerca**

- **Forma giuridica**: Ditta Individuale, Societa' in nome collettivo (SNC), Societa' a responsabilita' limitata unipersonale (SRLu) -> target. Escludere SPA, Cooperative grandi, Consorzi.
- **Numero addetti**: 1-15 addetti. Escludere 0 addetti (potrebbe essere holding o inattiva) e oltre 15 (struttura interna potrebbe gestire il digitale).
- **Anno iscrizione**: preferire attivita' con almeno 3 anni di vita (iscritte prima del 2023). Ottimale: iscritte prima del 2015 -> consolidate, budget stabile.
- **Stato attivita'**: ATTIVA obbligatorio. Escludere: In liquidazione, Cessata, Sospesa.
- **Sede legale = sede operativa**: evitare holding domiciliate che non hanno locale fisico.

**Cosa filtrare (esclusioni automatiche)**

- Cooperativa con oltre 20 soci -> struttura troppo complessa
- Attivita' con sede in zona industriale + ATECO manifatturiero pesante -> non B2C, non target
- Imprese con "GROUP", "HOLDING", "INTERNATIONAL" nel nome -> fuori target
- Anno iscrizione corrente o anno precedente -> troppo giovani, zero budget

---

## 2. Checklist Qualificazione Lead

### Sistema di classificazione HOT / CALDO / TIEPIDO / FREDDO

**HOT** - Contatta entro 24 ore
**CALDO** - Contatta entro 3 giorni
**TIEPIDO** - Contatta entro 1 settimana
**FREDDO** - Archivia o rivaluta tra 3 mesi

---

### Criteri prescrizione web (sito)

| Criterio | HOT (+3) | CALDO (+2) | TIEPIDO (+1) | FREDDO (0) |
|----------|----------|-----------|-------------|-----------|
| Sito web | Nessun sito | Sito con errori / non carica | Sito non mobile (<2019) | Sito moderno responsive |
| Piattaforma sito | - | Wix/Jimdo/Weebly datato | WordPress template basic | CMS professionale aggiornato |
| Dominio | - | Sottodominio gratuito (es. .wix.com) | Dominio custom scaduto | Dominio custom attivo |
| Mobile | - | Sito non leggibile su mobile | Solo parzialmente responsive | Fully responsive |
| Velocita' | - | Carica in oltre 5 secondi | Lento ma funziona | Veloce |
| Contenuto | - | Contenuto del 2015 o prima | Aggiornamento sporadico | Aggiornato e rilevante |

### Criteri social e reputazione

| Criterio | HOT (+3) | CALDO (+2) | TIEPIDO (+1) | FREDDO (0) |
|----------|----------|-----------|-------------|-----------|
| Facebook | Nessuna pagina FB | Pagina FB abbandonata (>90gg) | Pagina FB con pochi like (<500) | Pagina FB attiva |
| Instagram | Nessun profilo IG | Profilo IG morto (>30gg) | Profilo IG con <500 follower | Profilo IG attivo e crescente |
| Google Business | Scheda GMB assente | Scheda non rivendicata | Scheda base senza foto/post | Scheda ottimizzata |
| Recensioni Google | 0 recensioni | <10 recensioni | 10-30 recensioni | 30+ recensioni gestite |
| Voto Google | - | Sotto 3.5 stelle | 3.5-4.0 stelle | 4.5+ stelle con risposte |

### Soglie classificazione

Somma i punti dai criteri:
- **12+ punti** -> HOT
- **8-11 punti** -> CALDO
- **4-7 punti** -> TIEPIDO
- **0-3 punti** -> FREDDO (sito gia' curato, non serve CORE.)

---

### Scheda Lead Tipo (template compilabile)

```
SCHEDA LEAD - CORE. digital agency
===================================
Data raccolta:         __/__/____
Operatore:             ____________

DATI ATTIVITA'
--------------
Nome attivita':        ________________________
Settore:               ________________________
Indirizzo:             ________________________
Comune:                ________________________
Partita IVA / CF:      ________________________
Anni attivita' (stima): ____

CONTATTI
--------
Telefono fisso:        ________________________
Cellulare:             ________________________
Email:                 ________________________
Referente (se noto):   ________________________

PRESENZA DIGITALE
-----------------
Sito web (URL o nessuno): ________________________
Piattaforma sito:      [ ] Nessuno [ ] Wix/Jimdo [ ] WordPress [ ] Custom [ ] Altro
Mobile-friendly:       [ ] Si [ ] No [ ] Non verificato
Dominio custom:        [ ] Si [ ] No
Anno stimato sito:     ____

Facebook (URL o nessuno): ________________________
Ultimo post FB:        __/__/____ o [ ] Mai
Like pagina FB:        ____

Instagram (handle o nessuno): ________________________
Ultimo post IG:        __/__/____ o [ ] Mai
Follower IG:           ____

Google My Business:    [ ] Presente [ ] Assente [ ] Non rivendicata
Recensioni Google:     ____ recensioni | Voto: ____/5

PUNTEGGIO
---------
Sito:    __/3
Social:  __/3
GMB:     __/3
         TOTALE: __/9

CLASSIFICAZIONE: [ ] HOT [ ] CALDO [ ] TIEPIDO [ ] FREDDO

NOTE OPERATIVE
--------------
Sito di terzi gia' presente: [ ] Si -> SCENARIO D [ ] No
Note qualitative:      ________________________

AZIONI
------
Primo contatto:        __/__/____ | Canale: ________________________
Follow-up 1:           __/__/____
Follow-up 2:           __/__/____
Follow-up 3:           __/__/____
Stato:                 [ ] DA CONTATTARE [ ] CONTATTATO [ ] IN TRATTATIVA [ ] CLIENTE [ ] ARCHIVIATO
```

---

## 3. Procedura Verifica Web Individuale

**Obiettivo: qualificare un lead in meno di 5 minuti.**
Segui esattamente questo ordine. Non saltare step.

---

**Step 1 - Google (30 secondi)**
1. Apri Google
2. Cerca `"[nome attivita']" [comune]`
3. Leggi i risultati in prima pagina:
   - Compare un sito web? -> Annota URL
   - Compare scheda GMB? -> Nota stelle e numero recensioni
   - Compare solo directory (PG, Yelp, TripAdvisor)? -> Nessun sito proprio -> lead
4. Se non compare nulla -> assenza totale -> HOT candidate

---

**Step 2 - Verifica sito (60 secondi)**
*Solo se il sito esiste.*

1. Apri il link in browser
2. Premi F12 -> icona toggle device toolbar -> scegli iPhone 12 (375px)
3. Valuta in 10 secondi:
   - La pagina e' leggibile su mobile? Se no -> sito da rimpiazzare
   - Carica in meno di 3 secondi? Se no -> sito obsoleto tecnicamente
   - L'anno di copyright nel footer e' prima del 2020? -> sito vecchio
   - Il menu hamburger funziona? Se no -> sito rotto su mobile
4. Controlla l'URL: e' un sottodominio gratuito (es. `nomeattivita.wix.com`)? -> Scenario D o lead per sito custom
5. Premi CTRL+U (view source): cerca `wordpress`, `wix`, `jimdo`, `squarespace`, `webflow` -> annota la piattaforma

---

**Step 3 - Scheda Google My Business (60 secondi)**
1. Su Google, clicca sulla scheda GMB a destra (Knowledge Panel)
2. Leggi:
   - Quante foto ci sono? Chi le ha caricate (attivita' o clienti)?
   - Ci sono post recenti del proprietario (ultimi 90 giorni)?
   - Il proprietario risponde alle recensioni? Se no -> non gestisce la reputazione
   - C'e' scritto "Sito web" col link? Se no -> nessun sito
   - Gli orari sono aggiornati? Se mostrano orari generici 9-18 ogni giorno -> scheda non curata

---

**Step 4 - Instagram (60 secondi)**
1. Vai su Instagram (browser o app)
2. Cerca il nome dell'attivita' nella barra di ricerca
3. Se il profilo esiste:
   - Quanti post ha?
   - Ultimo post: quando? (piu' di 30 giorni -> morto)
   - Follower: quanti? (<500 -> non ha trazione)
   - Nella bio: c'e' il link sito? Se no -> nessuna integrazione digitale
4. Se il profilo non esiste -> assenza IG -> segnale forte

---

**Step 5 - Fingerprint finale (30 secondi)**

| Cosa verificare | Segnale positivo (per noi) |
|----------------|---------------------------|
| Sito assente o rotto | Vendita sito ex novo |
| Sito di terzi non aggiornato | Proposta migrazione (Scenario D) |
| IG assente o morto | Vendita social management |
| GMB non rivendicata | Urgenza percepita dal cliente |
| Poche recensioni | Bisogno gestione reputazione |
| Mobile non responsive | Argomento concreto nella call |

Compila la scheda lead e assegna classificazione HOT/CALDO/TIEPIDO/FREDDO.

---

## 4. Orari Migliori per Contatto

> Regola generale: chiama quando l'attivita' non e' nel pieno dell'operativo. Il lunedi' mattina e' spesso il momento peggiore per negozi al dettaglio.

| Tipo attivita' | Orario migliore | Orario da evitare | Note |
|---------------|----------------|------------------|------|
| Ristoranti e trattorie | 10:00-11:30 oppure 15:30-17:00 | 12:00-14:30 e 19:00-22:00 | Fuori dai pasti. La pausa pomeridiana e' utile per il titolare |
| Pizzerie | 10:00-12:00 | 18:00-23:00 | Il servizio serale e' intenso, impossibile parlare |
| Panifici e forni | 13:00-15:00 | Prima delle 10:00 | Il mattino e' il picco di lavoro. Il pomeriggio chiudono o rallentano |
| Pasticcerie | 14:30-16:30 | 08:00-12:00 | Idem panifici, pomeriggio piu' tranquillo |
| Macellerie e salumerie | 10:00-12:00 | 17:00-19:30 | Il picco e' sera e sabato mattina |
| Artigiani (idraulici, elettricisti) | 07:30-08:30 oppure 17:30-18:30 | 09:00-17:00 (in cantiere) | Chiamate brevi, proponi un appuntamento fisso |
| Falegnami / officine | 12:00-13:00 | 08:00-12:00 e 14:00-18:00 | La pausa pranzo e' l'unico slot di tranquillita' |
| Professionisti (commercialisti, avvocati) | Mar-Gio 11:00-13:00 | Lun mattina e Ven pomeriggio | Lun = riunioni, Ven = chiusura settimana |
| Studi medici e odontoiatrici | 13:00-15:00 | Orari di ambulatorio | Il medico non risponde tra una visita e l'altra |
| Parrucchieri e barbieri | Lun (chiuso) non chiamare. Mar-Ven 10:00-11:00 | Sab mattina (picco) | Il lunedi' spesso e' giorno di chiusura |
| Estetiste e centri benessere | 10:00-11:30 oppure 14:00-15:30 | Sab (tutto il giorno) | Il sabato e' pieno. I bisettimanali liberi sono Mar/Mer |
| Negozi al dettaglio | Mar-Gio 10:30-12:00 | Sab e orari di punta | Evita l'orario di apertura (9-10) e pre-chiusura |
| Palestre e centri sportivi | 10:00-12:00 | 17:00-21:00 (picco clienti) | La mattina il titolare e' libero, la sera impossibile |
| B&B e affittacamere | 10:00-12:00 o 14:00-16:00 | Week-end (check-in/out) | Il fine settimana sono operativi su check-in. Chiamate infrasettimanali |

**Giorno della settimana**
- Martedi' e mercoledi': giorni migliori per quasi tutte le categorie
- Lunedi': evitare per negozi al dettaglio (riunioni interne, mente sulle scorte)
- Venerdi': call di chiusura o warm follow-up, non primo contatto
- Sabato: mai, tranne per artigiani con cellulare

---

## 5. Sequenza di Follow-up

### Timeline standard (G = Giorno dalla prima azione)

```
G0  - PRIMO CONTATTO
G3  - FOLLOW-UP 1
G7  - FOLLOW-UP 2
G14 - FOLLOW-UP 3 (ultimo)
G15+ - ARCHIVIA se nessuna risposta
```

---

**G0 - Primo contatto**

| Canale preferito | Azione | Tono |
|-----------------|--------|------|
| Telefono (se disponibile) | Chiamata breve, 60-90 secondi. Obiettivo: fissare una call o visita, non vendere | Diretto, informale, locale |
| WhatsApp | Solo se numero e' cellulare. Messaggio di 3 righe max | Amichevole, senza link |
| IG DM | Se nessun numero disponibile. Messaggio brevissimo | Curioso, non commerciale |
| Email | Ultima opzione. Solo se nessun contatto diretto | Professionale, oggetto specifico |

Messaggio tipo telefono:
> "Ciao, sono [nome] di CORE., mi occupo di siti web e social per attivita' come la sua. Ho visto che [attivita'] non ha ancora un sito - volevo capire se e' qualcosa a cui ha mai pensato. Mi bastano 10 minuti, niente impegno."

Messaggio tipo WhatsApp:
> "Ciao [nome], sono [nome tuo] di CORE. - agenzia digitale locale. Ho visto [attivita'] su Maps e non ha ancora un sito. Lavoriamo con piccole attivita' come la sua per farlo senza pensieri. Posso mandarle due righe di come funziona?"

Regole G0:
- NON mandare listino prezzi
- NON usare il termine "pacchetto"
- NON chiedere "e' interessato?" come prima domanda
- SEMPRE riferimento alla specifica attivita' (niente messaggi generici)

---

**G3 - Follow-up 1**

Canale: stesso del G0, oppure canale diverso se nessuna risposta.

Obiettivo: ricordare la propria esistenza senza pressione.

Messaggio tipo:
> "Ciao [nome], ti scrivo di nuovo velocemente. Non voglio disturbare - solo curiosita': hai avuto modo di pensarci? Se vuoi, 10 minuti al telefono e le spiego come lavoriamo. Se non e' il momento giusto, nessun problema."

Note:
- Se al G0 ha risposto ma non ha fissato nulla -> proponi data e orario specifici ("libero giovedi' alle 11?")
- Se al G0 non ha risposto affatto -> cambia canale (es. da email a telefono)

---

**G7 - Follow-up 2**

Canale: preferibilmente telefono se non ancora parlato.

Obiettivo: proposta di incontro concreto o call con agenda definita.

Messaggio tipo:
> "Ciao [nome], ultimo tentativo prima di chiudere. Se ti va, facciamo una chiamata di 15 minuti questa settimana - ti mostro un paio di esempi di attivita' simili alla tua e ti spiego il costo esatto. Se non e' il momento, rispondo anche solo con 'no grazie' e ti lascio in pace."

Note:
- Offri un'alternativa binaria: si/no. Abbassa la frizione
- Se ha risposto positivamente ai follow-up precedenti ma non ha ancora fissato: manda un link Calendly o proponi tu un orario fisso

---

**G14 - Follow-up 3 (ultimo)**

Canale: email o messaggio scritto (lascia traccia).

Obiettivo: chiusura definitiva del ciclo. Non cedere alla tentazione di un quarto tentativo.

Messaggio tipo:
> "Ciao [nome], e' l'ultimo messaggio che ti mando su questo. Ho capito che probabilmente non e' il momento giusto - nessun problema. Se in futuro vuoi fare due chiacchiere sul digitale, so dove trovarmi. Buon lavoro."

Note:
- Il tono distaccato funziona: molti rispondono proprio all'ultimo messaggio
- Archivia il lead con stato "FREDDO - G14" e data
- Rivaluta tra 3-6 mesi (le situazioni cambiano)

---

**Gestione risposte positive - Da call a chiusura**

```
Call conoscitiva (30 min)
  -> Demo breve del servizio Crescita Completa
  -> Domanda chiave: "Ha gia' un sito fatto da qualcuno?"
       Si -> Scenario D (vedi sezione 8)
       No -> Proposta diretta Crescita Completa
  -> Invio proposta scritta entro 24 ore dalla call
  -> Follow-up proposta dopo 3 giorni
  -> Chiusura o archivio dopo 7 giorni dalla proposta
```

---

## 6. KPI e Volumi Attesi

### Funnel tipo (mensile, operatore singolo)

| Fase | Volume | Tasso conversione |
|------|--------|------------------|
| Lead lordi raccolti (da PG + Maps + CCIAA) | 80-120 | - |
| Lead qualificati (verifica web 5 min) | 40-60 | 50% dei lordi |
| Lead classificati HOT o CALDO | 20-30 | 50% dei qualificati |
| Lead contattati (almeno tentativo G0) | 15-25 | 75% degli HOT/CALDO |
| Risposte ricevute (qualsiasi) | 5-10 | 30-40% dei contattati |
| Call conoscitive fissate | 3-6 | 50-60% delle risposte |
| Proposte inviate | 2-4 | 60-80% delle call |
| Clienti acquisiti | 1-2 | 30-50% delle proposte |

**Obiettivi per fase di maturita' dell'agenzia**

| Mese | Lead lordi | Clienti target | Ricavo atteso |
|------|-----------|----------------|---------------|
| 1 | 80 | 1 | EUR 121/mese (avvio Crescita Completa) |
| 2 | 100 | 1-2 | EUR 242-363/mese |
| 3 | 120 | 2-3 | EUR 363-484/mese |
| 6 | 150 | 5-8 (cumulativo) | EUR 605-968/mese |
| 12 | 150 | 10-15 (cumulativo) | EUR 1.210-1.815/mese |

*I ricavi mese-12 non includono upsell (social standalone, upgrade piano) ne' siti una tantum.*

**Tassi di conversione per canale G0**

| Canale | Tasso risposta atteso | Note |
|--------|----------------------|------|
| Telefono | 60-70% | Migliore tasso assoluto |
| WhatsApp | 40-55% | Dipende dalla familiarita' col numero |
| IG DM | 10-20% | Basso ma low effort |
| Email | 5-15% | Utile solo come backup |

**Segnali di pipeline sana**
- Rapporto lead lordi/clienti < 100:1 -> efficienza prospecting buona
- Rapporto call/proposta > 60% -> qualificazione pre-call funziona
- Churn mese 1-3 < 20% -> il prodotto soddisfa le aspettative

---

## 7. Strumenti Consigliati

| Strumento | Scopo | Costo |
|-----------|-------|-------|
| Google Sheets | Foglio tracking lead (schede, stati, date) | Gratuito |
| Google Maps | Ricerca attivita', lettura scheda GMB | Gratuito |
| PagineGialle.it | Lista attivita' per categoria e zona | Gratuito |
| Registro Imprese (CCIAA) | Verifica ragione sociale, ATECO, anno iscrizione | Gratuito (ricerche base) |
| BuiltWith.com | Identificare la piattaforma del sito (WordPress, Wix, ecc.) | Gratuito (estensione browser) |
| Wappalyzer | Fingerprint tecnologico del sito (CMS, plugin, analytics) | Gratuito (estensione browser) |
| Google PageSpeed Insights | Velocita' e mobile-friendliness del sito | Gratuito |
| GTmetrix | Analisi tecnica sito (alternativa PageSpeed) | Gratuito (piano base) |
| WhatsApp Web | Invio messaggi follow-up | Gratuito |
| Calendly | Link per fissare call senza avanti-indietro | Gratuito (piano base) |
| Notion o Google Docs | Template proposte da inviare post-call | Gratuito |
| ATECO Explorer (InfoCamere) | Trovare codice ATECO esatto per ricerche CCIAA | Gratuito |
| Instagram (browser) | Verifica profilo IG senza account | Gratuito |
| Chrome DevTools (F12) | Simulare mobile su qualsiasi sito | Gratuito (built-in) |

**Strumenti da aggiungere in fase scale (mese 3+)**

| Strumento | Scopo | Costo |
|-----------|-------|-------|
| Telemaco (InfoCamere) | Liste imprese massive per ATECO e zona | ~EUR 50-100/anno |
| Hunter.io | Trovare email aziendali | Gratuito (25 ricerche/mese), EUR 49/mese pro |
| Apollo.io | Prospecting + email outreach | Gratuito (piano base limitato) |

---

## 8. Scenario D - Flag Automatico: Sito di Terzi

### Definizione

**Scenario D** si attiva quando, durante la verifica web (Step 2 della sezione 3), si identifica che il lead ha GIA' un sito realizzato da un'altra agenzia o freelance.

Regola ferrea CORE.: la manutenzione si offre SOLO per siti realizzati da CORE. Non gestiamo siti di terzi.

### Come identificarlo durante il prospecting

**Segnali diretti**
- L'URL del sito e' attivo e carica correttamente
- Il source del sito (CTRL+U) mostra un CMS o piattaforma attiva (WordPress recente, Webflow, Squarespace)
- C'e' un footer con "Realizzato da [altra agenzia]" o "Powered by [tool]"
- La qualita' del sito e' 3-4/5 (decente, non ottimo): aggiornato ma non eccellente

**Segnali indiretti**
- Il dominio e' registrato intestato a un'altra societa' (verificabile su `who.is` o `registrodomini.it`)
- La scheda GMB linka un sito funzionante
- Su LinkedIn o Facebook dell'attivita' c'e' menzione di una precedente collaborazione digitale

### Procedura da seguire

```
Lead identificato -> Step 2 -> Sito presente e funzionante di terzi
              |
              v
         FLAG SCENARIO D nella scheda lead
              |
              v
     NON offrire manutenzione CORE.
              |
              v
   Valuta: il sito e' davvero buono?
       |                    |
      SI                   NO (datato, non mobile, lento)
       |                    |
  ARCHIVIA              Contatta con proposta MIGRAZIONE GRATUITA
  (non serve nulla)
```

**Script migrazione gratuita**

Quando il sito c'e' ma e' obsoleto (voto 2-3/5):

> "Ciao [nome], ho visto il vostro sito - e' presente ma non e' ottimizzato per mobile e ha qualche anno. Offriamo una valutazione gratuita della migrazione: in 20 minuti vi diciamo esattamente cosa si perde e cosa si guadagna portandolo su una piattaforma nuova. Nessun impegno. Interessati?"

Se accettano la valutazione gratuita:
1. Analisi sito esistente (tecnologia, contenuti, SEO base)
2. Proposta di refactoring o rifacimento completo
3. Se accettano il rifacimento -> diventano clienti CORE. -> da quel momento si applica la manutenzione standard

**Cosa NON fare in Scenario D**
- NON proporre manutenzione su sito di terzi in nessun caso
- NON dire "gestiamo qualsiasi sito" per chiudere la vendita
- NON fare finta di non aver visto che il sito esiste gia'

### Tracking Scenario D nel foglio lead

Aggiungi una colonna "Scenario D" con valori:
- `NO` - nessun sito di terzi
- `D-ARCHIVIA` - sito buono, non serve nulla
- `D-MIGRAZIONE` - sito obsoleto, proposta migrazione inviata
- `D-CLIENTE` - migrazione accettata, cliente acquisito

---

*Documento operativo CORE. - Aggiornato 2026-06-18*
*Uso interno - Non distribuire*
