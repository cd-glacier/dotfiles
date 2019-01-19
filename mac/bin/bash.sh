#!bin/bash

echo "##### link bash setting files ######"
LINK_FILES=(.bash_profile .bashrc)

for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null

	ln -sf $(PWD)/mac/$file ~/$file; \
done

echo "##### finish to link bash setting files ######"
