
# const
export LANG=en_US.UTF-8
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='fd --exclude "*.class"'

# alias
alias g=git
alias commit="git commit"
alias git_branch="git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'"

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

pullstream() {
  echo "git fetch upstream"
  git fetch upstream
  echo "git rebase upstream/master"
  git rebase upstream/master
}

# prompt
eval "$(starship init bash)"

