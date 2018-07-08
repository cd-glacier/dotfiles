set TARGETS ~/Dropbox/tmp-work ~/Dropbox/doshisha

function move 
  find $TARGETS -type d | peco --prompt " go to >><(( o> " | read dist
	cd $dist
end

