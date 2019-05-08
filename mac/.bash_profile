
export LANG=en_US.UTF-8

export GOPATH=~/Dropbox/dev
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on

export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

exec fish
