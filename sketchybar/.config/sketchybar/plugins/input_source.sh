#!/bin/bash

is_japanese=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep "com.apple.inputmethod.Japanese")

if [[ -z "$is_japanese" ]]; then
  LABEL="ABC"
else
  LABEL="あ"
fi

sketchybar --set $NAME label="$LABEL"
