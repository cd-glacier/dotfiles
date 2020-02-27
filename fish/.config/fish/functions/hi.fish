
function hi
  set option $argv

  history -z | fzf --read0 \
    --reverse \
    --preview 'echo {} | bat --color always --language bash' \
    --preview-window top:15 \
    --bind ctrl-d:preview-down \
    --bind ctrl-u:preview-up \
  | perl -pe 'chomp if eof' \
  | read -lz result

  if [ "$option" = "remove" ]
    echo remove from history: $result
    history delete --exact --case-sensitive "$result"
  else
    commandline -- "$result"
  end
end

