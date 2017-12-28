# current dirから検索してnvim
function fvim 
	find . -type f | peco | read file
  echo $file
	nvim $file
end

