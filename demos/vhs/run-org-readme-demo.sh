#!/usr/bin/env bash
# GraphTheory org README demo (not a local profile distribution).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
source demos/vhs/sanitize-recording-env.sh
echo "GraphTheory public repos"
gh api users/codegraphtheory/repos --jq '.[]|select(.fork==false)|.name' 2>/dev/null | head -12
sed -n '1,24p' README.md
hermes profile install github.com/codegraphtheory/hermes-profile-template --name profile-architect --force -y 2>&1 | tail -6