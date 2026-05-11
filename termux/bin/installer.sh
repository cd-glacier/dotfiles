#!/bin/bash

pkg update && pkg upgrade

pkg install git \
	golang \
	npm \
	gh \
	make

go install github.com/x-motemen/ghq@latest
npm install -g @anthropic-ai/claude-code@2.1.112 --force

