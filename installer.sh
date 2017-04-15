# mac用

# homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#brew cask
brew install caskroom/cask/brew-cask

# font
git clone git@github.com:tonsky/FiraCode.git
cp FiraCode/distr/ttf/FiraCode-Medium.ttf ~/Library/Fonts/
rm -rf FiraCode

# terminal
brew cask install iterm2

# tool
brew cask install dropbox
brew cask install google-chrome
brew cask install shiftit
brew cask install sketch
brew cask install evernote
brew cask install slack
brew cask install skype

# programming
brew install neovim/neovim/neovim
brew cask install sublime-text
brew cask install intellij-idea
#brew cask install virtualbox
#brew cask install vagrant
brew cask install racket
brew install docker

# shell
brew install fish
brew install tmux
brew install ghq peco
brew install reattach-to-user-namespace

# vimrc tmux fish
git clone https://github.com/g-hyoga/dotfiles.git
cp dotfiles/.vimrc ~/
cp dotfiles/.tmux.conf ~/
#fish && exit
cp dotfiles/config.fish ~/.config/fish/
