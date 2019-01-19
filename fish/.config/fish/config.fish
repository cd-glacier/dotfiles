
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

  printf "%s%s " (set_color red) "❱"
  printf "%s%s %s " (set_color yellow) $git_user "❱"
  printf "%s%s %s "  (set_color green) (__fish_git_prompt "%s") "❱"
  printf "%s%s\n" (set_color blue) (prompt_pwd)

  printf "%s%s " (set_color magenta) "❯❯❯"
end
