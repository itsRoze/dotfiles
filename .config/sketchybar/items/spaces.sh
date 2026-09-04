#!/bin/bash

sketchybar --add event aerospace_workspace_change

SPACES_IDS=(1 2 3 4 5 6 7 8 9)

for sid in "${SPACES_IDS[@]}"
do
  sketchybar --add item space.$sid left                                  \
             --set space.$sid icon=$sid                                  \
                              icon.font="Hack Nerd Font:Bold:14.0"       \
                              icon.color=$MUTED                          \
                              label.font="sketchybar-app-font:Regular:16.0" \
                              label.drawing=off                          \
                              label.padding_left=1                       \
                              label.padding_right=7                      \
                              label.y_offset=-1                          \
                              background.drawing=off                     \
                              click_script="aerospace workspace $sid"
done

sketchybar --add item space_separator left                    \
           --set space_separator icon="//"                   \
                                 icon.font="Hack Nerd Font:Bold:13.0" \
                                 icon.color=$GOLD             \
                                 icon.padding_left=7          \
                                 icon.padding_right=7         \
                                 label.drawing=off            \
                                 background.drawing=off

# One observer keeps all workspace labels current. It polls cheaply for window
# changes and also responds immediately to focus, wake, and workspace events.
sketchybar --add item aerospace.observer left                      \
           --set aerospace.observer drawing=off                    \
                                    update_freq=3                   \
                                    script="$PLUGIN_DIR/workspace_observer.sh" \
           --subscribe aerospace.observer aerospace_workspace_change \
                                            front_app_switched       \
                                            system_woke
