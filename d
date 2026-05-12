#!/usr/bin/env bash
# Shortcut bootstrap: curl -sL cgraf78.github.io/d | bash
set -euo pipefail

repo="${DOTBOOTSTRAP_DOTFILES_REPO:-git@github.com:cgraf78/dotfiles.git}"
branch="${DOTFILES_BRANCH:-main}"
tmp="$(mktemp -d "${TMPDIR:-/tmp}/dotbootstrap.XXXXXX")"

cleanup() {
  rm -rf "$tmp"
}
trap cleanup EXIT

if ! git clone --depth 1 --branch "$branch" --single-branch "$repo" "$tmp"; then
  echo "error: failed to clone $repo" >&2
  echo "make sure this machine has access to the private dotfiles repo" >&2
  exit 1
fi

bootstrap="$tmp/.local/bin/dotbootstrap"
if [[ ! -f "$bootstrap" ]]; then
  echo "error: $bootstrap not found in $repo#$branch" >&2
  exit 1
fi

DOTBOOTSTRAP_DOTFILES_REPO="$repo" bash "$bootstrap" init
