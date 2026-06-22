#!/usr/bin/env python3
"""Pick best DA CONTATTARE lead from CSV. Creates vault-sales/{lead_id}/profile.md. Outputs JSON."""
import csv, json, os, re, sys

CSV_PATH = os.path.expanduser('~/wingman/pipeline-lead-bergamo.csv')
VAULT_SALES = os.path.expanduser('~/wingman/vault-sales')
PRIO = {'ALTA': 0, 'MEDIA': 1, 'BASSA': 2}

def slugify(s):
    for a, b in [('àáâã','a'),('èéê','e'),('ìí','i'),('òó','o'),('ùú','u')]:
        for c in a: s = s.replace(c, b)
    s = s.lower()
    s = re.sub(r'[^a-z0-9\s-]', '', s)
    s = re.sub(r'[\s_]+', '-', s)
    return re.sub(r'-+', '-', s).strip('-')

def main():
    lead_num = None
    if '--lead-id' in sys.argv:
        lead_num = sys.argv[sys.argv.index('--lead-id') + 1]

    rows = []
    with open(CSV_PATH, newline='', encoding='utf-8') as f:
        for row in csv.DictReader(f):
            rows.append(row)

    # Statuses that mean "already handled" — exclude these
    SKIP = {'CONTATTATO', 'CLIENTE', 'ARCHIVIATO', 'CHIUSO OK', 'CHIUSO KO'}

    if lead_num:
        cands = [r for r in rows if str(r.get('#','')).strip() == lead_num]
    else:
        cands = [r for r in rows
                 if r.get('Stato','').strip().upper() not in SKIP]

    if not cands:
        print(json.dumps({'error': 'no eligible leads'})); sys.exit(1)

    cands.sort(key=lambda r: (PRIO.get(r.get('Priorita','BASSA').strip(), 99),
                               -int(r.get('Voto','0').strip() or 0)))
    lead = cands[0]
    num = lead.get('#','').strip()
    nome = lead.get('Nome Attivita','').strip()
    cat = lead.get('Categoria','').strip()
    indir = lead.get('Indirizzo','').strip()
    citta = next((w for w in ['Bergamo','Cornaredo','Celadina','Colognola','Milano']
                  if w.lower() in indir.lower()), 'Bergamo')
    slug = f'lead-{num}-{slugify(nome)}'
    vault_dir = os.path.join(VAULT_SALES, slug)
    os.makedirs(vault_dir, exist_ok=True)

    profile = f"""# Lead Profile — {nome}
lead_id: {slug}
numero: {num}
nome: {nome}
categoria: {cat}
citta: {citta}
indirizzo: {indir}
telefono: {lead.get('Telefono','').strip()}
instagram: {lead.get('Instagram','').strip()}
email: {lead.get('Email','').strip()}
voto: {lead.get('Voto','').strip()}
priorita: {lead.get('Priorita','').strip()}
canale_contatto: {lead.get('Canale Contatto','').strip()}
note: {lead.get('Note','').strip()}
stato: {lead.get('Stato','').strip()}
"""
    with open(os.path.join(vault_dir, 'profile.md'), 'w', encoding='utf-8') as f:
        f.write(profile)

    print(json.dumps({
        'lead_id': slug, 'numero': num, 'nome': nome, 'categoria': cat,
        'citta': citta, 'indirizzo': indir,
        'telefono': lead.get('Telefono','').strip(),
        'instagram': lead.get('Instagram','').strip(),
        'email': lead.get('Email','').strip(),
        'voto': lead.get('Voto','').strip(),
        'slug': slug, 'vault_path': f'vault-sales/{slug}'
    }, ensure_ascii=False, indent=2))

if __name__ == '__main__': main()
