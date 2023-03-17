#!/bin/bash

install_sketchybar() {
  echo "----- install sketchybar -----"
  if [ -z $(which sketchybar) ]; then
    brew tap FelixKratz/formulae
    brew install sketchybar
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
  fi
}

echo "#### install with brew ####"

install_sketchybar

echo "##### link setting files ######"

LINK_FILES=(
  .config/sketchybar/sketchybarrc
  .config/sketchybar/plugins/battery.sh
  .config/sketchybar/plugins/clock.sh
  .config/sketchybar/plugins/front_app.sh
  .config/sketchybar/plugins/ghe_notification.sh
  .config/sketchybar/plugins/input_source.sh
  .config/sketchybar/plugins/volume.sh
  .config/sketchybar/plugins/wifi.sh
)

for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null

	ln -sf $(PWD)/sketchybar/$file ~/$file; \
done

echo "##### finish to link setting files ######"

