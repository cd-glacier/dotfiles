# mac用

CURRENT_PATH=$(PWD)

# homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#brew cask
brew install caskroom/cask/brew-cask

# font
## firaCode
git clone git@github.com:tonsky/FiraCode.git
cp FiraCode/distr/ttf/FiraCode-Medium.ttf ~/Library/Fonts/
rm -rf FiraCode
## powerline code
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# terminal
brew cask install iterm2

# tool
#brew cask install dropbox
#brew cask install google-chrome
brew cask install shiftit
brew cask install hyperswitch
#brew cask install sketch
#brew cask install evernote
#brew cask install slack
#brew cask install skype

# programming
brew install neovim/neovim/neovim
brew install python3
pip3 install neovim
pip3 install neovim --upgrade
brew cask install sublime-text
#brew cask install intellij-idea
#brew cask install virtualbox
#brew cask install vagrant
#brew cask install racket
brew cask install docker #docker for mac
brew install yarn

# programming language
brew install go

# shell
brew install fish
brew install tmux
brew install ghq fzf
brew install reattach-to-user-namespace
brew install bat

# LSP
# ruby
gem install soloargraph

# go
go get -u github.com/sourcegraph/go-langserver

# bash
yarn global add bash-language-server

# Dockerfile
yarn global add dockerfile-language-server-nodejs

# js/ts
ghq get https://github.com/sourcegraph/javascript-typescript-langserver.git && \
  cd $GOPATH/src/github.com/sourcegraph/javascript-typescript-langserver && \
  yarn build && \
  cd $CURRENT_PATH

# yaml
ghq get https://github.com/redhat-developer/yaml-language-server.git && \
  cd $GOPATH/src/github.com/redhat-developer/yaml-language-server/ && \
  yarn && yarn run compile && \
  cd $CURRENT_PATH

# qmk
brew tap osx-cross/avr
brew install avr-gcc
brew install avrdude

