
# Golang
set -g GOPATH $HOME/Dropbox/dev
#set GOROOT /usr/local/go
set PATH $PATH $GOROOT/bin
set PATH $PATH $GOPATH/bin

# gitcommit_message
#git config --global commit.template ""
#git config --global --remove-section commit

# gitcommit_message
#set GITCOMMIT_MESSAGE_FILE ".gitcommit_message"
#set GITCOMMIT_MESSAGE_PATH ~
#git config --global commit.template "$GITCOMMIT_MESSAGE_PATH/$GITCOMMIT_MESSAGE_FILE"

# web assembly
set PATH $PATH /Users/$USER/Dropbox/dev/src/github.com/juj/emsdk/clang/fastcomp/build_incoming_64/bin
set PATH $PATH /Users/$USER/Dropbox/dev/src/github.com/juj/emsdk/node/8.9.1_64bit/bin
set PATH $PATH /Users/$USER/Dropbox/dev/src/github.com/juj/emsdk/emscripten/incoming
set PATH $PATH /Users/$USER/Dropbox/dev/src/github.com/juj/emsdk/binaryen/master_64bit_binaryen/bin
set -g EMSDK /Users/$USER/Dropbox/dev/src/github.com/juj/emsdk
#set -g EM_CONFIG /Users/$USER/.emscripten
set -g EMSCRIPTEN /Users/$USER/Dropbox/dev/src/github.com/juj/emsdk/emscripten/incoming
set -g BINARYEN_ROOT /Users/$USER/Dropbox/dev/src/github.com/juj/emsdk/binaryen/master_64bit_binaryen
set PATH $PATH /Users/$USER/Dropbox/dev/src/github.com/WebAssembly/wabt/bin
set LLVM_ROOT -g /Users/$USER/Dropbox/dev/src/github.com/juj/emsdk/clang/fastcomp/build_incoming_64/bin
set NODE_JS -g /Users/$USER/Dropbox/dev/src/github.com/juj/emsdk/node/8.9.1_64bit/bin/node
set EMSCRIPTEN_ROOT -g /Users/$USER/Dropbox/dev/src/github.com/juj/emsdk/emscripten/incoming

# vi modeではなんか[I]みたいなの出るからオーバーライド
function fish_mode_prompt 
end

## vi mode
fish_vi_key_bindings

# ubuntuで使うと消える
## prompt
function fish_prompt 
  if [ $status -eq 0 ]
    set fish_face ">><(( o> "
  else 
    set fish_face ">><(( x> "
  end

	if test "$fish_key_bindings" = "fish_vi_key_bindings"
		switch $fish_bind_mode
		case default
			set_color --bold red white
		case insert
			set_color --bold green white
		case replace-one
			set_color --bold green white
		case visual
			set_color --bold magenta white
		end
  end

  echo (prompt_pwd) $fish_face
end

#gitのbranch名の抽出
function git_branch
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
end

#右prompt
function fish_right_prompt
	echo [(git_branch)]
end

