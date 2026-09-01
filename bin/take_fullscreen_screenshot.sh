#!/bin/bash

set -euo pipefail

filename=$(date +'screenshot-%Y%m%d-%H%M%S.png')
grim /tmp/$filename

wl-copy < /tmp/$filename
notify-send "Screenshot captured" "/tmp/$filename"
