.PHONY: help
.DEFAULT_GOAL := help

LINKED_COMMON_FILES = .config/dein .config/fish .config/nvim .config/peco .gitignore_global .ideavimrc
LINKED_LOCAL_FILES = .bash_profile .tmux.conf
LINKED_FILES += $(LINKED_COMMON_FILES)
LINKED_FILES += $(LINKED_LOCAL_FILES)

init: install link dein ## install all tool.

install: ## install tool with brew.
	sh ./bin/installer.sh

delete: ## clean dein, fish, neovim environment.
	if [ -d ~/.config/dein ]; then rm -rf ~/.config/dein; fi
	if [ -d ~/.config/fish ]; then rm -rf ~/.config/fish; fi
	if [ -d ~/.config/nvim ]; then rm -rf ~/.config/nvim; fi

link: delete ## link setting file to root directory.
	for file in $(LINKED_COMMON_FILES); do \
		ln -sf $(PWD)/../common/$$file ~/$$file; \
	done
	for file in $(LINKED_LOCAL_FILES); do \
		ln -sf $(PWD)/$$file ~/$$file; \
	done

unlink: ## unlink setting file.
	for file in $(LINKED_FILES); do \
		unlink ~/$$file; \
	done

dein: ## install dein.
	cd ../common/.config/dein;\
	sh ./installer.sh .

gitconfig: ## link .gitconfig. warning to rewrite your setting.
		ln -sf $(PWD)/../common/.gitconfig ~/.gitconfig; \

help: ## show help to make
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

