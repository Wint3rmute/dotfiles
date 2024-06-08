#!/bin/bash
set -Eeuo pipefail

cd ~/Documents
fd -e pdf -X printf '%s\n' {/} | \
  rofi -matching fuzzy -i -dmenu | \
  xargs -I _ find -name "_" | xargs -I _ firefox "_"
