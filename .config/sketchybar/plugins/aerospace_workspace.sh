#!/bin/bash

source "$CONFIG_DIR/colors.sh"

sid="$1"
focused_workspace="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused 2>/dev/null)}"
apps="$(aerospace list-windows --workspace "$sid" --format '%{app-name}' 2>/dev/null | sort -u)"

icon_strip=""
while IFS= read -r app; do
  [ -z "$app" ] && continue
  icon_strip="$icon_strip $($CONFIG_DIR/plugins/icon_map.sh "$app")"
done <<< "$apps"

if [ -z "$icon_strip" ]; then
  icon_strip=" —"
fi

if [ "$sid" = "$focused_workspace" ]; then
  sketchybar --animate sin 10 --set "$NAME" \
    background.drawing=on \
    background.color="$SHARP_COLOR" \
    icon.color="$WHITE" \
    label.color="$WHITE" \
    label="$icon_strip"
else
  sketchybar --animate sin 10 --set "$NAME" \
    background.drawing=off \
    icon.color="$ACCENT_COLOR" \
    label.color="$ACCENT_COLOR" \
    label="$icon_strip"
fi
