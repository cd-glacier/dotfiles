
setup: install terminal-setup apply-local-setting g-hyoga_setting

install:
	sh installer.sh

terminal-setup: dein link

dein:
	cd .config/dein;\
	sh ./installer.sh .
	
link: 
	ln -sf $(PWD)/.config ~/.config
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf
	ln -sf $(PWD)/.gitignore ~/.gitignore
	ln -sf $(PWD)/.gitignore_global ~/.gitignore_global
	ln -sf $(PWD)/.ideavimrc ~/.ideavimrc
	ln -sf $(PWD)/.gitconfig ~/.gitconfig

unlink:
	unlink ~/.config
	unlink ~/.tmux.conf
	unlink ~/.gitignore
	unlink ~/.gitignore_global
	unlink ~/.ideavimrc
	unlink ~/.gitconfig

apply-local-setting:
	sh ./bin/apply-local-setting.sh

g-hyoga_setting: 
	ln -sf $(PWD)/.local_setting ~/.local_setting

