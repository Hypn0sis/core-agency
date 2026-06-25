---
title: "COREFLUX STUDIO Pricing Strategy - V2"
part_of: "[[05 - Reference]]"
created: Tuesday 17th June 2026 11:00
updated: Wednesday 18th June 2026 09:00
use_for: 💰 Working notes on COREFLUX STUDIO pricing strategy, bundle logic, social packaging
creating: 💰 Pricing brainstorm and decision workspace
obsidianUIMode: preview
obsidianEditingMode: live
tags:
  - path/root
  - area/sales
  - area/marketing
  - type/reference
  - project/core-agency
status: in-progress
version: v2
---

# COREFLUX STUDIO Pricing Strategy - V2

> V2 - incorpora note utente da V1. Decisioni bloccate segnate LOCKED. Aperto solo ciò che serve ancora.

---

## Nota fondamentale: struttura dei costi

I costi di produzione (sito + manutenzione mensile) sono quasi azzerati dal lavoro degli agent. Costo reale per progetto: €50-100 in tooling/hosting/supervisione, non €600-800.

**Implicazioni:**
- Il pricing è VALUE-DRIVEN, non cost-plus. Margine reale: 85-95%+.
- Il "sito incluso" (Scenario F) è quasi free per noi → vale pienamente come leva di acquisizione.
- I discount threshold del 25% non sono un vincolo di margine - sono un vincolo di **perceived value** (non svalutare il servizio agli occhi del cliente).
- Non mostrare mai questo externally. Narrativa pubblica: team specializzato + procedure automatizzate = efficienza che trasmettiamo al cliente.

---

## Base Prices (standalone)

### Sito + Manutenzione

| Product | Monthly | Annual |
|---|---|---|
| Sito web | €750 | - |
| Custodia | €30/mo | €360 |
| Cura | €59/mo | €708 |
| Crescita | €89/mo | €1.068 |

### Social

| Package | Monthly (no commitment) | 6 mesi | Annual |
|---|---|---|---|
| Social Starter | €89/mo | €399 (€66/mo) | €749 (€62/mo) |
| Social Pro | €249/mo | - | €2.500 (€208/mo) |
| Social Elite | €349/mo | - | €3.600 (€300/mo) |

**Regola 6 mesi - LOCKED:**
- Social Starter: opzione 6 mesi disponibile (€399). Riduce frizione all'ingresso per chi non vuole committarsi annualmente.
- Social Pro / Elite: solo mensile o annuale. Nessuna opzione 6 mesi.
  - Perché: il buyer di Pro/Elite ha esigenze precise. O vuole budget annuale certo (→ annuale) o flessibilità totale (→ mensile). Il 6 mesi non serve nessun profilo reale: è il gap che nessuno chiede. Aggiungerlo crea confusione senza incrementare conversioni.

**Social Elite - LOCKED (anchor, non prodotto di massa):**
- Prezzo: €3.600/anno (€300/mo). Abbassato da €5.000.
- CTA sul pricing page: "Su preventivo" - nessun checkout diretto.
- Funzione: ancora psicologica. Rende Social Pro (€208/mo) ragionevole a confronto.
- Clienti target: e-commerce, hospitality, moda a scala. Non SMB standard.
- Non pushare attivamente finché non c'è pipeline a questo livello.

---

## Scenario A - Sito only (€750)

Client paga €750. Riceve sito, nessun ricorrente. Pulito.

- Pagamento: 50% all'ordine / 50% al go-live
- Hook upsell: menzionare Try&Buy social disponibile nei piani Cura/Crescita

**LOCKED** - nessuna modifica.

---

## Scenario B - Sito + Manutenzione (pay as you go, no commitment)

Non è un prodotto distinto - è la somma dei componenti senza bundle. Non ha una sezione dedicata sul pricing page.

| Tier | Sito | Manutenzione | Totale Anno 1 | Anno 2+ |
|---|---|---|---|---|
| B1 Custodia | €750 | €30/mo | €1.110 | €360 |
| B2 Cura | €750 | €59/mo | €1.458 | €708 |
| B3 Crescita | €750 | €89/mo | €1.818 | €1.068 |

B2/B3 includono Try&Buy social (3 mesi limitati, solo hook).

**LOCKED** - documentato per completezza interna.

---

## Scenario C - Bundle annuale: sito + manutenzione (prepagato)

**LOCKED - 25% upfront / 18% due rate.**

