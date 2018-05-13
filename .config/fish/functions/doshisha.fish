# pecoでdoshishaファイルに移動
function doshisha
	#ディレクトリ名だけ
	find ~/Dropbox/doshisha -type d | peco | read dist
	# ファイル名
	#find ~/Dropbox/doshisha -type f | peco | read dist
	#dirname "$dist" | read dist
	cd $dist
end

