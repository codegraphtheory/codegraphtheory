#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
command -v vhs >/dev/null || { echo "Install: brew install vhs ffmpeg" >&2; exit 1; }
command -v hermes >/dev/null || { echo "Install Hermes CLI" >&2; exit 1; }
command -v expect >/dev/null || { echo "expect required" >&2; exit 1; }
chmod +x demos/vhs/*.sh demos/vhs/bin/*.sh 2>/dev/null || true
mkdir -p demos
export VHS_RECORDING=1
vhs demos/vhs/demo-30s.tape
ls -la demos/demo.gif