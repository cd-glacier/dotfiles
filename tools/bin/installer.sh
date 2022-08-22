#!/bin/bash

tools=(grpc-call ghe-noti co pr issue add push preview-git-file java-home)

for file in "${tools[@]}"; do
  echo "link $file to /usr/local/bin"
	ln -sf "$(PWD)/tools/$file" "/usr/local/bin/$(basename $file)"
done

echo 'done'
