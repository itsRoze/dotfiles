#!/bin/bash

sketchybar --add item calendar right \
           --set calendar icon=􀧞 \
                          icon.color=$GOLD \
                          background.drawing=off \
                          update_freq=60 \
                          click_script="open -a Calendar" \
                          script="$PLUGIN_DIR/calendar.sh"
