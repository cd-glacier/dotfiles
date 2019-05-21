#!bin/bash

CURRENT_PATH=$(PWD)

install_command() {
  echo "------ install $1 -----"
  if test -z $(which $1); then
    brew install $1
  fi
}

echo "##### install dependencies #####"

install_command yarn
install_command fzf
install_command ag
install_command jq

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

echo "----- install go-langserver -----"
if [ -z $(which go-langserver) ]; then
  go get -u github.com/sourcegraph/go-langserver
fi

echo "----- install java-language-server -----"
if test -e ~/langserver/java-language-server/dist/mac/bin/launcher; then
  echo "java-language-server already exists"
else
  cd ~/langserver && \
    git clone https://github.com/georgewfraser/java-language-server && \
    cd java-language-server && \
    ./script/link_mac.sh && \
    cd $CURRENT_PATH
fi

echo "----- install protobuf-langserver -----"
if test -e ~/langserver/protobuf-lsp/pls; then
  echo "protobuf-lsp already exists"
else
  cd ~/langserver && \
    git clone https://github.com/hudbrog/protobuf-lsp && \
    cd protobuf-lsp && \
    go build main.go -o pls && \
    cd $CURRENT_PATH
fi

