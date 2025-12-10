#!/usr/bin/env bash

set -euC

readonly HOSTNAME="${HOSTNAME}"

if [[ "$(uname)" == "Darwin" ]]; then
  nh darwin switch --ask --hostname "$HOSTNAME" .
else
  nh os switch --ask --hostname "$HOSTNAME" .
fi
