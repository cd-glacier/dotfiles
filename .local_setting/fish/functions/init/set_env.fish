
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

  git config --global core.editor 'nvim -c "set fenc=utf-8"'
end
