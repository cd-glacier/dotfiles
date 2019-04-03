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
    brew cask install $1
  fi
}

echo "##### install terminal tool #####"
install_command tmux
install_command ghq
install_command reattach-to-user-namespace

echo "##### install mac apps #####"

if test -z $(brew --prefix); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install caskroom/cask/brew-cask
fi

tools=$(brew list)

brew_cask_install iterm2
brew_cask_install dropbox
brew_cask_install google-chrome
brew_cask_install shiftit
brew_cask_install hyperswitch
brew_cask_install evernote
brew_cask_install slack
brew_cask_install lunar
brew_cask_install docker

echo "----- install qmk dependencies -----"
if [ -z $(which avr-gcc) ]; then
  brew tap osx-cross/avr
  brew install avr-gcc
  brew install avrdude
else
  echo "qmk dependencies already exists"
fi

echo "##### finish to install mac apps #####"
