
##### vi mode #####
# vi modeではなんか[I]みたいなの出るからオーバーライド
function fish_mode_prompt
end

## vi mode
fish_vi_key_bindings

##### prompt #####

## prompt
function fish_prompt
  set u (string split -r -m2 '/' (pwd))
	set branch_status $u[2]:(git_branch)

  set_color red
  echo -n ❱ ""
	set_color yellow
  if test -z $branch_status
  else
    echo -n $branch_status ❱ ""
  end
	set_color green
  echo -n $fish_bind_mode ❱ ""
	set_color blue
  echo (prompt_pwd)

	set_color magenta
  echo ❯❯❯ ""
end

#gitのbranch名の抽出
function git_branch
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
end

