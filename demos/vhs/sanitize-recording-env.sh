#!/usr/bin/env bash
# Public-safe shell identity for VHS terminal recordings.
# Sources demos/vhs/env.sh after setting HOME/USER (real repo paths stay on disk).
set -euo pipefail
_VHS_SANITIZE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
_REPO_ROOT="$(cd "$_VHS_SANITIZE_DIR/../.." && pwd)"

export VHS_RECORDING=1
export HOME="$_REPO_ROOT/demos/vhs/staging/home/graphtheory"
export USER=graphtheory
export LOGNAME=graphtheory
export HOSTNAME=cyber

mkdir -p "$HOME/users/graphtheory/projects"
_WORKSPACE="$HOME/users/graphtheory/projects/$(basename "$_REPO_ROOT")"
ln -sfn "$_REPO_ROOT" "$_WORKSPACE"

export PS1='graphtheory@cyber:~/users/graphtheory/projects/'"$(basename "$_REPO_ROOT")"'$ '
export PROMPT_COMMAND=

cd "$_WORKSPACE"

# shellcheck source=env.sh
source "$_VHS_SANITIZE_DIR/env.sh"