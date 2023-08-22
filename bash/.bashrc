# const
export LANG=en_US.UTF-8
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='fd --exclude "*.class"'
export PGCLIENTENCODING=utf-8 # for pgcli

# bash
export PATH="/opt/homebrew/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# read custom bashrc
for rc in $(ls ~/.config/custom_bashrc/); do
  . ~/.config/custom_bashrc/$rc
done

