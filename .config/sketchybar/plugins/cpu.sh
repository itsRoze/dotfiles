#!/bin/bash

CORE_COUNT="$(sysctl -n machdep.cpu.thread_count)"
CPU_PERCENT="$(ps -A -o %cpu= | awk -v cores="$CORE_COUNT" \
  '{ sum += $1 } END { printf "%.0f", sum / cores }')"

sketchybar --set "$NAME" label="$CPU_PERCENT%"
