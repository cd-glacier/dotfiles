#!/bin/bash

device=$(adb devices -l | grep -o -E 'model:\s*\S*' | tail -n 1 | sed 's/model://')

if [[ ! -z "$device" ]]; then
  ICON=󰦉
  LABEL="Connected $device"
else
  ICON=󰄢
  LABEL="Not Connected"
fi

sketchybar --set $NAME icon="$ICON" label="$LABEL"