| Bundle | Valore standalone | Upfront unico (25% off) | 2 rate (18% off) |
|---|---|---|---|
| Starter Online (sito+Custodia 12mo) | €1.110 | **€849** | **€899** |
| Business Online (sito+Cura 12mo) | €1.458 | **€1.099** | **€1.199** |
| Premium Online (sito+Crescita 12mo) | €1.818 | **€1.349** | **€1.499** |

Regole pagamento:
- Upfront unico: una fattura alla firma
- 2 rate: 50% alla firma + 50% al mese 6
- Pagamento mensile: NON disponibile sui bundle annuali

Gap 7% tra le due opzioni è intenzionale: crea incentivo reale a pagare upfront senza essere cosmético.

---

## Scenario D - Manutenzione only (client con sito esterno)

**LOCKED.**

- NO Custodia/Cura/Crescita standalone a chi ha già un sito altrove.
- Alternativa: **form di valutazione migrazione gratuita** - valutiamo il setup attuale e stimiamo migrazione.
- Esito: o migra (diventa cliente Scenario C) o decliniamo.
- Protegge dal worst-case: cliente che usa Custodia €30/mo per edit sporadici poi abbandona dopo 3 mesi senza asset creation da parte nostra.

---

## Scenario E - Social only (client già ha sito + manutenzione)

| Package | Mensile | 6 mesi | Annuale | Equiv. mensile |
|---|---|---|---|---|
| Social Starter | €89/mo | €399 | €749 | €62/mo |
| Social Pro | €249/mo | - | €2.500 | €208/mo |
| Social Elite | €349/mo | - | €3.600 | €300/mo |

Risparmio annuale vs mensile:
- Starter: -30% (€89 → €62)
- Pro: -17% (€249 → €208)
- Elite: -14% (€349 → €300)

---

## Scenario F - Bundle completo: sito + manutenzione + social

### Struttura tier - DECISIONE V2

**NON coupling rigido** (1-1, 2-2, 3-3). Ragione: il salto Tier1→Tier2 con coupling stretto va da €131/mo a €280/mo = +114%. Troppo ripido come decoy, blocca il funnel di ingresso.

**Struttura adottata:**
- Prodotto ENTRY (hero): **Cura + Social Starter** = €121/mo — accessibile, completo, leva principale
- Prodotto PRO (upsell): **Cura + Social Pro** = upgrade social quando il cliente è pronto
- Tier coupling Tier3 mantenuto: **Crescita + Social Elite** = su preventivo, non self-serve

**Percorso cliente**: entra con Crescita Completa → dopo 6-12 mesi viene offerto upgrade a Social Pro → massimizza LTV senza forzare un investimento alto al day 1.

Questo approccio segue il framework Jobs-to-be-Done del marketing-strategist: il cliente entry vuole "comparire online e avere qualcuno che gestisca i social" — non "dominare il proprio settore con social full-service". Il full-service arriva dopo che si fida.

### "Sito incluso" — offerta hero

**Premessa**: chi si impegna 12 mesi su Cura + Social Starter riceve il sito (€750) incluso.

| | Annuale (sito gratis) | Mensile equiv | vs standalone |
|---|---|---|---|
| Cura 12mo + Social Starter 12mo | **€1.457** | **€121/mo** | €2.207 (risparmio €750) |

**Opzioni pagamento:**
- Mensile: €121/mo (ingresso più accessibile)
- Upfront annuale: €1.457 - 15% = **€1.238** (risparmio €219)
- 2 rate: €1.457 - 10% = **€1.311** (50% firma + 50% mese 6)

**Clausola di protezione - LOCKED:**
"Sito incluso per chi si impegna per almeno 12 mesi. Recesso entro i primi 12 mesi: €500 forfettario a rimborso costi sito. Dopo i 12 mesi: libero di disdire in qualsiasi momento, senza penali. Il sito rimarrà per sempre tuo."

> Nota: "il sito rimarrà per sempre tuo" va scritto esplicitamente in ogni comunicazione che tocca la clausola (pricing page, preventivo, onboarding). Controclausa chiave: la penale copre il costo di produzione, non la proprietà del sito. Il cliente non perde mai il sito.

### Lineup prodotti Scenario F - RISTRUTTURATO

**Problema rilevato**: se "Avvio Completo" include il sito, il "sito incluso" non è esclusivo di Crescita Completa. Il decoy perde senso e la differenza di €30/mo non è giustificata narrativamente.

**Fix**: "sito incluso" solo da Crescita Completa in su. Avvio Completo = prodotto per chi ha già un sito (Custodia + Social, nessun sito).

#### Per nuovi clienti (nessun sito):

