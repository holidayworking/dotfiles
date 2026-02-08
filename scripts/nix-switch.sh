#!/usr/bin/env bash

set -euCo pipefail

HOSTNAME="$(hostname)"
readonly HOSTNAME

if [[ "$(uname)" == "Darwin" ]]; then
  nh darwin switch --ask --hostname "$HOSTNAME" .
else
  nh os switch --ask --hostname "$HOSTNAME" .
fi
