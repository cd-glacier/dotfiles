#!bin/bash

CURRENT_PATH=$(PWD)

echo "##### install dependencies #####"

echo "------ install yarn -----"
if test -z $(which yarn); then
  brew install yarn
fi

echo "------ install fzf -----"
if test -z $(which fzf); then
  brew install fzf
fi

echo "##### install Language Server #####"

if [ ! -d ~/langserver ]; then
  mkdir ~/langserver
fi

echo "----- install solargraph -----"
if test -z $(which solargraph); then
  gem install solargraph
fi

echo "----- install bash-language-server -----"
if test -z $(which bash-language-server); then
  yarn global add bash-language-server
fi

echo "----- install dockerfile-language-server -----"
if test -z $(which docker-langserver); then
  yarn global add dockerfile-language-server-nodejs
fi

echo "----- install javascript-typescript-langserver -----"
if test -e ~/langserver/javascript-typescript-langserver/lib/language-server-stdio.js; then
  echo "javascript-typescript-langserver already exists"
else
  cd ~/langserver && \
    git clone https://github.com/sourcegraph/javascript-typescript-langserver.git && \
    cd javascript-typescript-langserver && \
    yarn && yarn build && \
    cd $CURRENT_PATH
fi

echo "----- install yaml-language-server -----"
if test -e ~/langserver/yaml-language-server/out/server/src/server.js; then
  echo "yaml-language-server already exists"
else
  cd ~/langserver && \
    git clone https://github.com/redhat-developer/yaml-language-server.git && \
    cd yaml-language-server && \
    yarn && yarn run compile && \
    cd $CURRENT_PATH
fi
