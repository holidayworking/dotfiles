#!/usr/bin/env bash

set -euC

readonly FLAKE_URL="${FLAKE_URL:-.#gemini}"
readonly VM_NAME="${VM_NAME:-NixOS}"
readonly VM_IP="${VM_IP}"

echo "Bootstrapping NixOS on VM..."
nix run github:nix-community/nixos-anywhere -- \
	--flake "$FLAKE_URL" \
	--target-host root@"$VM_IP" \
	--phases kexec,disko,install

echo "Restarting VM..."
prlctl stop "$VM_NAME" --kill
prlctl set "$VM_NAME" --device-set cdrom0 --disconnect
prlctl start "$VM_NAME"
