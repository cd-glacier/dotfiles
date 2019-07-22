function gstatus
  set targetFiles (git status --short | awk '{print $2}')

  if [ (count $targetFiles) -gt 0 ]
    set changedFiles (git status --short | fzfcat -m --preview 'fish -c "preview_git_file {}"')
  else
    echo "git status is clean."
  end
end

