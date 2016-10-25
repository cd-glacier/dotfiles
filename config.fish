## 
set -x GOPATH $HOME/Dropbox/dev
set -x GOROOT /usr/local/go
set -x PATH $PATH $GOROOT/bin
set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH $HOME/.anyenv/bin
for env in (ls $HOME/.anyenv/envs)
	set -x PATH $PATH $HOME/.anyenv/envs/$env/shims
end
eval (anyenv init -)

## vi mode
fish_vi_key_bindings

# vi modeではなんか[I]みたいなの出るからオーバーライド
function fish_mode_prompt 
end

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
		echo (prompt_pwd) ">><(( ○> .○⚪︎ "
	end
end

#gitのbranch名出す
function git_branch
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
end

#右prompt
function fish_right_prompt
	echo (git_branch)
end

## cd後にls 
function cd 
	builtin cd $argv; and ls
end

# alias
## rmでゴミ箱に入れる
alias rm='rmtrash'
## 開発場所
alias g-hyoga="cd ~/Dropbox/dev/src/github.com/g-hyoga"
## 同志社
alias doshisha="cd ~/Dropbox/doshisha"

