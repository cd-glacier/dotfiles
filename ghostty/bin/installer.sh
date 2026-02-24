#!/bin/bash

echo "##### link setting files ######"

LINK_FILES=(.config/ghostty/config)

for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null

	ln -sf $(PWD)/ghostty/$file ~/$file; \
done

echo "##### finish to link setting files ######"
