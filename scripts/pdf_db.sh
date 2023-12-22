#!/bin/bash
set -Eeuo pipefail

cd ~/Documents
fd -e pdf -X printf '%s\n' {/} | \
  rofi -matching fuzzy -i -dmenu | \
  xargs find -name | xargs firefox 
