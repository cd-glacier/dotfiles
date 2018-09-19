function gl
  set commits (git log --no-merges --date=short --pretty='format:%C(yellow)%h %C(green)%cd %C(blue)%an%C(red)%d %C(reset)%s' | fzfdefault -m --ansi --prompt 'select two commits > ')

  if [ (count $commits) -lt 2 ]
    echo "Please select two commits."
  else
    set -x first_commit_id "init"
    set -x second_commit_id "init"
    set -x first_commit_id (string split -m1 ' ' $commits[1])[1]
    set -x second_commit_id (string split -m1 ' ' $commits[2])[1]

   git diff --name-only $second_commit_id[1] $first_commit_id[1] \
    | fzfcat --preview 'git diff --color=always $second_commit_id $first_commit_id -- {}'

    echo $commits
  end
end
