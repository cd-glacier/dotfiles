
export LANG=en_US.UTF-8

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export FZF_DEFAULT_COMMAND='fd --exclude "*.class"'

export EDITOR=nvim

alias g=git

repo() {
  cd $(ghq list --full-path | fzf --reverse \
    --preview-window down:30 \
    --bind ctrl-d:preview-down \
    --bind ctrl-u:preview-up \
    --preview 'bat --color always {}/README.md')
}
