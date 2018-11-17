.PHONY: help nvim fish
.DEFAULT_GOAL := help

clean: ## delete auto created file and directory
	rm -rf ~/langserver

nvim: ## install and setup neovim
	bash ./nvim/bin/installer.sh

fish: ## install and setup fish
	bash ./fish/bin/installer.sh

help: ## show help to make
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

