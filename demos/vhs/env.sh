#!/usr/bin/env bash
# Minimal env for VHS helpers (all GraphTheory profile repos).
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
export DEMO_REPO="${DEMO_REPO:-$REPO_ROOT/demos/vhs/staging/repo}"
mkdir -p "$DEMO_REPO/.heavy-coder" 2>/dev/null || true
export PYTHONPATH="$REPO_ROOT/src${PYTHONPATH:+:$PYTHONPATH}"

if [[ "${VHS_RECORDING:-}" != "1" ]]; then
  cd "$REPO_ROOT"
fi

if [[ -z "${PY:-}" ]]; then
  if command -v python3 >/dev/null 2>&1 && python3 -c 'from datetime import UTC' 2>/dev/null; then
    export PY=python3
  elif [[ -x /opt/homebrew/bin/python3 ]]; then
    export PY=/opt/homebrew/bin/python3
  else
    export PY=python3
  fi
fi