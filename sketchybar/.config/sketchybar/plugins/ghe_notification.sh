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

if [[ ! ${notifications_length} =~  ^[0-9]+$ ]]; then
  LABEL="Failed to connect to GHE"
else
  title=$(echo "$notifications" | jq -r .[0].title | cut -c 1-30)

  if [[ "$title" == "null" ]]; then
    LABEL="none"
  else
    LABEL="$notification_length $title"
  fi
fi

sketchybar --set $NAME icon="" icon.padding_right=0 label.padding_right=15 label="$LABEL..."

