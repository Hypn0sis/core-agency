#!/usr/bin/env bash
# deploy-preview.sh — Deploy preview site to GitHub Pages (UC10)
# Usage: deploy-preview.sh <lead_id> [<slug>]
set -euo pipefail

LEAD_ID="${1:?Usage: deploy-preview.sh <lead_id> [slug]}"
SLUG="${2:-$LEAD_ID}"
PREVIEW_DIR="/tmp/preview-${SLUG}"
REPO="Hypn0sis/${SLUG}"
VAULT_DIR="$HOME/wingman/vault-sales/${LEAD_ID}"

if [ ! -f "${PREVIEW_DIR}/index.html" ]; then
    echo "ERROR: ${PREVIEW_DIR}/index.html not found" >&2
    exit 1
fi

echo "Deploying ${SLUG} to GitHub Pages..."

# Create repo if not exists
gh repo create "${REPO}" --public --description "Preview site CORE." 2>/dev/null || true

# Init git and push
cd "${PREVIEW_DIR}"
[ -d .git ] && rm -rf .git
git init -q
git add index.html
git -c user.email="wingman@core.agency" -c user.name="Wingman" \
    commit -q -m "preview"
git branch -M main
git remote add origin "https://github.com/${REPO}.git"
git push -f origin main

# Enable GitHub Pages
gh api "repos/${REPO}/pages" \
    --method POST \
    -f source='{"branch":"main","path":"/"}' 2>/dev/null || \
gh api "repos/${REPO}/pages" \
    --method PUT \
    -f source='{"branch":"main","path":"/"}' 2>/dev/null || true

PREVIEW_URL="https://hypn0sis.github.io/${SLUG}/"
mkdir -p "${VAULT_DIR}"
echo "${PREVIEW_URL}" > "${VAULT_DIR}/preview_url.txt"
echo "Preview live: ${PREVIEW_URL}"
