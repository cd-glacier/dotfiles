function pre_git_commit
  echo pre
  switch (echo $USER)
  case glacier

  case '*'
    echo format java
    ./bin/mvn.sh formatter:format

    echo creating gitcommit_message file 
    set branch (git_branch)
    set list (string split -m2 - $branch)
    set commit_template "$list[1]-$list[2]-"
    touch "$GITCOMMIT_MESSAGE_PATH/$GITCOMMIT_MESSAGE_FILE"
    echo "$commit_template" > "$GITCOMMIT_MESSAGE_PATH/$GITCOMMIT_MESSAGE_FILE"
  end
end

function gco $argv
  pre_git_commit
  echo git commit
  git commit $argv
end

