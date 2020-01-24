
export LANG=en_US.UTF-8

# go
export GOPATH=~/Dropbox/dev
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on

# rust
source $HOME/.cargo/env

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export FZF_DEFAULT_COMMAND='fd --exclude "*.class"'

