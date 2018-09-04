# fzf * ghq
function github
  ghq list --full-path | fzf --reverse --border --preview 'cat {}/README.md' --preview-window down:20 | read dist
  commandline $dist
end


