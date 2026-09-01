#!/bin/bash

set -euo pipefail

filename=$(date +'screenshot-%Y%m%d-%H%M%S.png')
swaymsg -t get_tree | jq -r '.. | (.nodes? // empty)[] | select(.pid and .visible) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp | grim -g - /tmp/$filename
wl-copy < /tmp/$filename
notify-send "Screenshot captured" "/tmp/$filename"
