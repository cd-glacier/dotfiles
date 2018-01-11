
setup: install terminal-setup

install:
	sh installer.sh

terminal-setup: dein link

dein:
	cd .config/dein;\
	sh installer.sh .
	
link:
	ln -sf $(PWD)/.config ~/.config
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf
	ln -sf $(PWD)/.vimrc ~/.vimrc
	ln -sf $(PWD)/.gitignore ~/.gitignore
	ln -sf $(PWD)/.gitignore_global ~/.gitignore_global
	ln -sf $(PWD)/.ideavimrc ~/.ideavimrc
	ln -sf $(PWD)/.zshrc ~/.zshrc

