#!bin/bash

echo "##### install vscode extensions #####"

EXTENSIONS=$(cat ./vscode/extensions.list)

for extension in ${EXTENSIONS[@]}; do \
    code --install-extension $extension; \
done
