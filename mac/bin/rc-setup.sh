#!bin/bash

echo "##### link .rc files ######"
LINK_FILES=(.ideavimrc .vimrc .pryrc .xvimrc .myclirc)

for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null

	ln -sf $(PWD)/mac/$file ~/$file; \
done

echo "##### finish to link .rc files ######"
