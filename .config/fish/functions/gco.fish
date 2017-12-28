function pre_git_commit
  echo pre
  switch (echo $USER)
  case glacier

  case '*'
    echo format java
    ./bin/mvn.sh formatter:format

    echo creating gitcommit_message file 
    set branch (git_branch)
    string split -r -m1 - $branch | read commit_template
    touch "$GITCOMMIT_MESSAGE_PATH/$GITCOMMIT_MESSAGE_FILE"
    echo "$commit_template-" > "$GITCOMMIT_MESSAGE_PATH/$GITCOMMIT_MESSAGE_FILE"
  end
end

function gco $argv
  pre_git_commit
  echo git commit
  git commit $argv
end

