" fish使ってるとエラー出ることがある
set shell=/bin/bash

""""エンコード""""
set encoding=UTF-8
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set termencoding=UTF-8
set fileformats=unix,dos,mac

""""表示系""""
" 色付き表示
syntax on
" 行番号の表示
set number
" カーソル行の強調
set cursorline
" 右下に表示される行・列の番号を表示する
set ruler
" 不可視文字を表示
"set list
" 検索した文字を強調
set nohlsearch
" タイトル表示
set title
" 対応括弧をハイライト表示する 
set showmatch 
" 対応括弧の表示秒数を3秒にする
set matchtime=3
"ポップアップバーの色
hi Pmenu ctermbg=6
hi PmenuSel ctermbg=4
hi PmenuSbar ctermbg=2
hi PmenuThumb ctermfg=3
" markdownのハイライトを有効にする
set syntax=markdown
au BufRead,BufNewFile *.md set filetype=markdown
" ステータスライン
set laststatus=2
" メッセージ表示欄
"set cmdheight=2
" コマンドを画面下に表示させる
"set showcmd
" タブ、空白、改行の可視化
"set list
"set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
" vue.js
autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html
" □や○文字が崩れる問題を解決
"set ambiwidth=double
" Scala HighLight
map ,st :%!java -jar /home/me/bin/scalariform.jar -f -q +compactControlReadability +alignParameters +alignSingleLineCaseStatements +doubleIndentClassDeclaration +preserveDanglingCloseParenthesis +rewriteArrowSymbols +preserveSpaceBeforeArguments --stdin --stdout <CR>
" spell check
" setlocal spell spelllang=en_us

""""操作系""""
" tabをスペース2個分に
set tabstop=2
" vimが自動で生成するtab幅をスペース2個に
set shiftwidth=2
" 入力モード中に素早くJJと入力した場合はESCとみなす
inoremap jj <Esc>
" INSERTモードでもhjkl移動を可能に
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" 文字がない場所にもカーソルを移動できるようにする
"set virtualedit=all 
" backspace効かないので
set backspace=indent,eol,start
" マウス対応
"set mouse=a
"set ttymouse=xterm2
" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %
" インクリメンタルサーチ. １文字入力毎に検索を行う
set incsearch
" 検索パターンに大文字小文字を区別しない
set ignorecase
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase
" 検索結果をハイライト
set hlsearch
" クリップボードにコピー
set clipboard+=unnamed
" クリップボードからペーストのときインデントしない
if &term =~ "xterm"
	let &t_SI .= "\e[?2004h"
	let &t_EI .= "\e[?2004l"
	let &pastetoggle = "\e[201~"
	function XTermPasteBegin(ret)
		set paste
		return a:ret
	endfunction
	inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"""others"""
" 補完の際の大文字小文字の区別しない
set infercase
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
" vi非互換モード
set nocompatible
" json format
autocmd BufWritePre *.json :execute '%!python -m json.tool'

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/glacier/.config/dein/./repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/glacier/.config/dein/.')
  call dein#begin('/Users/glacier/.config/dein/.')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/glacier/.config/dein/./repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
 	" vim config 
	" call dein#add('Shougo/neosnippet.vim')
  " call dein#add('Shougo/neosnippet-snippets')
	
	" vim-airline
  call dein#add('vim-airline/vim-airline')
	" vim-airline-themes
  call dein#add('vim-airline/vim-airline-themes')
	" indentLine
  call dein#add('Yggdroot/indentLine')
	filetype plugin indent on     " required!
	" NERDTree
	call dein#add("scrooloose/nerdtree")
	" color schema tender.vim
	call dein#add("jacoborus/tender.vim")
	" 括弧補完
	call dein#add("cohama/lexima.vim")
	" markdown
	call dein#add('godlygeek/tabular')
	call dein#add('plasticboy/vim-markdown')
	" vim-json
	call dein#add("elzr/vim-json")
	let g:vim_json_syntax_conceal = 0
	" deoplete
	call dein#add('Shougo/deoplete.nvim')
	let g:deoplete#enable_at_startup = 1
	" cuto ctagsa
	call dein#add("soramugi/auto-ctags.vim")
  let g:auto_ctags = 1

	" go lang
	" vim-go
	call dein#add('fatih/vim-go')
	autocmd BufWritePre *.go GoImports 
	"gocode	補完
	call dein#add('https://github.com/nsf/gocode')
	"godef gd で定義ジャンプ 
	call dein#add('https://github.com/rogpeppe/godef')
	
	" Scala
	" sytax highlight
	call dein#add('https://github.com/derekwyatt/vim-scala')
	" scalaファイル読み込み時にsetf scala
	au BufNewFile,BufRead *.scala setf scala

	" JavaScript
	" ES6 syntax highlight
	call dein#add('othree/yajs.vim') 
	" vim-esformatter
	call dein#add('millermedeiros/vim-esformatter')
	" jsxで保存時にesformatter
	autocmd BufWritePre *.jsx Esformatter
	autocmd BufWritePre *.js Esformatter
	
  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

""""vim-airline""""
let g:airline_section_a = airline#section#create(['mode','','branch'])
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set guifont=Ricty\ Regular\ for\ Powerline:h14
let g:Powerline_symbols = 'fancy'
set t_Co=256
" theme
let g:airline_theme='tender'
"let g:airline_left_sep = 'I'
let g:airline_left_sep = 'I'
"let g:airline_right_sep = '⮂'
let g:airline_right_sep = 'I'
"let g:airline_linecolumn_prefix = '⭡'
let g:airline_linecolumn_prefix = 'I'
"let g:airline_branch_prefix = '⭠ '
let g:airline_branch_prefix = 'I'
"let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_sep = 'I'
"let g:airline#extensions#tabline#left_alt_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = 'I'
"let g:airline#extensions#readonly#symbol = '⭤ '
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#readonly#enabled = 0
let g:airline_section_b = ""
let g:airline_section_c = "%t %M "

" finally called
colorscheme tender
"End dein Scripts-------------------------

