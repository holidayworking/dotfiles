#!/usr/bin/env bash

set -euC

readonly DOTFILES="
.config/sheldon/plugins.toml
.config/starship.toml
.config/zsh/config.zsh
.config/zsh/functions/peco_select_ghq_repository.zsh
.config/zsh/functions/peco_select_history.zsh
.gitconfig
.gitignore_global
.tmux.conf
.tigrc
.zshrc
"

for dir in $(echo "$DOTFILES" | xargs -n1 dirname | sort -u); do
  mkdir -p "$HOME/$dir"
done

for file in $DOTFILES; do
  echo "Linking $file to $HOME/$file"
  ln -sf "$(pwd)/dotfiles/$file" "$HOME/$file"
done