| Bundle | Incluso | Mensile | Upfront annuale |
|---|---|---|---|
| **Crescita Completa** ⭐ | **Sito INCLUSO + Cura + Social Starter** | **€121/mo** | **€1.238** |
| Dominio Locale | Sito INCLUSO + Crescita + Social Starter | €151/mo | **€1.549** |

Hero badge su Crescita Completa. Dominio Locale = premium anchor (+€30/mo per tier superiore su entrambi i servizi).

#### Per clienti con sito già realizzato da COREFLUX STUDIO:

| Bundle | Incluso | Mensile | Upfront annuale |
|---|---|---|---|
| Avvio Completo | Custodia + Social Starter | €92/mo | **€984** |

> Target specifico: chi ha comprato solo il sito (Scenario A, €750 pagato) e ora vuole attivare manutenzione + social. NON per chi ha un sito fatto altrove (Scenario D - solo migration form). Sul pricing page: sezione separata o upsell post-acquisto sito, non nel confronto principale con Crescita Completa.

Hero badge su Crescita Completa.

### Upsell Social Pro (post-entry, non sul pricing page)

| Bundle | Incluso | Mensile | Annuale |
|---|---|---|---|
| Crescita Pro | Cura + Social Pro (senza sito, già incluso) | €280/mo | **€3.208** |

Proposto al cliente al mese 6-9, quando il valore del social è già dimostrato.

### LTV comparison

| Offerta | Anno 1 | Anno 2 (rinnovo) | LTV 2 anni |
|---|---|---|---|
| Business Online (upfront) - no social | €1.099 | €708 | **€1.807** |
| Crescita Completa (upfront) + rinnovo | €1.238 | €1.457 | **€2.695** |
| Crescita Completa → upgrade Social Pro yr2 | €1.238 | €3.208 | **€4.446** |

Best path: entry con Crescita Completa, upgrade Social Pro anno 2 = LTV €4.446 vs €1.807 di solo Business Online.

---

## Funnel: quale offerta vogliamo spingere?

**LOCKED - questa logica è corretta.**

1. **Anchor**: prezzi standalone (sito €750, social starter €749) → il cliente capisce il valore totale
2. **Hero**: Crescita Completa (€121/mo) → badge, CTA principale, "sito incluso per sempre tuo"
3. **Premium anchor**: Dominio Locale (€151/mo) → rende Crescita ragionevole (+€30/mo per tier completo)
4. **Branch separato**: Avvio Completo (€92/mo) per chi ha già un sito → non compete col funnel principale, non dilui il "sito incluso"

L'occhio del nuovo cliente finisce su Crescita Completa e pensa: "€121/mo per sito + manutenzione + social? Il solo sito è €750. E il sito rimane mio."

> Decoy rimosso: Avvio Completo non è più nel confronto diretto con Crescita Completa. Decoy ora = confronto implicito con acquisto standalone (sito €750 + Cura €708 + Social €749 = €2.207 vs €1.457).

---

## Decisioni consolidate

| # | Questione | Stato | Note V2 |
|---|---|---|---|
| 1 | Scenario C: 25% upfront / 18% due rate | **LOCKED** | Math validata, gap 7% intenzionale |
| 2 | Scenario D: no Custodia standalone, solo migration form | **LOCKED** | Protegge da churn low-value |
| 3 | Social Elite: €3.600/anno, CTA "Su preventivo" | **LOCKED** | Anchor psicologico, non self-serve |
| 4 | Scenario F "sito incluso" come hero | **LOCKED** | Best 2yr LTV |
| 5 | Social 6mo: solo Starter, non Pro/Elite | **LOCKED** | Pro/Elite: annual o monthly, nessun persona 6mo |
| 6 | Clausola protezione €500 su "sito incluso" | **LOCKED** | Obbligatoria |
| 7 | Try&Buy solo in B2/B3 (no su social bundle) | **LOCKED** | Nel social bundle è già il servizio |
| 8 | Scenario F: NO tier coupling rigido | **LOCKED** | Salto Tier1→Tier2 +114%, blocca funnel |
| 10 | Avvio Completo: NO sito incluso, solo Custodia+Social | **LOCKED** | Target: ex Scenario A (sito COREFLUX STUDIO già pagato). Non per siti esterni (Scenario D). |
| 11 | "Il sito rimarrà per sempre tuo" in ogni comunicazione | **LOCKED** | Controclausa penale: proprietà non dipende da pagamento |
| 9 | Dominio COREFLUX STUDIO | **DEFERRED** | .md non disponibile, ricercare alternative |

---

## Da implementare su pricing.html

