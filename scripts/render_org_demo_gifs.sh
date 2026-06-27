#!/usr/bin/env bash
# Render 30s README GIFs for all public codegraphtheory repos (non-fork).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PROJECTS=(
  chainforge
  codegraphtheory
  codegraphtheory.github.io
  context-forge-rag
  heavy-coder
  hermes-profile-template
  solana-rug
)
command -v vhs >/dev/null || { echo "brew install vhs ffmpeg" >&2; exit 1; }
for name in "${PROJECTS[@]}"; do
  dir="$ROOT/../$name"
  if [[ ! -f "$dir/demos/vhs/demo-30s.tape" ]]; then
    echo "skip $name (no tape)" >&2
    continue
  fi
  echo "==> $name"
  chmod +x "$dir/demos/vhs/render_demo_gif.sh" 2>/dev/null || true
  (cd "$dir" && ./demos/vhs/render_demo_gif.sh)
done
echo "All demos rendered under each repo's demos/demo.gif"