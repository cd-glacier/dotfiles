#!/bin/bash

vpn_connection=$(scutil --nc list | grep Connected)

if [[ -z "$vpn_connection" ]]; then
  ICON=""
  LABEL="VPN NOT Connected"
  ICON_PADDING_RIGHT=7
else
  ICON="󰳌"
  LABEL=""
  ICON_PADDING_RIGHT=0
fi

sketchybar --set $NAME icon="$ICON" label="$LABEL" icon.padding_right=$ICON_PADDING_RIGHT
