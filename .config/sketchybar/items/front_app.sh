#!/bin/bash

sketchybar --add item front_app left \
           --set front_app       background.color=$PANEL_COLOR \
                                 background.border_width=1 \
                                 background.border_color=$BORDER_COLOR \
                                 icon.color=$SAGE \
                                 icon.font="sketchybar-app-font:Regular:16.0" \
                                 label.color=$CREAM \
                                 label.font="SF Pro:Semibold:13.0" \
                                 label.max_chars=34 \
                                 script="$PLUGIN_DIR/front_app.sh"            \
           --subscribe front_app front_app_switched
