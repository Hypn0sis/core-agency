#!/usr/bin/env python3
"""
Brevo SMTP sender - injects tokens into HTML template + sends via Brevo
"""
import sys
import os
import re
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

def inject_tokens(html_template, tokens):
    """Replace {{TOKEN}} placeholders with values"""
    result = html_template
    for key, value in tokens.items():
        placeholder = f"{{{{{key}}}}}"
        result = result.replace(placeholder, value or "")
    return result

def send_email(to_addr, subject, html_body, from_addr="COREFLUX STUDIO <info@coreflux.studio>"):
    """
    Send HTML email via Brevo SMTP
    Requires: BREVO_SMTP_API_KEY, BREVO_SMTP_HOST, BREVO_SMTP_PORT env vars
    """
    import smtplib
    
    smtp_host = os.environ.get("BREVO_SMTP_HOST", "smtp-relay.brevo.com")
    smtp_port = int(os.environ.get("BREVO_SMTP_PORT", "587"))
    smtp_login = os.environ.get("BREVO_SMTP_LOGIN", "")  # Email or API user
    smtp_key = os.environ.get("BREVO_SMTP_API_KEY", "")
    
    msg = MIMEMultipart("alternative")
    msg["Subject"] = subject
    msg["From"] = from_addr
    msg["To"] = to_addr
    
    # Attach HTML (Brevo prefers HTML, will strip for text-only clients)
    msg.attach(MIMEText(html_body, "html", "utf-8"))
    
    try:
        server = smtplib.SMTP(smtp_host, smtp_port)
        server.starttls()
        server.login(smtp_login, smtp_key)
        server.sendmail(from_addr, [to_addr], msg.as_string())
        server.quit()
        print(f"✓ Email sent to {to_addr}")
        return 0
    except Exception as e:
        print(f"✗ Error: {e}", file=sys.stderr)
        return 1

if __name__ == "__main__":
    # Called from send-hookmail.sh with env vars
    to_email = os.environ.get("EMAIL_TO")
    subject = os.environ.get("EMAIL_SUBJECT")
    
    # Read template
    template_path = os.path.dirname(__file__) + "/hookmail_template.html"
    with open(template_path, 'r') as f:
        template = f.read()
    
    # Inject tokens from env
    tokens = {
        "NOME_ATTIVITÀ": os.environ.get("NOME_ATTIVITÀ", ""),
        "NOME": os.environ.get("NOME", ""),
        "TIPO_ATTIVITÀ": os.environ.get("TIPO_ATTIVITÀ", ""),
        "CITTÀ": os.environ.get("CITTÀ", ""),
    }
    
    html_body = inject_tokens(template, tokens)
    
    # Send
    sys.exit(send_email(to_email, subject, html_body))
