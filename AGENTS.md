# Wingman — Team degli Agenti

Architettura multi-board con Wingman come autorità suprema.
47 agent markdown (4 dispatcher + 4 curator + 4 summarizer + 35 atomici) + Wingman + client-dispatcher (varia) — assunti dai migliori repo pubblici.

## Struttura

```
wingman/
├── AGENTS.md              ← questo file (indice generale)
├── wingman.md             ← Wingman (comandante supremo, unico interlocutore)
├── clients/
│   └── dispatcher.md      ← Client Dispatcher (ingresso clienti, dispatch ai board)
└── boards/
    ├── sviluppo/          ← 12 markdown (dispatcher + curator + summarizer + 9 atomici)
    ├── marketing/         ← 12 markdown (dispatcher + curator + summarizer + 9 atomici)
    ├── admin/             ← 10 markdown (dispatcher + curator + summarizer + 7 atomici)
    └── sales/             ← 13 markdown (dispatcher + curator + summarizer + 10 atomici)
```

## Legenda ruoli per board

Ogni board ha:
- **Dispatcher** — smista richieste all'agente atomico giusto
- **Curator** — revisiona qualità, mantiene documentazione, ordine repository
- **Summarizer** — riassume attività del board per Wingman e altri board
- **Agenti atomici** — uno per funzione, tecnologia-agnostici

## Board SVILUPPO (12 agenti)

| Agente | Ruolo | Ispirato da |
|--------|-------|-------------|
| dispatcher | Routing richieste | awesome-claude-code-subagents |
| curator | Qualità codice + docs + repo hygiene | ECC react-reviewer framework |
| summarizer | Riepilogo attività | custom |
| architect | Architettura sistema, ADR, dependency graph | awesome-claude-code-toolkit (frontend-architect) |
| builder | Implementazione feature | awesome-claude-code-toolkit (developer) |
| reviewer | Code review, bug detection, security | ECC (react-reviewer, multi-reviewers) |
| tester | Test strategy, unit, integration, e2e | VoltAgent subagents pattern |
| integrator | API third-party, webhooks, middleware | awesome-claude-code-toolkit |
| optimizer | Performance audit, caching, bundle | awesome-claude-code-toolkit |
| data-modeler | Schema, types, data flow, state | custom |
| docs-writer | API docs, setup guide, changelog | awesome-claude-code-toolkit (technical-writer) |
| ops | CI/CD, build, deploy, infra | awesome-claude-code-toolkit + ECC |

## Board MARKETING (12 agenti)

| Agente | Ruolo | Ispirato da |
|--------|-------|-------------|
| dispatcher | Routing richieste | custom |
| curator | Qualità contenuti + docs + repo hygiene | custom |
| summarizer | Riepilogo attività | custom |
| strategist | Posizionamento, audience, piano editoriale | awesome-claude-code-toolkit (content-strategist) |
| copywriter | Testi per post, email, landing page, ads | ECC (marketing-agent) |
| visual-creator | Immagini, video, grafiche | custom |
| publisher | Pubblicazione e scheduling contenuti | custom |
| scheduler | Calendario editoriale, timing | custom |
| analyst-marketing | Metriche, KPI, engagement, ROI | awesome-claude-code-toolkit (marketing-analyst) |
| seo-specialist | Keyword research, on-page, structured data | awesome-claude-code-toolkit + VoltAgent |
| community-manager | Gestione interazioni social | VoltAgent subagents pattern |
| docs-writer | Tone of voice, playbook, strategie | awesome-claude-code-toolkit (technical-writer) |

## Board ADMIN (10 agenti)

| Agente | Ruolo | Ispirato da |
|--------|-------|-------------|
| dispatcher | Routing richieste | custom |
| curator | Qualità processi + docs + repo hygiene | custom |
| summarizer | Riepilogo attività | custom |
| compliance-check | Privacy, TOS, licenze, normative | awesome-claude-code-toolkit (legal-advisor) |
| billing-officer | Fatturazione, pagamenti, abbonamenti | custom |
| contract-manager | Redazione, archiviazione, tracking contratti | custom |
| asset-keeper | Credenziali, domini, licenze, SaaS | custom |
| onboarder | Presa in carico nuovi clienti | awesome-claude-code-toolkit (customer-success) |
| reporter | Report finanziari, KPI business | custom |
| docs-writer | Procedure, policy, template | awesome-claude-code-toolkit (technical-writer) |

## Board SALES (13 agenti)

| Agente | Ruolo | Ispirato da |
|--------|-------|-------------|
| dispatcher | Routing richieste | custom |
| curator | Qualità proposte + docs + repo hygiene | custom |
| summarizer | Riepilogo attività | custom |
| prospector | Lead generation, qualifica BANT, outreach | custom |
| competitor-analyst | Monitoraggio competitor, battle cards | VoltAgent + awesome-claude-code-toolkit |
| negotiator | Trattativa, obiezioni, counter-offer | custom |
| pricing-manager | Scontistica, pacchetti, revenue optimization | custom |
| proposal-writer | Preventivi, proposte, pitch deck | awesome-claude-code-toolkit (sales-engineer) |
| crm-keeper | Pipeline, data quality, follow-up | awesome-claude-code-toolkit (customer-success) |
| revenue-tracker | MRR/ARR, forecast, trend | custom |
| collections-agent | Solleciti, morosi, piani di rientro | custom |
| account-manager | Post-vendita, retention, upsell, QBR | awesome-claude-code-toolkit (customer-success) |
| docs-writer | Playbook, script, battle cards, pricing history | awesome-claude-code-toolkit (technical-writer) |

## Formato agenti

Ogni agente usa YAML frontmatter + markdown, formato compatibile con Claude Code, Codex CLI e Hermes:
```yaml
---
name: architect
description: Definisce architettura del sistema, struttura del progetto, dependency graph
board: sviluppo
type: atomic
model: opus
tools: [Read, Write, Edit, Bash, Glob, Grep]
---
```

## Repo di riferimento

| Repo | Stelle | Agenti | Cosa abbiamo preso |
|------|--------|--------|--------------------|
| rohitg00/awesome-claude-code-toolkit | 2.1k⭐ | 135 | frontend-architect, marketing, sales pattern, YAML format |
| VoltAgent/awesome-claude-code-subagents | - | 129 | Dispatcher pattern, 14 categories, agent structure |
| affaan-m/ECC | 215k⭐ | 62 | Detailed role definitions, react-reviewer framework |
| x1xhlol/system-prompts | 140k⭐ | 30+ | Reference system prompts structure |
