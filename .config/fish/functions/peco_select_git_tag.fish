function peco_select_git_tag
  git tag | peco | awk '{print $1}' | read foo

  if [ $foo ]
    commandline -a $foo
  end
end
