# Fig pre block. Keep at the top of this file.
export PATH="${PATH}:${HOME}/.local/bin"
eval "$(fig init bash pre)"

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

# read custom bashrc
for rc in $(ls ~/.config/custom_bashrc/); do
  . ~/.config/custom_bashrc/$rc
done

# Fig post block. Keep at the bottom of this file.
eval "$(fig init bash post)"

