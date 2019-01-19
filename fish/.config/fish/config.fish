
##### vi mode #####
# vi modeではなんか[I]みたいなの出るからオーバーライド
function fish_mode_prompt
end

## vi mode
fish_vi_key_bindings

##### prompt #####

## __fish_git_prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_show_informative_status 'yes'

## prompt
function fish_prompt
	set git_user (git config --get user.name)

  set_color red
  echo -n ❱ ""
	set_color yellow
  if test -z $git_user
  else
    echo -n $git_user ❱ ""
  end
	set_color green
  echo -n (__fish_git_prompt "%s") ❱ ""
	set_color blue
  echo (prompt_pwd)

	set_color magenta
  echo ❯❯❯ ""
end


