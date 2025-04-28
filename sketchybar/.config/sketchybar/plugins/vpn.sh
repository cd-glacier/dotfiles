#!/bin/bash

vpn_url=$(envchain sketchybar bash -c 'echo $VPN_URL')
vpn_connection=$(envchain sketchybar curl -s -o /dev/null -w '%{http_code}' --head "$vpn_url")

if [[ "$vpn_connection" != 200 ]]; then
  ICON=""
  LABEL="VPN NOT Connected"
  ICON_PADDING_RIGHT=7
else
  ICON="󰳌"
  LABEL=""
  ICON_PADDING_RIGHT=0
fi

sketchybar --set $NAME icon="$ICON" label="$LABEL" icon.padding_right=$ICON_PADDING_RIGHT
