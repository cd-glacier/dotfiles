function bash_c
  read --prompt="echo 'write bash script: '" bash_script
  bash -c $bash_script
end
