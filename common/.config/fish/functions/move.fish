# current dirから検索して移動
function move 
	find . -type d | peco --prompt " go to >><(( o> " | read dist
	cd $dist
end

