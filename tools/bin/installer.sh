#!/bin/bash

tools=(grpc-call memo ghe-noti co pr issue add push preview-git-file xcode studio rubymine idea java-home idea datagrip)

for file in "${tools[@]}"; do
  echo "link $file to /usr/local/bin"
	ln -sf "$(PWD)/tools/$file" "/usr/local/bin/$(basename $file)"
done

echo 'done'
