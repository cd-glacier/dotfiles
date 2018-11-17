#!bin/bash

echo "##### install mac apps #####"

if test -z $(brew --prefix); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install caskroom/cask/brew-cask
fi

echo "----- install iterm -----"
if [ -d /Applications/iTerm.app/ ]; then
  echo "iterm already exists"
else
  brew cask install iterm2
fi

echo "----- install other tools -----"
if [ ! -d /Applications/Dropbox.app ]; then
  brew cask install dropbox
fi
if [ ! -d "/Applications/Google Chrome.app" ]; then
  brew cask install google-chrome
fi
if [ ! -d "/Applications/ShiftIt.app" ]; then
  brew cask install shiftit
fi
if [ ! -d "/Applications/HyperSwitch.app" ]; then
  brew cask install hyperswitch
fi
if [ ! -d "/Applications/Evernote.app" ]; then
  brew cask install evernote
fi
if [ ! -d "/Applications/Slack.app" ]; then
  brew cask install slack
fi

if [ ! -d "/Applications/Docker.app" ]; then
  brew cask install docker
fi

echo "----- install qmk dependencies -----"
if [ -z $(which avr-gcc) ]; then
  brew tap osx-cross/avr
  brew install avr-gcc
  brew install avrdude
else
  echo "qmk dependencies already exists"
fi

echo "##### finish to install mac apps #####"
