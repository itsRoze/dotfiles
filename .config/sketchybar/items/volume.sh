#!/bin/bash

sketchybar --add item volume right \
           --set volume icon.color=$SAGE \
                        background.drawing=off \
                        click_script="osascript -e 'set volume output muted not (output muted of (get volume settings))'" \
                        script="$PLUGIN_DIR/volume.sh" \
           --subscribe volume volume_change
