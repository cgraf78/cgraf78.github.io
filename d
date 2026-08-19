#!/usr/bin/env bash
# Shortcut bootstrap: curl -fsSL cgraf78.github.io/d | bash
set -euo pipefail

repo="${DOTBOOTSTRAP_DOTFILES_REPO:-git@github.com:cgraf78/dotfiles.git}"
branch="${DOTFILES_BRANCH:-main}"

curl -fsSL https://raw.githubusercontent.com/cgraf78/dot/main/install.sh |
  bash -s -- --init --yes --branch "$branch" "$repo"
