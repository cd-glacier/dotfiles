#!/usr/bin/env sh

echo $INFO

ICON_PADDING_RIGHT=10

case $INFO in
  "WezTerm")
    ICON_PADDING_RIGHT=8
    ICON=
    ;;
  "Warp")
    ICON_PADDING_RIGHT=8
    ICON=
    ;;
  "Finder")
    ICON=
    ;;
  "Vivaldi")
    ICON_PADDING_RIGHT=7
    ICON=
    ;;
  "Android Studio")
    ICON_PADDING_RIGHT=7
    ICON=󰀲
    ;;
  "RubyMine")
    ICON_PADDING_RIGHT=6
    ICON=
    ;;
  "System Settings")
    ICON_PADDING_RIGHT=6
    ICON=
    ;;
  "Logseq")
    ICON_PADDING_RIGHT=6
    ICON=
    ;;
  *)
    ICON=
    ;;
esac

sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT
sketchybar --set $NAME.name label="$INFO"
