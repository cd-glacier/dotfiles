#!/bin/bash

if [ -z "$(which neovim)" ]; then
  echo "neovim is not exist"
  exit 1
fi

if [ -z "$(which pip3)" ]; then
  echo "python3 is not exist"
  exit 1
fi

if [ ! -d ~/.config/dein/ ]; then
  echo "dein.vim is not exist"
  exit 1
fi

