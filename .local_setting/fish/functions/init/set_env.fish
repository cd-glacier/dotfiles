
function set_env
  # Golang
  set -g GOPATH $HOME/Dropbox/dev
  #set GOROOT /usr/local/go
  set PATH $PATH $GOROOT/bin
  set PATH $PATH $GOPATH/bin

  # gitcommit_message
  #git config --global commit.template ""
  #git config --global --remove-section commit

  # gitcommit_message
  #set GITCOMMIT_MESSAGE_FILE ".gitcommit_message"
  #set GITCOMMIT_MESSAGE_PATH ~
  #git config --global commit.template "$GITCOMMIT_MESSAGE_PATH/$GITCOMMIT_MESSAGE_FILE"

  # web assembly
  set PATH $PATH /Users/$USER/Dropbox/dev/src/github.com/juj/emsdk/clang/fastcomp/build_incoming_64/bin
  set PATH $PATH /Users/$USER/Dropbox/dev/src/github.com/juj/emsdk/node/8.9.1_64bit/bin
  set PATH $PATH /Users/$USER/Dropbox/dev/src/github.com/juj/emsdk/emscripten/incoming
  set PATH $PATH /Users/$USER/Dropbox/dev/src/github.com/juj/emsdk/binaryen/master_64bit_binaryen/bin
  set -g EMSDK /Users/$USER/Dropbox/dev/src/github.com/juj/emsdk
  set -g EM_CONFIG /Users/$USER/.emscripten
  set -g EMSCRIPTEN /Users/$USER/Dropbox/dev/src/github.com/juj/emsdk/emscripten/incoming
  set -g BINARYEN_ROOT /Users/$USER/Dropbox/dev/src/github.com/juj/emsdk/binaryen/master_64bit_binaryen
  set PATH $PATH /Users/$USER/Dropbox/dev/src/github.com/WebAssembly/wabt/bin
end
