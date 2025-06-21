#!/usr/bin/env bash

set -euC

readonly VM_NAME="${VM_NAME:-NixOS}"
readonly VM_IP="${VM_IP}"

echo "Bootstrapping NixOS on VM..."
nix run github:nix-community/nixos-anywhere -- --flake .#macbook-air-m2-utm --target-host root@"$VM_IP"

echo "Stopping VM..."
utmctl stop "$VM_NAME"

echo "Removing display and serial configurations..."
/usr/libexec/PlistBuddy \
  -c "delete :Serial" \
  -c "add :Serial array" \
  -c "delete :Display" \
  -c "add :Display array" \
  "$HOME/Library/Containers/com.utmapp.UTM/Data/Documents/$VM_NAME.utm/config.plist"

echo "Restarting UTM to apply configuration changes..."
osascript -e 'quit app "UTM"'
sleep 2
open -a UTM
sleep 3

echo "Starting VM..."
utmctl start "$VM_NAME"
