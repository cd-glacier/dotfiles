#!bin/bash

echo "##### install font #####"

echo "----- install FiraCode -----"
if [ -z "$(ls ~/Library/Fonts/ | grep FiraCode)" ]; then
  echo "FiraCode already exists"
else
  git clone git@github.com:tonsky/FiraCode.git
  cp FiraCode/distr/ttf/FiraCode-Medium.ttf ~/Library/Fonts/
  rm -rf FiraCode
fi

echo "----- install PowerLine fonts -----"
if [ -z "$(ls ~/Library/Fonts/ | grep PowerLine)" ]; then
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf fonts
else
  echo "PoewrLine fonts already exists"
fi

echo "----- install nerd-fonts -----"
if [ -z "$(ls ~/Library/Fonts/ | grep NerdFonts)" ]; then
  brew tap homebrew/cask-fonts
  brew cask install font-hack-nerd-font
else
  echo "NerdFonts already exists"
fi
