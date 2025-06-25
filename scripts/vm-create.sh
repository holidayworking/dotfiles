#!/usr/bin/env bash

set -euC

readonly VM_NAME="${VM_NAME:-NixOS}"
readonly VM_MEMORY="${VM_MEMORY:-8192}"
readonly VM_DISK_SIZE="${VM_DISK_SIZE:-262144}"

readonly DOWNLOAD_DIR="$HOME/tmp"
readonly ISO_URL="https://releases.nixos.org/nixos/25.05/nixos-25.05.804002.5f4f306bea96/nixos-minimal-25.05.804002.5f4f306bea96-aarch64-linux.iso"
ISO_PATH="$DOWNLOAD_DIR/$(basename "$ISO_URL")"
readonly ISO_PATH

mkdir -p "$DOWNLOAD_DIR"

if [ ! -f "$ISO_PATH" ]; then
  echo "Starting download..."
  curl --output "$ISO_PATH" "$ISO_URL"
else
  echo "ISO file already exists: $ISO_PATH"
fi

echo "Creating VM in UTM..."
osascript <<EOF
tell application "UTM"
    set iso to POSIX file "$ISO_PATH"

    make new virtual machine with properties { \
      backend:apple, \
      configuration:{ \
        name:"$VM_NAME", \
        memory: $VM_MEMORY, \
        drives: { \
          { \
            guest size:$VM_DISK_SIZE \
          }, \
          { \
            removable:true, \
            source:iso \
          } \
        } \
      } \
    }
end tell
EOF

echo "Applying VM configuration changes..."
/usr/libexec/PlistBuddy \
  -c "set :Virtualization:Pointer Mouse" \
  -c "set :Virtualization:Keyboard Generic" \
  -c "set :Virtualization:ClipboardSharing true" \
  -c "add :Virtualization:Rosetta bool true" \
  -c "add :Information:Icon string nixos" \
  -c "add :Display:0 dict" \
  -c "add :Display:0:PixelsPerInch integer 80" \
  -c "add :Display:0:HeightPixels integer 1200" \
  -c "add :Display:0:WidthPixels integer 1920" \
  -c "add :Display:0:DynamicResolution bool true" \
  "$HOME"/Library/Containers/com.utmapp.UTM/Data/Documents/"$VM_NAME".utm/config.plist

echo "Restarting UTM to apply configuration changes..."
osascript -e 'quit app "UTM"'
sleep 2
open -a UTM
sleep 3

echo "Starting VM..."
utmctl start "$VM_NAME"
