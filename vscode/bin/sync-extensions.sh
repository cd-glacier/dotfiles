#!bin/bash

echo "##### create vscode extensions.list #####"

code --list-extensions > ./vscode/extensions.list
