function grm
  set changedFiles (git status --short | fzfcat -m --preview 'fish -c "preview_git_file {}"' | awk '{print $2}')

  for file in $changedFiles
    g rm -f $file
  end
end
