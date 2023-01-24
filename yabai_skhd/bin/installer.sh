#!/bin/bash

install_command() {
  echo "----- install $1 -----"
  if [ -z $(which $1) ]; then
    brew install $1
  fi
}

echo '#### install with brew'

install_command koekeishiya/formulae/yabai
install_command koekeishiya/formulae/skhd

echo "##### link setting files ######"
LINK_FILES=(.yabairc .skhdrc)

for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null

	ln -sf $(PWD)/yabai_skhd/$file ~/$file; \
done

echo "##### finish to link setting files ######"
