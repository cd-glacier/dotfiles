
function hi
  history -z | fzfcat --read0 --preview 'echo {} | bat --color always --language bash' \
  | perl -pe 'chomp if eof' \
  | read -lz result
    and commandline -- $result
end

