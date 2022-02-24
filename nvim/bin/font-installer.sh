#!bin/bash

echo "##### install font #####"

if [ ! -d ~/Library/Fonts ]; then
  mkdir ~/Library/Fonts
fi

echo "----- install FiraCode -----"
if [ ! -z "$(ls ~/Library/Fonts/ | grep FiraCode)" ]; then
  git clone git@github.com:tonsky/FiraCode.git
  cp FiraCode/distr/ttf/FiraCode-Medium.ttf ~/Library/Fonts/
  if [ ! -z "$(ls ~/Library/Fonts/ | grep NerdFonts)" ]; then
    git clone --branch=master --depth 1 https://github.com/ryanoasis/nerd-fonts.git
    ./nerd-fonts/install.sh FiraCode
  fi
  rm -rf nerd-fonts
  rm -rf FiraCode
else
  echo "FiraCode already exists"
fi

echo "----- install PowerLine fonts -----"
if [ ! -z "$(ls ~/Library/Fonts/ | grep PowerLine)" ]; then
  git clone https://github.com/powerline/fonts.git --depth=1
  ./fonts/install.sh
  rm -rf fonts
else
  echo "PoewrLine fonts already exists"
fi

