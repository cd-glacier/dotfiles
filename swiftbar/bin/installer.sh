#!/bin/bash

files=(ghe-notification.10s.sh)

brew install swiftbar

if [[ -z "ls $HOME | grep swiftbar" ]]; then
  mkdir "$HOME/swiftbar"
fi

for file in "${files[@]}"; do
  echo "link $file to $HOME/swiftbar"
	ln -sf "$(PWD)/swiftbar/$file" "$HOME/swiftbar/$(basename $file)"
done

echo 'done'

