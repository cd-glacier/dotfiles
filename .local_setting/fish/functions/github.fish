# peco * ghq
function github
  ghq list --full-path | peco | read dist
  commandline $dist
end


