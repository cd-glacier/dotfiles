#!bin/bash

echo "##### setup fish #####"

if test -z $(brew --prefix); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install caskroom/cask/brew-cask
fi

echo "----- install fish -----"
brew install fish

echo "----- link fish -----"
LINK_FILES=(.config/fish)

for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null

	ln -sf $(PWD)/fish/$file ~/$file; \
done

echo "##### finish to setup fish #####"
