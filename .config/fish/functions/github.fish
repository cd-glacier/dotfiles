# peco * ghq
function github
  ghq list --full-path | peco | read dist
  cd $dist
end


