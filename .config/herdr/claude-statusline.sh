#!/bin/bash

# Claude Code status line + Herdr per-pane usage bridge.
# Claude supplies this JSON after responses and on the configured refresh interval.

input=$(< /dev/stdin)

IFS=$'\t' read -r model context five_hour seven_day < <(
  jq -r '[
    (.model.display_name // "Claude"),
    ((.context_window.used_percentage // 0) | floor),
    ((.rate_limits.five_hour.used_percentage // -1) | floor),
    ((.rate_limits.seven_day.used_percentage // -1) | floor)
  ] | @tsv' <<< "$input"
)

color_for_percentage() {
  local percentage=$1
  if (( percentage >= 80 )); then
    printf '#e67e80'
  elif (( percentage >= 60 )); then
    printf '#dbbc7f'
  else
    printf '#a7c080'
  fi
}

usage_bar() {
  local percentage=$1
  local filled=$(( (percentage + 19) / 20 ))
  local empty=$(( 5 - filled ))
  local bar=
  local i

  for (( i = 0; i < filled; i++ )); do bar+='▰'; done
  for (( i = 0; i < empty; i++ )); do bar+='▱'; done
  printf '%s' "$bar"
}

ansi_fg() {
  local hex=${1#\#}
  printf '\033[38;2;%d;%d;%dm' "0x${hex:0:2}" "0x${hex:2:2}" "0x${hex:4:2}"
}

cream=$(ansi_fg '#d3c6aa')
gold=$(ansi_fg '#dbbc7f')
muted=$(ansi_fg '#7a8478')
context_color=$(ansi_fg "$(color_for_percentage "$context")")
reset=$'\033[0m'
separator="${muted}    ${reset}"

printf '%b◆ %s%b%sctx %s %d%%%b' \
  "$gold" "$model" "$separator" "$context_color" "$(usage_bar "$context")" "$context" "$reset"

compact="ctx ${context}%"

if (( five_hour >= 0 )); then
  five_color=$(ansi_fg "$(color_for_percentage "$five_hour")")
  printf '%b%s5h %d%%%b' "$separator" "$five_color" "$five_hour" "$reset"
  compact+=" · 5h ${five_hour}%"
fi

if (( seven_day >= 0 )); then
  seven_color=$(ansi_fg "$(color_for_percentage "$seven_day")")
  printf '%b%s7d %d%%%b' "$separator" "$seven_color" "$seven_day" "$reset"
  compact+=" · 7d ${seven_day}%"
fi

printf '\n'

if [[ -n ${HERDR_PANE_ID:-} ]] && command -v herdr >/dev/null 2>&1; then
  herdr pane report-metadata \
    --source claude-statusline \
    --token "claude_usage=$compact" \
    --ttl-ms 90000 \
    "$HERDR_PANE_ID" >/dev/null 2>&1 &
fi
