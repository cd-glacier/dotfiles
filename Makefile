init: install-for-ubuntu link dein xmodmap

install-for-ubuntu:
	sh ./bin/installer-for-ubuntu.sh

link: 
	rm -rf ~/.config/dein
	rm -rf ~/.config/fish
	rm -rf ~/.config/nvim
	rm -rf ~/.config/peco
	ln -sf $(PWD)/.config/dein ~/.config/dein
	ln -sf $(PWD)/.config/fish ~/.config/fish
	ln -sf $(PWD)/.config/nvim ~/.config/nvim
	ln -sf $(PWD)/.config/peco ~/.config/peco
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

dein:
	cd .config/dein;\
	sh ./installer.sh .

xmodmap:
	xmodmap ./.Xmodmap
	
