# Nuxt CLI Skills Demo

Demo repo for the Nuxt CLI `module skills` feature, following the same “copy‑paste demo script” format used in the Nuxt doctor PR.

## Demo

```bash
PROJECT=/tmp/MiniBank
NUXI_PKG_PR_URL="https://pkg.pr.new/nuxi@1201?cachebust=1"
BETTER_AUTH_PKG_PR_URL="https://pkg.pr.new/onmax/nuxt-better-auth/@onmax/nuxt-better-auth@89"

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
```
