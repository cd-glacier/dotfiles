#!/bin/bash

install_command() {
  echo "----- install $1 -----"
  if [ -z $(which $1) ]; then
    brew install $1
  fi
}

echo "#### install with brew ####"

install_command zellij


echo "##### link setting files ######"

LINK_FILES=(.config/zellij/config.yaml)

for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null

	ln -sf $(PWD)/zellij/$file ~/$file; \
done

echo "##### finish to link setting files ######"

