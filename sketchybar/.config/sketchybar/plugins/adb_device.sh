#!/bin/bash

device=$(adb devices -l | grep -o -E 'model:\s*\S*' | tail -n 1 | sed 's/model://')

if [[ ! -z "$device" ]]; then
  label="Connected $device"
else
  label="Not Connected"
fi

sketchybar --set $NAME label="$label"

