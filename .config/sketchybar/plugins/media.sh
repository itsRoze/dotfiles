#!/bin/bash

STATE="$(printf '%s' "$INFO" | jq -r '.state // empty' 2>/dev/null)"
if [ "$STATE" = "playing" ]; then
  MEDIA="$(printf '%s' "$INFO" | jq -r '[.title, .artist] | map(select(. != null and . != "")) | join(" — ")' 2>/dev/null)"
  sketchybar --set "$NAME" label="$MEDIA" drawing=on
else
  sketchybar --set "$NAME" drawing=off
fi
