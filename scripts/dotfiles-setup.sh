#!/usr/bin/env bash

set -euCo pipefail

readonly DOTFILES=(
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
)

for file in "${DOTFILES[@]}"; do
  mkdir -p "$HOME/$(dirname "$file")"
done

for file in "${DOTFILES[@]}"; do
  echo "Linking $file to $HOME/$file"
  ln -sf "$(pwd)/dotfiles/$file" "$HOME/$file"
done
