function greset
  set stagedFileCount (count (git diff --name-only --staged))

  if [ $stagedFileCount -gt 0 ]
    set changedFiles (git diff --name-only --staged | peco --prompt " Select reset file(Ctrl-L) >><(( o> ")
    for file in $changedFiles
      echo git reset $file
      git reset $file
    end
  else 
    echo "added file does not exist"
  end
end
