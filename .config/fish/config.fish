# 初期設定
switch (echo $USER)
  case glacier
    # Golang
    set -x GOPATH $HOME/Dropbox/dev
    #set -x GOROOT /usr/local/go
    set -x PATH $PATH $GOROOT/bin
    set -x PATH $PATH $GOPATH/bin

    # gitcommit_message
    git config --global commit.template ""
    git config --global --remove-section commit
  case '*'
    # gitcommit_message
    set -x GITCOMMIT_MESSAGE_FILE ".gitcommit_message"
    set -x GITCOMMIT_MESSAGE_PATH ~
    git config --global commit.template "$GITCOMMIT_MESSAGE_PATH/$GITCOMMIT_MESSAGE_FILE"
end

# vi modeではなんか[I]みたいなの出るからオーバーライド
function fish_mode_prompt 
end

## vi mode
fish_vi_key_bindings

# ubuntuで使うと消える
## prompt
function fish_prompt 
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
		echo (prompt_pwd) ">><(( ○> "
	end
end

#gitのbranch名の抽出
function git_branch
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
end

#右prompt
function fish_right_prompt
	echo [(git_branch)]
end

