
function gd
  set commits (git log --oneline | peco --prompt " Select two commit(Ctrl-L) >><(( o> ")

  set first_commit_id (string split -m1 ' ' $commits[1])
  set second_commit_id (string split -m1 ' ' $commits[2])

  set selected_files ( \
    git diff --name-only $first_commit_id[1] $second_commit_id[1] \
    | peco --prompt "you want to see >><(( o> " \
  )
  
  for file in $selected_files
    git diff $first_commit_id[1] $second_commit_id[1] -- $file
  end
end
