#!/usr/bin/env bash
grim -g "$(slurp)" - | tee "$HOME/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png" | wl-copy -t image/png && notify-send "📸 Screenshot copied to clipboard"

