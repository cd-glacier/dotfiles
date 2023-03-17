#!/bin/bash

ACCESS_TOKEN=$(envchain swiftbar bash -c 'echo $GHE_ACCESS_TOKEN')
USER_NAME=$(envchain swiftbar bash -c 'echo $GHE_USER_NAME')

if [ -z "$ACCESS_TOKEN" ]; then
  sketchybar --set $NAME label="missing ACCESS_TOKEN"
  exit 1
fi

if [ -z "$USER_NAME" ]; then
  sketchybar --set $NAME label="missing USER_NAME"
  exit 1
fi

notifications=$(curl -s -u "$USER_NAME:$ACCESS_TOKEN" \
  --get https://ghe.ckpd.co/api/v3/notifications \
  | jq '. | map({
    "title": .subject.title,
    "type": .subject.type,
    "url": .subject.url,
    "latest_url": .subject.latest_comment_url
  })')

notifications_length=$(echo $notifications | jq '. | length')

bar_text() {
  if [ $1 -gt 20 ]; then
    sketchybar --set $NAME icon="󰈸" label="$notifications_length"
  elif [ $1 -gt 10 ]; then
    sketchybar --set $NAME icon="󰖓" label="$notifications_length"
  elif [ $1 -gt 5 ]; then
    sketchybar --set $NAME icon="" label="$notifications_length"
  else
    sketchybar --set $NAME icon="󰀸" label="$notifications_length"
  fi
}

if [[ ! ${notifications_length} =~  ^[0-9]+$ ]]; then
  sketchybar --set $NAME label="Failed to connect to GHE"
fi

if [[ "$notifications_length" > "0" ]]; then
  bar_text "$notifications_length"
else
  sketchybar --set $NAME icon="󰖨" label="0"
fi

