#!/bin/bash

vpn=$(scutil --nc list | grep Connected)

if [[ -z $vpn ]]; then
  label="VPN NOT Connected"
else
  label="VPN Connected"
fi

sketchybar --set "$NAME" label="$label"

