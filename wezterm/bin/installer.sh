#!/bin/bash

install_wezterm() {
  echo "----- install wezterm -----"
  if [ -z $(which wezterm) ]; then
    brew tap wez/wezterm
    brew install --cask wez/wezterm/wezterm
  fi
}

echo "#### install with brew ####"

install_wezterm

echo "##### link setting files ######"

LINK_FILES=(.config/wezterm/wezterm.lua)

for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null

	ln -sf $(PWD)/wezterm/$file ~/$file; \
done

echo "##### finish to link setting files ######"

