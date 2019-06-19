
set PATH $TO_FISH_PATH $PATH
fix_path

##### vi mode #####
# vi modeではなんか[I]みたいなの出るからOverride
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
set __fish_git_prompt_char_dirtystate '+'

## prompt
function fish_prompt
  set git_user (git config --get user.name)
  set git_prompt (__fish_git_prompt "%s")
  set columns (tput cols)

  set git_user_len (string length "$git_user")
  set git_prompt_len (string length "$git_prompt")
  set prompt_pwd_len (string length (prompt_pwd))
  set other_len (string length "❱ ❱ ❱ ")
  set prompt_len (math $git_user_len + $git_prompt_len + $prompt_pwd_len + $other_len)

  printf "%s%s " (set_color red) "❱"

  if [ $columns -gt $prompt_len ]
    # ❱ g-hyoga ❱ master|✔ ❱ ~/D/d/s/g/g/dotfiles
    printf "%s%s %s " (set_color yellow) $git_user "❱"
    printf "%s%s %s " (set_color green) (__fish_git_prompt "%s") "❱"
    printf "%s%s\n" (set_color blue) (prompt_pwd)
  else if [ $columns -le $prompt_len -a $columns -ge (math $prompt_len - $git_user_len) ]
    # ❱ ❱ master|✔ ❱ ~/D/d/s/g/g/dotfiles
    printf "%s%s " (set_color yellow) "❱"
    printf "%s%s %s " (set_color green) (__fish_git_prompt "%s") "❱"
    printf "%s%s\n" (set_color blue) (prompt_pwd)
  else if [ $columns -le (math $prompt_len - $git_user_len) -a $columns -ge (math $prompt_len - $git_user_len - $git_prompt_len) ]
    # ❱ ❱ ❱ ~/D/d/s/g/g/dotfiles
    printf "%s%s " (set_color yellow) "❱"
    printf "%s%s " (set_color green) "❱"
    printf "%s%s\n" (set_color blue) (prompt_pwd)
  end

  printf "%s%s " (set_color magenta) "❯❯❯"
end

## launch tmux

if [ -z (echo $TMUX) ]
  tmux
end

