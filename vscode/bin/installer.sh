#!bin/bash

echo "##### setup vscode #####"

if [ -z $(which brew) ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install caskroom/cask/brew-cask
fi

if [ -z $(which code) ]; then
    brew install vscode
fi

LINK_FILES=(settings.json)

for file in ${LINK_FILES[@]}; do \
    unlink ~/Library/Application\ Support/Code/User/$file&>/dev/null
    ln -sf $(PWD)/vscode/$file ~/Library/Application\ Support/Code/User/$file; \
done
echo "finish to link"

bash ./vscode/bin/install-extensions.sh