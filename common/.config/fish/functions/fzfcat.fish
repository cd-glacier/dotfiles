
function fzfcat
  fzf --reverse \
    --preview-window down:26 \
    --bind ctrl-d:preview-down \
    --bind ctrl-u:preview-up \
    $argv
end
