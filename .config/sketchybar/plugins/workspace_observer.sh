#!/bin/bash

source "$CONFIG_DIR/colors.sh"

focused_workspace="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused 2>/dev/null)}"
windows="$(aerospace list-windows --all --format $'%{workspace}\t%{app-name}' 2>/dev/null)"
updates=()

for sid in 1 2 3 4 5 6 7 8 9; do
  apps="$(printf '%s\n' "$windows" | awk -F '\t' -v sid="$sid" \
    '$1 == sid && !seen[$2]++ { print $2 }')"

  icon_strip=""
  app_count=0
  while IFS= read -r app; do
    [ -z "$app" ] && continue
    app_count=$((app_count + 1))
    if [ "$app_count" -le 3 ]; then
      icon_strip="$icon_strip $($CONFIG_DIR/plugins/icon_map.sh "$app")"
    fi
  done <<< "$apps"

  if [ "$app_count" -gt 3 ]; then
    icon_strip="$icon_strip …"
  fi

  if [ "$app_count" -eq 0 ]; then
    label_drawing=off
    icon_color=$MUTED
  else
    label_drawing=on
    icon_color=$SAGE
  fi

  if [ "$sid" = "$focused_workspace" ]; then
    updates+=(--set "space.$sid"
      background.drawing=on
      background.color="$ACTIVE_COLOR"
      background.border_width=1
      background.border_color="$GOLD"
      icon.color="$CREAM"
      label.color="$CREAM"
      label.drawing="$label_drawing"
      label="$icon_strip")
  else
    updates+=(--set "space.$sid"
      background.drawing=off
      background.border_width=0
      icon.color="$icon_color"
      label.color="$SAGE"
      label.drawing="$label_drawing"
      label="$icon_strip")
  fi
done

sketchybar --animate tanh 12 "${updates[@]}"
