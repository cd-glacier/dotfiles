# current dirから検索してnvim
function fvim 
	find . -type f | peco --prompt " edit for >><(( o> " | read file
  echo $file
	nvim $file
end

