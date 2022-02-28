#!/bin/bash

ACCESS_TOKEN=$(envchain swiftbar bash -c 'echo $GHE_ACCESS_TOKEN')
USER_NAME=$(envchain swiftbar bash -c 'echo $GHE_USER_NAME')

if [ -z "$ACCESS_TOKEN" ]; then
  echo "missing ACCESS_TOKEN"
  exit 1
fi

if [ -z "$USER_NAME" ]; then
  echo "missing USER_NAME"
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

# FIXME: reafactoring
bar_text() {
  if [ $1 -gt 20 ]; then
    echo "🔥 $notifications_length | href=https://ghe.ckpd.co/notifications"
  elif [ $1 -gt 10 ]; then
    echo "⚡️ $notifications_length | href=https://ghe.ckpd.co/notifications"
  elif [ $1 -gt 5 ]; then
    echo "🌧  $notifications_length | href=https://ghe.ckpd.co/notifications"
  else
    echo "☁️  $notifications_length | href=https://ghe.ckpd.co/notifications"
  fi
}

if [[ ! ${notifications_length} =~  ^[0-9]+$ ]]; then
  echo "Failed to connect to GHE | href=https://ghe.ckpd.co/notifications"
fi

if [[ "$notifications_length" > 0 ]]; then
  bar_text "$notifications_length"

  echo "---"
  for i in $(seq 0 $(($notifications_length - 1)))
  do
    title=$(echo $notifications | jq -r ".[$i].title")
    notification_type=$(echo $notifications | jq -r ".[$i].type")

    echo "[$notification_type] $title"
  done
else
  echo "☀️  | href=https://ghe.ckpd.co/notifications"
fi

