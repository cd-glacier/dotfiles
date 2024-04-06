#!/bin/bash

label=$(adb devices -l | grep -o -E 'model:\s*\S*' | tail -n 1 | sed 's/model://')

sketchybar --set $NAME label="$label"

