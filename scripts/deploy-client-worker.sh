#!/usr/bin/env bash
# deploy-client-worker.sh
# Deploy static site to Cloudflare Workers + optional custom domain binding.
# Requires: wrangler (npx fallback), CF_TOKEN with Workers:Edit + DNS:Edit.
set -euo pipefail

usage() {
  echo "Usage: $0 --slug SLUG --site-dir DIR [--domain DOMAIN]"
  echo ""
  echo "  --slug      Worker name (e.g. macelleria-bergamaschi)"
  echo "  --site-dir  Path to static site dir (must contain index.html)"
  echo "  --domain    Optional custom domain (e.g. fratelli-bergamaschi.it)"
  echo ""
  echo "Credentials: ~/.hermes/cloudflare.env must export CF_TOKEN and CF_ACCOUNT_ID"
  exit 1
}

SLUG=""
SITE_DIR=""
DOMAIN=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --slug)     SLUG="$2";     shift 2 ;;
    --site-dir) SITE_DIR="$2"; shift 2 ;;
    --domain)   DOMAIN="$2";   shift 2 ;;
    -h|--help)  usage ;;
    *)          echo "Unknown arg: $1"; usage ;;
  esac
done

[[ -z "$SLUG" || -z "$SITE_DIR" ]] && usage

# --- Load credentials ---
CF_ENV="${HOME}/.hermes/cloudflare.env"
if [[ ! -f "$CF_ENV" ]]; then
  echo "ERROR: $CF_ENV not found."
  echo "Create it with: CF_TOKEN=... and CF_ACCOUNT_ID=..."
  echo "CF_TOKEN needs: Workers Scripts:Edit, Workers Routes:Edit, DNS:Edit (for custom domain)"
  exit 1
fi
# shellcheck source=/dev/null
source "$CF_ENV"

: "${CF_TOKEN:?CF_TOKEN not set in $CF_ENV}"
: "${CF_ACCOUNT_ID:?CF_ACCOUNT_ID not set in $CF_ENV}"

export CLOUDFLARE_API_TOKEN="$CF_TOKEN"
export CLOUDFLARE_ACCOUNT_ID="$CF_ACCOUNT_ID"

# --- Validate site dir ---
SITE_DIR="$(cd "$SITE_DIR" && pwd)"
[[ -f "$SITE_DIR/index.html" ]] || { echo "ERROR: index.html not found in $SITE_DIR"; exit 1; }

echo "→ Slug:     $SLUG"
echo "→ Site dir: $SITE_DIR"
[[ -n "$DOMAIN" ]] && echo "→ Domain:   $DOMAIN"
echo ""

# --- Write wrangler.toml ---
COMPAT_DATE="$(date +%Y-%m-%d)"
cat > "$SITE_DIR/wrangler.toml" << TOML
name = "$SLUG"
compatibility_date = "$COMPAT_DATE"
account_id = "$CF_ACCOUNT_ID"

[assets]
directory = "."
TOML

# --- Write .wranglerignore if missing ---
if [[ ! -f "$SITE_DIR/.wranglerignore" ]]; then
  cat > "$SITE_DIR/.wranglerignore" << 'IGNORE'
.git
.wrangler
wrangler.toml
IGNORE
fi

# --- Deploy ---
cd "$SITE_DIR"
if command -v wrangler &>/dev/null; then
  WRANGLER="wrangler"
elif command -v npx &>/dev/null; then
  WRANGLER="npx wrangler"
else
  echo "ERROR: wrangler not found. Install: npm install -g wrangler"
  exit 1
fi

echo "→ Running: $WRANGLER deploy"
$WRANGLER deploy

# Get workers subdomain for preview URL
WORKERS_SUBDOMAIN=$(curl -s "https://api.cloudflare.com/client/v4/accounts/$CF_ACCOUNT_ID/workers/subdomain" \
  -H "Authorization: Bearer $CF_TOKEN" | \
  python3 -c "import sys,json; r=json.load(sys.stdin).get('result',{}); print(r.get('subdomain',''))" 2>/dev/null || true)

if [[ -n "$WORKERS_SUBDOMAIN" ]]; then
  WORKER_URL="https://${SLUG}.${WORKERS_SUBDOMAIN}.workers.dev"
else
  WORKER_URL="https://${SLUG}.workers.dev"
fi
echo ""
echo "→ Worker preview: $WORKER_URL"

# --- Custom domain (optional) ---
if [[ -n "$DOMAIN" ]]; then
  echo ""
  echo "→ Binding custom domain: $DOMAIN"

  # Get zone ID for this domain
  ROOT_DOMAIN="$DOMAIN"
  ZONE_JSON=$(curl -s "https://api.cloudflare.com/client/v4/zones?name=$ROOT_DOMAIN" \
    -H "Authorization: Bearer $CF_TOKEN")
  ZONE_ID=$(python3 -c "import sys,json; r=json.loads('''$ZONE_JSON''').get('result',[]); print(r[0]['id'] if r else '')" 2>/dev/null || true)
  ZONE_STATUS=$(python3 -c "import sys,json; r=json.loads('''$ZONE_JSON''').get('result',[]); print(r[0]['status'] if r else 'not_found')" 2>/dev/null || echo "not_found")

  if [[ -z "$ZONE_ID" || "$ZONE_STATUS" != "active" ]]; then
    echo "WARN: Zone $DOMAIN not found or not active (status=$ZONE_STATUS)."
    echo "  Add custom domain manually once zone is active:"
    echo "  Dashboard: Workers & Pages → $SLUG → Settings → Domains & Routes → Add Custom Domain"
    echo "  Or rerun: $0 --slug $SLUG --site-dir $SITE_DIR --domain $DOMAIN"
  else
    # Bind via Workers Custom Domains API
    BIND_RESULT=$(curl -s -X PUT \
      "https://api.cloudflare.com/client/v4/accounts/$CF_ACCOUNT_ID/workers/domains" \
      -H "Authorization: Bearer $CF_TOKEN" \
      -H "Content-Type: application/json" \
      -d "{\"environment\":\"production\",\"hostname\":\"$DOMAIN\",\"service\":\"$SLUG\",\"zone_id\":\"$ZONE_ID\"}")
    BIND_OK=$(python3 -c "import sys,json; print(json.loads('$BIND_RESULT').get('success','false'))" 2>/dev/null || echo "false")

    if [[ "$BIND_OK" == "True" || "$BIND_OK" == "true" ]]; then
      echo "→ Custom domain bound: https://$DOMAIN"
    else
      echo "WARN: Custom domain binding failed."
      echo "  Response: $BIND_RESULT"
      echo "  Likely cause: CF_TOKEN missing DNS:Edit permission. Recreate token on Cloudflare dashboard."
    fi
  fi
fi

echo ""
echo "Done."
echo "  Worker:  $WORKER_URL"
[[ -n "$DOMAIN" ]] && echo "  Domain:  https://$DOMAIN (may take 1-5 min for SSL)"
