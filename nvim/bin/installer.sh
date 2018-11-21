#!bin/bash

echo "##### setup neovim #####"

if test -z $(brew --prefix); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install caskroom/cask/brew-cask
fi

bash ./nvim/bin/font-installer.sh

echo "----- install neovim -----"
if [ -z $(which nvim) ]; then
  brew install neovim
fi
if [ -z $(which pip3) ]; then
  brew install python3
  pip3 install neovim
else
  pip3 install neovim --upgrade
fi

bash ./nvim/bin/dependency-installer.sh

echo "----- link files -----"

if [ ! -d ~/.config ]; then
  echo "create ~/.config directory"
  mkdir ~/.config
fi

LINK_FILES=(.config/dein .config/nvim)

for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null
	ln -sf $(PWD)/nvim/$file ~/$file; \
done
echo "finish to link"

echo "----- install dein.vim -----"
if [ -d ~/.config/dein/repos ]; then
  echo "dein.vim is already installed"
else
  bash ~/.config/dein/installer.sh ~/.config/dein/ &>/dev/null
  echo "finish to insall dein"
fi

echo "##### finish to setup neovim #####"
