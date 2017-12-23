function peco_select_git_file_with_status
  git status -s | peco | awk '{print $2}' | read foo

  if [ $foo ]
    commandline -a $foo
  end
end

