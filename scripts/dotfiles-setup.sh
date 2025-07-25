#!/usr/bin/env bash

set -euC

readonly DOTFILES="
.config/fish/completions/aws.fish
.config/fish/config.fish
.config/fish/fish_plugins
.gitconfig
.gitignore_global
.tmux.conf
.tigrc
"

for dir in $(echo "$DOTFILES" | xargs -n1 dirname | sort -u); do
  mkdir -p "$HOME/$dir"
done

for file in $DOTFILES; do
  echo "Linking $file to $HOME/$file"
  ln -sf "$(pwd)/dotfiles/$file" "$HOME/$file"
done