- [x] Scenario C: aggiorna bundle prices con tabella 25%/18% (€849/€899, €1.099/€1.199, €1.349/€1.499)
- [x] Scenario C: aggiungi nota pagamento (upfront vs 2 rate, no mensile su bundle)
- [x] Scenario D: migration CTA implementata — "Hai gia' un sito?" card sotto manutenzione (commit a32f1eb)
- [x] Scenario E: prezzi mensili aggiunti (€89/€249/€349 senza impegno); fix Pro 6m rimosso (commit a32f1eb)
- [x] Scenario E: Social Elite → aggiornato a €3.600/anno + CTA "Richiedi preventivo"
- [x] Scenario F: sezione "Crescita Completa" hero con badge "Prodotto piu' scelto"
- [x] Scenario F: clausola protezione + "sito rimarra' per sempre tuo" + anno 2 €109/mese
- [x] Scenario F: Avvio Completo (ex-Scenario A only) + Dominio Locale (premium anchor)
- [x] Funnel: nav link rosso "Crescita Completa" tra Social e Bundle
- [x] Funnel: anchor prezzi standalone prima della sezione bundle (commit c2ffc36)

**Implementato**: 2026-06-17 — pricing.html V2 deployed su GitHub Pages + VPS. Commit: 27b11af + c2ffc36.

---

## Scenario D — Migration CTA (pending council review)

> Soul expert review completata (marketing-copywriter + sales-negotiator). Pronto per council.

### Decisione di framing — PROPOSTA

Non è un "no secco" ne una porta aperta. Frame: **protezione della qualita'**, non rifiuto.

> "Non gestiamo siti costruiti da terzi: non potremmo garantirti lo stesso standard che mettiamo in ogni nostro progetto. Se sei aperto a valutare un trasferimento, raccontaci la tua situazione — la valutazione e' gratuita, senza impegno, e ti diremo onestamente se ha senso."

### Copy sezione (marketing-copywriter)

**Headline**: Hai gia' un sito. Valutiamo se possiamo lavorare insieme.

**Sub-copy**: Non gestiamo siti costruiti altrove. Prima di qualsiasi accordo, analizziamo gratuitamente la tua situazione: struttura attuale, storico, obiettivi. Se una migrazione ha senso, ti proponiamo Crescita Completa a €121/mese — sito incluso. Se non ha senso, te lo diciamo.

**Campi form (4)**:
1. URL del sito attuale
2. Dove e' ospitato (Wix, altra agenzia, ecc.)
3. A cosa ti serve il sito oggi? (testo libero, max 200 caratteri) — campo chiave per disqualificare chi non e' pronto
4. Numero di telefono

**CTA button**: Richiedi valutazione gratuita

**Disclaimer**: Questo modulo non e' un preventivo. Non offriamo assistenza su siti di terzi: se la migrazione non e' fattibile, non iniziamo il lavoro.

### Red flag per auto-qualificazione (sales-negotiator)

Lead NON convertibile se nel form si legge:
- "ho solo bisogno di aggiornare i plugin / sistemare cose piccole"
- Nessuna risposta su cosa serve il sito per il business
- Prima domanda e' il prezzo, non il problema
- Piu' fornitori gia' elencati (switcher cronico)
- "ASAP" senza budget
- CMS legacy pesante (Joomla, PHP custom) → costo migrazione supera soglia conversione

### Cosa NON promettere

- Nessuna manutenzione o fix sul sito attuale
- L'output e' go/no-go per lavorare con COREFLUX STUDIO, non un report tecnico che il cliente porta altrove
- La migrazione non e' garantita come raccomandazione
- Non esiste un prezzo di manutenzione standalone: se non sono aperti alla migrazione, la conversazione non serve

### Dove va sul pricing page

Sotto la sezione manutenzione (dopo Custodia/Cura/Crescita), come card separata "Hai gia' un sito?". Non nella sezione bundle, non nel footer.

### Council review: APPROVATO (2026-06-17)

Consensus 5/5: protezione della qualita' e' il framing corretto. LTV math valida (20% conversion rate = migration supera Custodia standalone). SLA risposta nella conferma email, non sul pricing page. Copy implementato su pricing.html, commit a32f1eb.

---

```dataviewjs
const file = dv.current();
const stat = await app.vault.adapter.stat(file.file.path);
const lastModified = dv.luxon.DateTime
    .fromMillis(stat.mtime)
    .toFormat("EEEE dd MMMM yyyy • HH:mm");
dv.paragraph(`Last modified: ${lastModified}`);
```
