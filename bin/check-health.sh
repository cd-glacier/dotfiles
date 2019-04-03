#!bin/bash

alert() {
  echo -en "\033[31m"
  echo -n "Error: "
  echo -n $1
  echo -e "\033[m"
}

warn() {
  echo -en "\033[33m"
  echo -n "Warning: "
  echo -n $1
  echo -e "\033[m"
}

check_directory() {
  if [ ! -d $1 ]; then
    alert "not exists $1"
  else
    echo "ok: $1"
  fi
}

check_file() {
  if [ ! -f $1 ]; then
    $2 "not exists $1"
  else
    echo "ok: $1"
  fi
}

echo "##### check health #####"

echo "----- check brew -----"
if [ -z $(which brew) ]; then
  warn "not exists brew command."
fi

echo "----- check ~/.config -----"

if [ ! -d ~/.config ]; then
  alert "not exits ~/.config"
else
  echo "----- check ~/.config/nvim -----"
  if [ ! -d ~/.config/nvim ]; then
    alert "not exists ~/.config/nvim"
  else
    check_file ~/.config/nvim/init.vim alert
    check_file ~/.config/nvim/dein.toml alert
    check_file ~/.config/nvim/spell/en.utf-8.add warn
  fi

  echo "----- check ~/.config/dein -----"
  check_directory ~/.config/dein alert

  echo "----- check ~/.config/fish -----"
  if [ ! -d ~/.config/fish ]; then
    alert "not exists ~/.config/fish"
  else
    check_file ~/.config/fish/config.fish alert
    check_directory ~/.config/fish/functions alert
  fi
fi

echo "----- check root dotfiles -----"
NECESSARY_FILES=(.bash_profile .tmux.conf)
for file in ${NECESSARY_FILES[@]}; do \
  check_file ~/$file alert
done

echo "----- check optional root dotfiles -----"
OPTION_FILES=(.ideavimrc .vimrc .gitconfig .gitignore_global .pryrc)
for file in ${OPTION_FILES[@]}; do \
  check_file ~/$file warn
done

echo "----- check langserver dir -----"
check_directory ~/langserver warn

