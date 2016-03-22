#homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#brew cask
brew install caskroom/cask/brew-cask

#terminal
brew cask install iterm2

brew cask install dropbox
brew cask install google-chrome
brew cask install shiftit
brew cask install sublime-text
brew cask install	atom 

#java
brew cask install java
brew cask install eclipse-java

#MySQL
brew install mysql

#bundler
brew install gpg2
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash

gem install bundler
gem install eventmachine -- --with-cppflags="-I/usr/local/opt/openssl/include"

#pyenv
brew install pyenv
echo 'if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi' > ~/.bash_profile

#opencv
brew install -v cmake
brew tap homebrew/science
brew install opencv
export PYTHONPATH="/usr/local/lib/python2.7/site-packages/:$PYTHONPATH"

#tex
brew install ghostscript




