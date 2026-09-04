#!/bin/bash

sketchybar --add event aerospace_workspace_change

SPACES_IDS=(1 2 3 4 5 6 7 8 9)

for sid in "${SPACES_IDS[@]}"
do
  sketchybar --add item space.$sid left                                      \
             --set space.$sid icon=$sid                                      \
                              label.font="sketchybar-app-font:Regular:16.0" \
                              label.padding_right=10                         \
                              label.y_offset=-1                              \
                              click_script="aerospace workspace $sid"       \
                              script="$PLUGIN_DIR/aerospace_workspace.sh $sid" \
             --subscribe space.$sid aerospace_workspace_change
done

sketchybar --add item space_separator left                             \
           --set space_separator icon="􀆊"                                \
                                 icon.color=$WHITE \
                                 icon.padding_left=2                   \
                                 label.drawing=off                     \
                                 background.drawing=off
