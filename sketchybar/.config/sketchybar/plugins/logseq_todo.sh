#!/bin/bash

journals_directory="/Users/hyoga-yoshida/glacier.in.antarctica@gmail.com - Google Drive/My Drive/logseq/journals"
today=$(date "+%Y_%m_%d")
today_jounal="$journals_directory/$today.md"

last_todo=$(grep "TODO" "$today_jounal" | tail -n 1 | sed 's/- TODO //g')

sketchybar --set $NAME icon="" label="$last_todo"

