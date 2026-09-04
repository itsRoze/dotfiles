#!/bin/sh

app_name="$INFO"
if [ -z "$app_name" ]; then
  app_name="$(aerospace list-windows --focused --format '%{app-name}' 2>/dev/null | head -1)"
fi

window_title="$(aerospace list-windows --focused --format '%{window-title}' 2>/dev/null | head -1)"
[ -z "$window_title" ] && window_title="$app_name"

sketchybar --set "$NAME" \
  icon="$($CONFIG_DIR/plugins/icon_map.sh "$app_name")" \
  label="$window_title"
