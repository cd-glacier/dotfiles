#!/bin/bash

vpn_connection=$(scutil --nc list | grep Connected)

if [[ -z "$vpn_connection" ]]; then
  label="VPN NOT Connected"
else
  label="VPN Connected"
fi

sketchybar --set "$NAME" label="$label"

