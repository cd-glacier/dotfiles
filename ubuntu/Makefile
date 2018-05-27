init: install link dein xmodmap

install:
	sh ./bin/installer.sh

delete:
	if [ -d ~/.config/dein ]; then rm -rf ~/.config/dein; fi
	if [ -d ~/.config/fish ]; then rm -rf ~/.config/fish; fi
	if [ -d ~/.config/nvim ]; then rm -rf ~/.config/nvim; fi

link: delete
	ln -sf $(PWD)/../common/.config/dein ~/.config/dein
	ln -sf $(PWD)/../common/.config/fish ~/.config/fish
	ln -sf $(PWD)/../common/.config/nvim ~/.config/nvim
	ln -sf $(PWD)/../common/.config/peco ~/.config/peco
	ln -sf $(PWD)/../common/.gitconfig ~/.gitconfig
	ln -sf $(PWD)/../common/.gitignore_global ~/.gitignore_global
	ln -sf $(PWD)/../common/.ideavimrc ~/.ideavimrc
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf
	ln -sf $(PWD)/.Xmodmap ~/.Xmodmap
	sudo ln -sf $(PWD)/bin/run-xmodmap.sh /etc/profile.d/

unlink:
	unlink ~/.config/dein
	unlink ~/.config/fish
	unlink ~/.config/nvim
	unlink ~/.config/peco
	unlink ~/.tmux.conf
	unlink ~/.gitconfig
	unlink ~/.gitignore_global
	unlink ~/.ideavimrc
	unlink ~/.Xmodmap
	sudo unlink /etc/profile.d/run-xmodmap.sh

dein:
	cd ../common/.config/dein;\
	sh ./installer.sh .

xmodmap:
	xmodmap ~/.Xmodmap

