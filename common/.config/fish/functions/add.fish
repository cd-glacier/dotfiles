function add
  set targetFiles (git diff --name-only) (git ls-files -o --exclude-standard)

  if [ (count $targetFiles) -gt 0 ]
    set changedFiles (git status --short | fzfcat -m --preview 'fish -c "preview_git_file {}"')

    for file in $changedFiles
      set file (string split " " (get_git_file $file))
      set staging? $file[1]
      set file_status $file[2]
      set file_name $file[3]

      echo git add $file_name
      git add $file_name
    end
  else
    echo "Your branch is clean"
  end
end

