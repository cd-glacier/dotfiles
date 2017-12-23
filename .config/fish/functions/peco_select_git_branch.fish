function peco_select_git_branch
  git branch -a |  tr -d ' ' | tr -d '*' | sed -e 's|^remotes/||g' | peco | awk '{print $1}' | read foo

  if [ $foo ]
    commandline -a $foo
  end
end
