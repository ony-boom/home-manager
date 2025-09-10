#!/usr/bin/env bash

OUTPUT_DIR="$HOME/Pictures/Screenshots"

mkdir -p "$OUTPUT_DIR" || {
  notify-send "Failed to create screenshot directory: $OUTPUT_DIR" -u critical -t 3000
  exit 1
}

pkill slurp || hyprshot -m "${1:-region}" --raw --freeze |
  satty --filename - \
    --output-filename "$OUTPUT_DIR/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png" \
    --early-exit \
    --actions-on-enter save-to-clipboard \
    --save-after-copy \
    --copy-command 'wl-copy'
