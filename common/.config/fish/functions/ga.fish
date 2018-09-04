function ga
  set targetFiles (git diff --name-only) (git ls-files -o --exclude-standard)

  if [ (count $targetFiles) -gt 0 ]
    set changedFiles (string split " " "$targetFiles" | fzfcat -m --preview 'git diff {}')
    for file in $changedFiles
      echo git add $file
      git add $file
    end
  else
    echo "Your branch is clean"
  end
end
