#!/usr/bin/env bash

set -euC

readonly FLAKE_URI="${FLAKE_URI}"

if [[ "$(uname)" == "Darwin" ]]; then
  sudo darwin-rebuild switch --flake "$FLAKE_URI"
else
  sudo nixos-rebuild switch --flake "$FLAKE_URI"
fi
