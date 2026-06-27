#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
command -v vhs >/dev/null || { echo "Install: brew install vhs ffmpeg" >&2; exit 1; }
mkdir -p demos
vhs demos/vhs/demo-30s.tape
ls -la demos/demo.gif