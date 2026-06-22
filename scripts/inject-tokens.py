#!/usr/bin/env python3
"""Deterministic {{TOKEN}} replacement in HTML template. Outputs remaining tokens as JSON.
Usage: inject-tokens.py <tokens.json> <template.html> <output.html>"""
import json, re, sys

def main():
    if len(sys.argv) < 4:
        print('Usage: inject-tokens.py tokens.json template.html output.html'); sys.exit(1)
    tok_path, tpl_path, out_path = sys.argv[1], sys.argv[2], sys.argv[3]

    with open(tok_path, encoding='utf-8') as f:
        tokens = json.load(f)
    with open(tpl_path, encoding='utf-8') as f:
        html = f.read()

    all_toks = set(re.findall(r'\{\{([A-Z_]+)\}\}', html))
    filled, remaining = [], []

    for tok in all_toks:
        val = tokens.get(tok)
        if val is not None and val != '':
            html = html.replace('{{' + tok + '}}', str(val))
            filled.append(tok)
        else:
            remaining.append(tok)

    with open(out_path, 'w', encoding='utf-8') as f:
        f.write(html)

    print(json.dumps({'filled': sorted(filled), 'remaining': sorted(remaining), 'output': out_path}))

if __name__ == '__main__': main()
