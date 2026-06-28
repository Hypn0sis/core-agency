#!/usr/bin/env python3
"""Mark a lead's status in the CSV after pipeline completes.
Usage: python3 mark-lead.py --lead-id <num> [--status CONTATTATO]"""
import csv, json, os, shutil, sys
from datetime import date

CSV_PATH = os.path.expanduser('~/wingman/pipeline-lead-bergamo.csv')

def main():
    lead_num = status = None
    if '--lead-id' in sys.argv:
        lead_num = sys.argv[sys.argv.index('--lead-id') + 1]
    if '--status' in sys.argv:
        status = sys.argv[sys.argv.index('--status') + 1]
    else:
        status = 'CONTATTATO'

    if not lead_num:
        print('Error: --lead-id required', file=sys.stderr); sys.exit(1)

    rows = []
    fieldnames = None
    updated = False
    with open(CSV_PATH, newline='', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        fieldnames = [fn for fn in reader.fieldnames if fn is not None]
        for row in reader:
            clean = {k: v for k, v in row.items() if k is not None}
            if clean.get('#', '').strip() == str(lead_num):
                clean['Stato'] = status
                if not clean.get('Data 1 Contatto', '').strip():
                    clean['Data 1 Contatto'] = date.today().strftime('%d/%m/%Y')
                updated = True
            rows.append(clean)

    if not updated:
        print(f'Error: lead #{lead_num} not found', file=sys.stderr); sys.exit(1)

    tmp = CSV_PATH + '.tmp'
    with open(tmp, 'w', newline='', encoding='utf-8') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames, extrasaction='ignore')
        writer.writeheader()
        writer.writerows(rows)
    shutil.move(tmp, CSV_PATH)
    print(json.dumps({'lead_num': lead_num, 'nuovo_stato': status, 'data': date.today().isoformat()}))

if __name__ == '__main__': main()
