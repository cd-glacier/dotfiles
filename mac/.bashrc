
# const
export LANG=en_US.UTF-8
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='fd --exclude "*.class"'

# alias
alias g=git

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# func
repo() {
  cd $(ghq list --full-path | fzf --reverse \
    --preview-window down:30 \
    --bind ctrl-d:preview-down \
    --bind ctrl-u:preview-up \
    --preview 'bat --color always {}/README.md')
}

# prompt
eval "$(starship init bash)"

