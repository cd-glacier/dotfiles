
function fzfcat
  fzf --reverse \
    --preview-window down:30 \
    --bind ctrl-d:preview-down \
    --bind ctrl-u:preview-up \
    $argv
end
