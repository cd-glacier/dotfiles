
function gd
  git log --oneline | peco --prompt "select first commit >><(( o> " | read first_commit
  echo "selected: $first_commit"
  # 速すぎると選択した感がなかった
  sleep 0.3
  git log --oneline | peco --prompt "select first commit >><(( o> " | read second_commit
  echo "selected: $second_commit"

  set first_commit_id (string split -m1 ' ' $first_commit)
  set second_commit_id (string split -m1 ' ' $second_commit)

  git diff --name-only $first_commit_id[1] $second_commit_id[1] \
  | peco --prompt "you want to see >><(( o> " \
  | read selected_file
  
  git diff $first_commit_id[1] $second_commit_id[1] -- $selected_file
end
