#!/bin/bash

ACCESS_TOKEN=$(envchain GHE bash -c 'echo $GHE_ACCESS_TOKEN')
USER_NAME=$(envchain GHE bash -c 'echo $GHE_USER_NAME')
NOTIFICATION_ENDPOINT=$(envchain GHE bash -c 'echo $GHE_NOTIFICATION_ENDPOINT')

if [ -z "$ACCESS_TOKEN" ]; then
  sketchybar --set $NAME label="missing ACCESS_TOKEN"
  exit 1
fi

if [ -z "$USER_NAME" ]; then
  sketchybar --set $NAME label="missing USER_NAME"
  exit 1
fi

notifications=$(curl -s -u "$USER_NAME:$ACCESS_TOKEN" \
  --get "$NOTIFICATION_ENDPOINT" \
  | jq '. | map({
    "title": .subject.title,
    "type": .subject.type,
    "url": .subject.url,
    "latest_url": .subject.latest_comment_url
  })')

notification_length=$(echo $notifications | jq '. | length')

if [[ ! ${notification_length} =~  ^[0-9]+$ ]]; then
  LABEL="Failed to connect to GHE"
else
  title=$(echo "$notifications" | jq -r .[0].title)

  if [[ "$title" == "null" ]]; then
    LABEL=""
    ICON_PADDING_RIGHT=0
  else
    LABEL="$notification_length | $title "
    ICON_PADDING_RIGHT=7
  fi
fi

sketchybar --set $NAME label="$LABEL" icon.padding_right=$ICON_PADDING_RIGHT
