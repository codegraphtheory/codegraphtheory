#!/usr/bin/env bash
# Remove demo media (and optional path replacements) from entire git history.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if ! command -v git-filter-repo >/dev/null 2>&1; then
  echo "Install: python3 -m pip install git-filter-repo" >&2
  exit 1
fi

ORIGIN=""
git remote get-url origin >/dev/null 2>&1 && ORIGIN="$(git remote get-url origin)"

INVERT=()
[[ -e demos/demo.gif ]] && INVERT+=(--path demos/demo.gif)
[[ -d demos/vhs/out ]] && INVERT+=(--path demos/vhs/out)
[[ -d assets/demos ]] && INVERT+=(--path assets/demos)

if ((${#INVERT[@]} > 0)); then
  echo "filter-repo: removing demo blobs from all commits"
  git filter-repo --invert-paths "${INVERT[@]}" --force
  [[ -n "$ORIGIN" ]] && git remote add origin "$ORIGIN"
fi

if [[ -f filter-repo-replacements.txt ]]; then
  echo "filter-repo: replace-text from filter-repo-replacements.txt"
  git filter-repo --replace-text filter-repo-replacements.txt --force
  [[ -n "$ORIGIN" ]] && git remote add origin "$ORIGIN"
fi

echo "History rewrite complete. Add clean demos, commit, then:"
echo "  git push --force-with-lease origin main"