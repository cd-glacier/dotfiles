#!bin/bash

CURRENT_PATH=$(PWD)

install_command() {
  echo "------ install $1 -----"
  if [ -z $(which $1) ]; then
    brew install $1
  fi
}

echo "##### install dependencies #####"

install_command yarn
install_command fzf
install_command ripgrep
install_command jq

