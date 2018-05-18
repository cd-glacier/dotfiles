init: install link dein xmodmap

install:
	sh ./bin/installer.sh

delete:
	rm -rf ~/.config/dein
	rm -rf ~/.config/fish
	rm -rf ~/.config/nvim
	rm -rf ~/.config/peco

link: clean unlink
	ln -sf $(PWD)/.config/dein ~/.config/dein
	ln -sf $(PWD)/.config/fish ~/.config/fish
	ln -sf $(PWD)/.config/nvim ~/.config/nvim
	ln -sf $(PWD)/.config/peco ~/.config/peco
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf
	ln -sf $(PWD)/.gitignore ~/.gitignore
	ln -sf $(PWD)/.gitconfig ~/.gitconfig
	ln -sf $(PWD)/.gitignore_global ~/.gitignore_global
	ln -sf $(PWD)/.ideavimrc ~/.ideavimrc
	ln -sf $(PWD)/.Xmodmap ~/.Xmodmap
	ln -sf $(PWD)/bin/run-xmodmap.sh /etc/profile.d/

unlink:
	unlink ~/.config/dein
	unlink ~/.config/fish
	unlink ~/.config/nvim
	unlink ~/.config/peco
	unlink ~/.tmux.conf
	unlink ~/.gitignore
	unlink ~/.gitconfig
	unlink ~/.gitignore_global
	unlink ~/.ideavimrc
	unlink ~/.Xmodmap
	unlink /etc/profile.d/run-xmodmap.sh


dein:
	cd .config/dein;\
	sh ./installer.sh .

xmodmap:
	xmodmap ./.Xmodmap

