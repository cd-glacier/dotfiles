""""エンコード""""
set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8

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
"set laststatus=2
" メッセージ表示欄
"set cmdheight=2
" コマンドを画面下に表示させる
"set showcmd

""""操作系""""
" tabをスペース2個分に
set tabstop=2
" vimが自動で生成するtab幅をスペース2個に
set shiftwidth=2
" escapeをCNRL-cに
inoremap <C-c> <Esc>      
" 入力モード中に素早くJJと入力した場合はESCとみなす
inoremap jj <Esc>
" INSERTモードでもhjkl移動を可能に
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" 文字がない場所にもカーソルを移動できるようにする
set virtualedit=all 
" backspace効かないので
set backspace=indent,eol,start
" マウス対応
set mouse=a
set ttymouse=xterm2
" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk


""""???""""
" 補完の際の大文字小文字の区別しない
set infercase
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>

" vi非互換モード
set nocompatible
"辞書ファイルの自動読み込み
autocmd FileType cs :set dictionary=~/.vim/dict/unity.dict

""""Vundle""""
set nocompatible               " be iMproved
filetype off                   " required!

" let Vundle manage Vundle
" required! 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
" Vundle自身を管理対象に加えているヶ所
" この行を消すとVundle自身を管理出来なくなる。
Bundle 'gmarik/vundle'

" My Bundles here:
"
" 以下にインストールしたいプラグインのgitリポジトリを列挙
Bundle 'https://github.com/Shougo/vimshell.git'
" vimshell使うのに必要
" cd ~/.vim/bundle/vimproc
" make -f make_~~~~.mak
Bundle 'https://github.com/Shougo/vimproc'

filetype plugin indent on     " required!

""""vimshell""""
" ,is: シェルを起動
nnoremap <silent> ,is :VimShell<CR>
