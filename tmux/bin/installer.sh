#!bin/bash

echo "##### link tmux setting files ######"
LINK_FILES=(.tmux.conf)

for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null

	ln -sf $(PWD)/tmux/$file ~/$file; \
done

echo "##### finish to link tmux setting files ######"
