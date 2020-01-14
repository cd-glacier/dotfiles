#!bin/bash

echo "##### install font #####"

if [ ! -d ~/Library/Fonts ]; then
  mkdir ~/Library/Fonts
fi

echo "----- install FiraCode -----"
if [ -z "$(ls ~/Library/Fonts/ | grep FiraCode)" ]; then
  git clone git@github.com:tonsky/FiraCode.git
  cp FiraCode/distr/ttf/FiraCode-Medium.ttf ~/Library/Fonts/
  rm -rf FiraCode
else
  echo "FiraCode already exists"
fi

echo "----- install PowerLine fonts -----"
if [ -z "$(ls ~/Library/Fonts/ | grep PowerLine)" ]; then
  echo "PoewrLine fonts already exists"
else
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf fonts
fi

echo "----- install nerd-fonts -----"
if [ -z "$(ls ~/Library/Fonts/ | grep NerdFonts)" ]; then
  echo "NerdFonts already exists"
else
  brew tap homebrew/cask-fonts
  brew cask install font-hack-nerd-font
fi
