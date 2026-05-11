#!/bin/bash

pkg update && pkg upgrade

pkg install git \
	golang \
	npm \
	gh \
	make \
	neovim \
	fzf \
	bat \
	starship

go install github.com/x-motemen/ghq@latest
npm install -g @anthropic-ai/claude-code@2.1.112 --force

SCRIPT_DIR=$(cd $(dirname $0); pwd)
TERMUX_DIR=$(dirname $SCRIPT_DIR)

echo "##### link termux config files ######"

mkdir -p ~/.termux
unlink ~/.termux/termux.properties &>/dev/null
ln -sf $TERMUX_DIR/.termux/termux.properties ~/.termux/termux.properties

mkdir -p ~/.config/nvim
unlink ~/.config/nvim/init.lua &>/dev/null
ln -sf $TERMUX_DIR/.config/nvim/init.lua ~/.config/nvim/init.lua

mkdir -p ~/.claude
unlink ~/.claude/CLAUDE.md &>/dev/null
ln -sf $TERMUX_DIR/.claude/CLAUDE.md ~/.claude/CLAUDE.md
unlink ~/.claude/settings.json &>/dev/null
ln -sf $TERMUX_DIR/.claude/settings.json ~/.claude/settings.json

unlink ~/.bashrc &>/dev/null
ln -sf $TERMUX_DIR/.bashrc ~/.bashrc
unlink ~/.bash_profile &>/dev/null
ln -sf $TERMUX_DIR/.bash_profile ~/.bash_profile

mkdir -p ~/.config/custom_bashrc
for f in 1000_claude_env 7777_setup_alias 8888_setup_func 9999_launch_starship; do
  unlink ~/.config/custom_bashrc/$f &>/dev/null
  ln -sf $TERMUX_DIR/.config/custom_bashrc/$f ~/.config/custom_bashrc/$f
done

unlink ~/.gitignore_global &>/dev/null
ln -sf $TERMUX_DIR/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

DOTFILES_DIR=$(dirname $TERMUX_DIR)
for tool in add push preview-git-file; do
  unlink $PREFIX/bin/$tool &>/dev/null
  ln -sf $DOTFILES_DIR/tools/$tool $PREFIX/bin/$tool
done

echo "##### finish linking ######"
echo "Run 'termux-reload-settings' to apply termux settings"
