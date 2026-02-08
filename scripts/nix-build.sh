#!/usr/bin/env bash

set -euCo pipefail

HOSTNAME="$(hostname)"
readonly HOSTNAME

if [[ "$(uname)" == "Darwin" ]]; then
  nh darwin build --hostname "$HOSTNAME" .
else
  nh os build --hostname "$HOSTNAME" .
fi
