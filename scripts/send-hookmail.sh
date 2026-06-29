#!/bin/bash
# Brevo SMTP wrapper for outreach emails
# Usage: send-hookmail.sh --to EMAIL --subject "..." --nome "..." --tipo "..." --città "..." --nome-attività "..."

set -e

# Parse args
while [[ $# -gt 0 ]]; do
  case $1 in
    --to) EMAIL_TO="$2"; shift 2 ;;
    --subject) EMAIL_SUBJECT="$2"; shift 2 ;;
    --nome) NOME="$2"; shift 2 ;;
    --tipo) TIPO_ATTIVITÀ="$2"; shift 2 ;;
    --città) CITTÀ="$2"; shift 2 ;;
    --nome-attività) NOME_ATTIVITÀ="$2"; shift 2 ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

# Verify required
if [ -z "$EMAIL_TO" ] || [ -z "$EMAIL_SUBJECT" ]; then
  echo "Error: --to and --subject required"
  exit 1
fi

# Export for hookmail_send.py
export EMAIL_TO
export EMAIL_SUBJECT
export NOME
export TIPO_ATTIVITÀ
export CITTÀ
export NOME_ATTIVITÀ

# Export Brevo SMTP creds (set in ~/.hermes/.env or system env)
export BREVO_SMTP_HOST="${BREVO_SMTP_HOST:-smtp-relay.brevo.com}"
export BREVO_SMTP_PORT="${BREVO_SMTP_PORT:-587}"
export BREVO_SMTP_LOGIN="${BREVO_SMTP_LOGIN}"
export BREVO_SMTP_API_KEY="${BREVO_SMTP_API_KEY}"

# Send via Python script
python3 "$(dirname "$0")/hookmail_send.py"
