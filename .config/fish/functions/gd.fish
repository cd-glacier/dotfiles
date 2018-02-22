
function gd
  git log --oneline | peco | read first_commit
  echo "selected: $first_commit"
  sleep 0.4
  git log --oneline | peco | read second_commit
  echo "selected: $second_commit"

  set first_commit_id (string split -m1 ' ' $first_commit)

  set second_commit_id (string split -m1 ' ' $second_commit)

  git diff $first_commit_id[1] $second_commit_id[1]
end

