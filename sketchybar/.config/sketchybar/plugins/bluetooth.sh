#!/bin/sh

STATE="$(blueutil -p)"

if [ "$STATE" = "0" ]; then
  LABEL="$(blueutil --connected --format json | jq -r .[].name)"
  ICON=󰂱
else
  LABEL="Not Connected"
  ICON=󰂲
fi

sketchybar --set $NAME icon="$ICON" label="$LABEL"
