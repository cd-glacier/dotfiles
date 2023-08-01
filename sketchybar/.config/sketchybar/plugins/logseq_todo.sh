#!/bin/bash

journals_directory="/Users/glacier/Google Drive/マイドライブ/logseq/journals"
today=$(date "+%Y_%m_%d")
today_jounal="$journals_directory/$today.md"

last_todo=$(grep "TODO" "$today_jounal" | tail -n 1 | awk '{print $3}')

if [[ -z "$last_todo" ]]; then
  last_todo="nothing"
fi

sketchybar --set $NAME icon="" label="$last_todo"

