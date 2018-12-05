.PHONY: help nvim fish mac
.DEFAULT_GOAL := help

init: nvim fish mac terminal git ## setup and install all

clean: ## delete auto created file and directory
	rm -rf ~/langserver

nvim-clean: ## when python3 neovim is broken, run this.
	rm -rf /usr/local/lib/python3.7/site-packages/
	brew uninstall --ignore-dependencies python3
	rm -rf ~/.config/dein/.cache
	rm -rf ~/.config/dein/cache_nvim
	brew install python3
	pip3 install neovim

nvim: ## install and setup neovim
	bash ./nvim/bin/installer.sh

fish: ## install and setup fish
	bash ./fish/bin/installer.sh

mac: ## install mac app
	bash ./mac/bin/installer.sh

terminal: ## setup terminal setting
	bash ./mac/bin/terminal-setup.sh

git: ## setup gitconfig and so on...
	bash ./mac/bin/git-setup.sh

help: ## show help to make
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

