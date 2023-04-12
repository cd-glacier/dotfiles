#!/bin/sh

CONNECTED_DEVICE="$(blueutil --connected --format json | jq -r .[].name)"

if [[ ! -z "$CONNECTED_DEVICE" ]]; then
  LABEL="$CONNECTED_DEVICE"
  ICON=󰂱
else
  LABEL="Not Connected"
  ICON=
fi

sketchybar --set $NAME icon="$ICON" label="$LABEL"
