function pskill
  set pids (ps axo pid,user,args | fzfsmall)

  for ps_text in $pids
    set pid (string split " " $ps_text)
    echo "kill -9 $pid[1]"
    kill -9 $pid[1]
  end
end
