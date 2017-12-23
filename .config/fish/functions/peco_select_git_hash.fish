function peco_select_git_hash
  git log --full-history --date=format:'%Y/%m/%d %H:%M:%S' --pretty=format:'%h [%ad] %an : %s' | peco | awk '{print $1}' | read foo

  if [ $foo ]
    commandline -a $foo
  end
end
