export LANG=en_US.UTF-8
export EDITOR=nvim

export PATH="$PREFIX/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export FZF_DEFAULT_COMMAND='fd --exclude "*.class"'

for rc in ~/.config/custom_bashrc/*; do
  [ -f "$rc" ] && . "$rc"
done
