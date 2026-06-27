#!/usr/bin/env bash
# Public-safe shell identity for VHS terminal recordings.
set -euo pipefail
_VHS_SANITIZE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
_REPO_ROOT="$(cd "$_VHS_SANITIZE_DIR/../.." && pwd)"

export VHS_RECORDING=1
export HOME="$_REPO_ROOT/demos/vhs/staging/home/graphtheory"
export USER=graphtheory
export LOGNAME=graphtheory
export HOSTNAME=cyber
export HERMES_HOME="$HOME/.hermes"
export HERMES_TUI_FAST_ECHO=0
unset HERMES_TUI_THEME
unset VSCODE_IPC_HOOK_CLI
unset TERM_PROGRAM

mkdir -p "$HERMES_HOME" "$HOME/users/graphtheory/projects"
_WORKSPACE="$HOME/users/graphtheory/projects/$(basename "$_REPO_ROOT")"
ln -sfn "$_REPO_ROOT" "$_WORKSPACE"

export PS1='graphtheory@cyber:~/users/graphtheory/projects/'"$(basename "$_REPO_ROOT")"'$ '
export PROMPT_COMMAND=
cd "$_WORKSPACE"

if [[ -f "$_VHS_SANITIZE_DIR/env.sh" ]]; then
  # shellcheck source=env.sh
  source "$_VHS_SANITIZE_DIR/env.sh"
else
  export REPO_ROOT="$_REPO_ROOT"
fi