# fzf * ghq
function github
  ghq list --full-path | fzfcat --preview 'bat --color always {}/README.md' | read dist
  commandline $dist
end


