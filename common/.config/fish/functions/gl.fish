function gl
  set commits (git log --oneline | fzfdefault -m --prompt 'select two commits > ')

  if [ (count $commits) -lt 2 ]
    echo "Please select two commits."
  else
    set -x first_commit_id "init"
    set -x second_commit_id "init"
    set -x first_commit_id (string split -m1 ' ' $commits[1])[1]
    set -x second_commit_id (string split -m1 ' ' $commits[2])[1]

    git diff --name-only $first_commit_id[1] $second_commit_id[1] \
    | fzfcat --preview 'git diff --color=always $first_commit_id $second_commit_id -- {}'
  end
end

