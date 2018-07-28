LINKED_COMMON_FILES = .config/dein .config/fish .config/nvim .config/peco .gitignore_global .ideavimrc
LINKED_LOCAL_FILES = .bash_profile .tmux.conf
LINKED_FILES += $(LINKED_COMMON_FILES)
LINKED_FILES += $(LINKED_LOCAL_FILES)

init: install link dein

install:
	sh ./bin/installer.sh

delete:
	if [ -d ~/.config/dein ]; then rm -rf ~/.config/dein; fi
	if [ -d ~/.config/fish ]; then rm -rf ~/.config/fish; fi
	if [ -d ~/.config/nvim ]; then rm -rf ~/.config/nvim; fi

link: delete
	for file in $(LINKED_COMMON_FILES); do \
		ln -sf $(PWD)/../common/$$file ~/$$file; \
	done
	for file in $(LINKED_LOCAL_FILES); do \
		ln -sf $(PWD)/$$file ~/$$file; \
	done

unlink:
	for file in $(LINKED_FILES); do \
		unlink ~/$$file; \
	done

dein:
	cd ../common/.config/dein;\
	sh ./installer.sh .

gitconfig:
		ln -sf $(PWD)/../common/.gitconfig ~/.gitconfig; \
