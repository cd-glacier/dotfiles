init: install-for-ubuntu link dein local-setting apply-local-setting

install-for-ubuntu:
	sh ./bin/installer-for-ubuntu.sh

link: 
	ln -sf $(PWD)/.config ~/.config
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf
	ln -sf $(PWD)/.gitignore ~/.gitignore
	ln -sf $(PWD)/.gitignore_global ~/.gitignore_global
	ln -sf $(PWD)/.ideavimrc ~/.ideavimrc

unlink:
	unlink ~/.config
	unlink ~/.tmux.conf
	unlink ~/.gitignore
	unlink ~/.gitignore_global
	unlink ~/.ideavimrc
	unlink ~/.gitconfig

dein:
	cd .config/dein;\
	sh ./installer.sh .
	
local-setting: 
	ln -sf $(PWD)/.local_setting ~/.local_setting
	
apply-local-setting:
	ln -sf $(PWD)/.gitconfig ~/.gitconfig
	sh ./bin/apply-local-setting.sh
