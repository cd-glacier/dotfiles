#!bin/bash

install_command() {
  echo "----- install $1 -----"
  if [ -z $(which $1) ]; then
    brew install $1
  fi
}

brew_cask_install() {
  echo "----- install $1 -----"
  if [[ $tools == *"$1"* ]]; then
    echo "$1 already exists"
  else
    brew install --cask $1
  fi
}

# echo "##### install cli tool #####"
# install_command mycli
# install_command pgcli

echo "##### install mac apps #####"

if test -z $(brew --prefix); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install caskroom/cask/brew-cask
fi

tools=$(brew list)

brew_cask_install vivaldi
brew_cask_install raycast
brew_cask_install logseq

echo "##### finish to install mac apps #####"
