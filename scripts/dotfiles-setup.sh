#!/usr/bin/env bash

set -euCo pipefail

DOTFILES_DIR="$(pwd)/dotfiles"
readonly DOTFILES_DIR

find "$DOTFILES_DIR" -type f | while read -r src; do
  file="${src#"$DOTFILES_DIR"/}"
  mkdir -p "$HOME/$(dirname "$file")"
  echo "Linking $file to $HOME/$file"
  ln -sf "$src" "$HOME/$file"
done
