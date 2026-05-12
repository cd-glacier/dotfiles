#!/bin/bash
input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name // "Claude"')
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')
five_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
week_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

# Shorten model name: "Claude Sonnet 4.6" -> "Sonnet4.6", "Claude Haiku 4.5" -> "Haiku4.5"
model_short=$(echo "$model" | sed 's/Claude //' | sed 's/ //')
model_min=$(echo "$model_short" | cut -c1-3)$(echo "$model_short" | grep -o '[0-9][0-9.]*$')

cols=${COLUMNS:-80}

if [ "$cols" -lt 60 ]; then
  # Minimal: "S4.6 82%"
  out="$model_min"
  [ -n "$remaining" ] && out="$out $(printf '%.0f' "$remaining")%"
elif [ "$cols" -lt 100 ]; then
  # Normal: "Sonnet4.6 | ctx:82%"
  out="$model_short"
  [ -n "$remaining" ] && out="$out | ctx:$(printf '%.0f' "$remaining")%"
  [ -n "$five_pct" ] && out="$out 5h:$(printf '%.0f' "$five_pct")%"
else
  # Wide: "Claude Sonnet 4.6 | ctx:82% | 5h:30% 7d:10%"
  out="$model"
  [ -n "$remaining" ] && out="$out | ctx:$(printf '%.0f' "$remaining")%"
  limits=""
  [ -n "$five_pct" ] && limits="5h:$(printf '%.0f' "$five_pct")%"
  [ -n "$week_pct" ] && limits="$limits 7d:$(printf '%.0f' "$week_pct")%"
  [ -n "$limits" ] && out="$out | $limits"
fi

echo "$out"
