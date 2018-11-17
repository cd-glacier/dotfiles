function greset
  set stagedFileCount (count (git diff --name-only --staged))

  if [ $stagedFileCount -gt 0 ]
    set changedFiles (git diff --name-only --staged | fzfcat --preview 'git diff --color=always --cached {}')
    for file in $changedFiles
      echo git reset $file
      git reset $file
    end
  else
    echo "added file does not exist"
  end
end
