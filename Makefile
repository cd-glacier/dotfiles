.PHONY: help nvim mac tmux tools bash wezterm yabai-skhd sketchybar
.DEFAULT_GOAL := help

clean: ## delete auto created file and directory
	rm -rf ~/langserver

nvim: ## install and setup neovim
	bash ./nvim/bin/installer.sh

bash: ## install and setup bash
	bash ./bash/bin/installer.sh

tmux: ## install and setup tmux
	bash ./tmux/bin/installer.sh

wezterm: ## install and setup wezterm
	bash ./wezterm/bin/installer.sh

mac: ## install mac app
	bash ./mac/bin/installer.sh

sketchybar: ## install sketchybar and link config files
	bash ./sketchybar/bin/installer.sh

tools: ## link my tools
	bash ./tools/bin/installer.sh

yabai-skhd: ## link yabairc and skhdrc
	bash ./yabai_skhd/bin/installer.sh

gitignore-global: ## link and add gitignore_global to gitconfig
	if [ -f ~/.gitignore_global ]; then unlink ~/.gitignore_global&>/dev/null; fi
	ln -sf $(PWD)/mac/.gitignore_global ~/.gitignore_global
	git config --global core.excludesfile ~/.gitignore_global

rc: ## link .rc files
	bash ./mac/bin/rc-setup.sh

gitconfig: ## setup gitconfig and so on... Don't run this command without my pc.
	if [ -f ~/.gitconfig ]; then unlink ~/.gitconfig&>/dev/null&>/dev/null; fi
	ln -sf $(PWD)/mac/.gitconfig ~/.gitconfig

health: ## check whether my dotfiles are linked
	bash ./bin/check-health.sh

help: ## show help to make
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

