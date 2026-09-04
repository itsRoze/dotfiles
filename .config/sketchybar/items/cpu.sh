#!/bin/bash

sketchybar --add item cpu right \
           --set cpu  update_freq=2 \
                      icon=􀧓  \
                      icon.color=$SAGE \
                      background.drawing=off \
                      click_script="open -a 'Activity Monitor'" \
                      script="$PLUGIN_DIR/cpu.sh"
