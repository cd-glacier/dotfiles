#!/bin/sh

CONNECTED_DEVICE="$(blueutil --connected --format json | jq -r .[].name)"

if [[ ! -z "$CONNECTED_DEVICE" ]]; then
  LABEL="$CONNECTED_DEVICE"
  ICON=󰂱
  ICON_PADDING_RIGHT=7
else
  LABEL=""
  ICON=
  ICON_PADDING_RIGHT=0
fi

sketchybar --set $NAME icon="$ICON" label="$LABEL" icon.padding_right=$ICON_PADDING_RIGHT
