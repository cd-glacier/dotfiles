#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
MISE_DIR=$(dirname $SCRIPT_DIR)

mkdir -p ~/.config/mise
unlink ~/.config/mise/config.toml &>/dev/null
ln -sf $MISE_DIR/.config/mise/config.toml ~/.config/mise/config.toml

echo "mise config linked"
