#!/bin/bash

sketchybar --add item media e \
           --set media label.color=$CREAM \
                       label.font="SF Pro:Medium:13.0" \
                       label.max_chars=28 \
                       icon.padding_left=7 \
                       scroll_texts=on \
                       icon=􀑪             \
                       icon.color=$GOLD   \
                       background.drawing=on \
                       background.color=$PANEL_COLOR \
                       background.border_width=1 \
                       background.border_color=$BORDER_COLOR \
                       script="$PLUGIN_DIR/media.sh" \
           --subscribe media media_change
