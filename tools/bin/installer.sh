#!/bin/bash

tools=(grpc-call memo ghe-noti co pr)

for file in "${tools[@]}"; do
  echo "link $file to /usr/local/bin"
	ln -sf "$(PWD)/tools/$file" "/usr/local/bin/$(basename $file)"

  echo "link completions"
  ln -sf "$(PWD)/tools/completions/$file.fish" "$HOME/.config/fish/completions/$file.fish"
done

echo 'done'
