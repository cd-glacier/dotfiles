# current dirから検索して移動
function move 
	find . -type d | peco | read dist
	cd $dist
end

