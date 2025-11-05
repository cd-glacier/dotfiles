#!/bin/bash

echo "##### link CLAUDE Code setting files ######"
LINK_FILES=(.claude/CLAUDE.md .claude/settings.json)

for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null

	ln -sf $(PWD)/claudecode/$file ~/$file; \
done

echo "##### finish to link CLAUDE Code setting files ######"
