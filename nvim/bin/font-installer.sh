#!bin/bash

echo "##### install font #####"

echo "----- install FiraCode -----"
if [ -e ~/Library/Fonts/FiraCode-Regular.ttf ]; then
  echo "FiraCode already exists"
else
  git clone git@github.com:tonsky/FiraCode.git
  cp FiraCode/distr/ttf/FiraCode-Medium.ttf ~/Library/Fonts/
  rm -rf FiraCode
fi

echo "----- install PowerLine fonts -----"
if test -z "$(ls ~/Library/Fonts/ | grep powerline)"; then
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf fonts
else
  echo "PoewrLine fonts already exists"
fi
