
setup: install terminal-setup

install:
	sh installer.sh

terminal-setup: dein link

dein:
	cd .config/dein;\
	sh ./bin/installer.sh .
	
link:
	ln -sf $(PWD)/.config ~/.config
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf
	ln -sf $(PWD)/.gitignore ~/.gitignore
	ln -sf $(PWD)/.gitignore_global ~/.gitignore_global
	ln -sf $(PWD)/.ideavimrc ~/.ideavimrc
	ln -sf $(PWD)/.gitconfig ~/.gitconfig

apply-local-setting:
	sh ./bin/apply-local-setting.sh

g-hyoga_setting: 
	ln -sf $(PWD)/.local_setting ~/.local_setting
