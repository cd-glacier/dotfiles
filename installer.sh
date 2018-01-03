# mac用

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
brew cask install dropbox
brew cask install google-chrome
brew cask install shiftit
brew cask install hyperswitch
brew cask install sketch
brew cask install evernote
brew cask install slack
brew cask install skype

# programming
brew install neovim/neovim/neovim
brew install python3
pip3 install neovim
brew cask install sublime-text
brew cask install intellij-idea
#brew cask install virtualbox
#brew cask install vagrant
brew cask install racket
brew cask install docker #docker for mac

# shell
brew install fish
brew install tmux
brew install ghq peco
brew install reattach-to-user-namespace

#fisher man
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fisher tamanugi/peco_select_git_misc

