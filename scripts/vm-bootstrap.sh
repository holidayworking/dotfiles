#!/usr/bin/env bash

set -euC

readonly VM_NAME="${VM_NAME:-NixOS}"
readonly VM_IP="${VM_IP}"

echo "Bootstrapping NixOS on VM..."
nix run github:nix-community/nixos-anywhere -- --flake .#macbook-air-m2-utm --target-host root@"$VM_IP"

echo "Restarting VM..."
utmctl stop "$VM_NAME"
utmctl start "$VM_NAME"
