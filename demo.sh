#!/usr/bin/env bash
set -euo pipefail

PROJECT="${PROJECT:-/tmp/MiniBank}"
NUXI_PKG_PR_URL="${NUXI_PKG_PR_URL:-<paste CLI pkg.pr.new URL>}"
BETTER_AUTH_PKG_PR_URL="${BETTER_AUTH_PKG_PR_URL:-https://pkg.pr.new/@onmax/nuxt-better-auth@89}"

if [[ "$NUXI_PKG_PR_URL" == "<paste CLI pkg.pr.new URL>" ]]; then
  echo "Set NUXI_PKG_PR_URL to the pkg.pr.new link from the Nuxt CLI PR CI logs."
  exit 1
fi

rm -rf "$PROJECT"

pnpm dlx nuxi@latest init "$PROJECT" \
  --template minimal \
  --packageManager pnpm \
  --gitInit false \
  --install=false \
  --no-modules

cd "$PROJECT"

pnpm install

pnpm add -D "$NUXI_PKG_PR_URL"

pnpm nuxi module add @nuxt/ui
pnpm nuxi module add @nuxt/icon

pnpm add "$BETTER_AUTH_PKG_PR_URL"
pnpm nuxi module add @onmax/nuxt-better-auth --skipInstall

pnpm nuxi module skills
pnpm nuxi module skills --list || true
