.PHONY: help nvim fish mac tmux
.DEFAULT_GOAL := help

init: nvim fish mac tmux gitconfig gitignore_global rc health ## setup and install all

nvim-clean: ## when python3 neovim is broken, run this command.
	rm -rf /usr/local/lib/python3.7/site-packages/
	brew uninstall --ignore-dependencies python3
	rm -rf ~/.config/dein/.cache
	rm -rf ~/.config/dein/cache_nvim
	brew install python3
	pip3 install neovim

clean: ## delete auto created file and directory
	rm -rf ~/langserver

nvim: ## install and setup neovim
	bash ./nvim/bin/installer.sh

fish: ## install and setup fish
	bash ./fish/bin/installer.sh

tmux: ## install and setup tmux
	bash ./tmux/bin/installer.sh

mac: ## install mac app
	bash ./mac/bin/installer.sh

darker-slack: ## this command do not have idempotency. Run once. Restart slack after running this command.
	bash ./mac/bin/darker-slack.sh

gitignore-global: ## link and add gitignore_global to gitconfig
	if [ -f ~/.gitignore_global ]; then unlink ~/.gitignore_global&>/dev/null; fi
	ln -sf $(PWD)/mac/.gitignore_global ~/.gitignore_global
	git config --global core.excludesfile ~/.gitignore_global

rc: ## link .rc files
	bash ./mac/bin/rc-setup.sh

gitconfig: ## setup gitconfig and so on... Don't run this command without my pc.
	if [ -f ~/.gitconfig ]; then unlink ~/.gitconfig&>/dev/null&>/dev/null; fi
	ln -sf $(PWD)/mac/.gitconfig ~/.gitconfig

bash: ## link bash_profile Don't run this command without my pc.
	bash ./mac/bin/bash.sh

health: ## check whether my dotfiles are linked
	bash ./bin/check-health.sh

help: ## show help to make
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

