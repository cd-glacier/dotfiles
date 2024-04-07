#!/bin/bash

device=$(adb devices -l | grep -o -E 'model:\s*\S*' | tail -n 1 | sed 's/model://')

if [[ ! -z "$device" ]]; then
  ICON=󰦉
  LABEL="$device"
  ICON_PADDING_RIGHT=7
else
  ICON=󰄢
  LABEL=""
  ICON_PADDING_RIGHT=0
fi

sketchybar --set $NAME icon="$ICON" label="$LABEL" icon.padding_right=$ICON_PADDING_RIGHT

