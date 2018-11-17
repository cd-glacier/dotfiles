set TARGETS ~/workspace

function move
  find $TARGETS -type d | fzfcat --preview 'cd {} && tree -L 3' | read dist
	cd $dist
end

