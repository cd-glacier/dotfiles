#!bin/bash

install_command() {
  echo "----- install $1 -----"
  if [ -z $(which $1) ]; then
    brew install $1
  fi
}

echo "##### install cli tool #####"

install_command tmux
install_command ghq
install_command hub
install_command gh
install_command bat
install_command noti
install_command fd
install_command fx
install_command bash
install_command starship
install_command reattach-to-user-namespace

echo "##### link bash setting files ######"
LINK_FILES=(.bash_profile .bashrc)

for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null

	ln -sf $(PWD)/mac/$file ~/$file; \
done

echo "##### finish to link bash setting files ######"
