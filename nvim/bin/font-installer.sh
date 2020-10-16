#!bin/bash

echo "##### install font #####"

if [ ! -d ~/Library/Fonts ]; then
  mkdir ~/Library/Fonts
fi

echo "----- install FiraCode -----"
if [ -z "$(ls ~/Library/Fonts/ | grep FiraCode)" ]; then
  git clone git@github.com:tonsky/FiraCode.git
  cp FiraCode/distr/ttf/FiraCode-Medium.ttf ~/Library/Fonts/
  if [ -z "$(ls ~/Library/Fonts/ | grep NerdFonts)" ]; then
    # うまく動かないかも
    fontforge --script font-patcher FiraCode/distr/ttf/FiraCode-Medium.ttf -c FiraCode-Medium-NerdFonts.otf
    cp FiraCode-Medium-NerdFonts.otf ~/Library/Fonts/
  fi
  rm -rf FiraCode
else
  echo "FiraCode already exists"
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

