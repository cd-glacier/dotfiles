#!bin/bash

echo "##### create vscode extensions.list #####"

code --list-extensions > ./vscode/extensions.list

git diff --color=always -- ./vscode/extensions.list

echo "done"
