" fish使ってるとエラー出ることがある
set shell=/bin/bash
""""エンコード""""
set encoding=UTF-8
set termencoding=UTF-8
set fileformats=unix,dos,mac
set fileencodings=utf-8

""""表示系""""
" 色付き表示
syntax on
" 行番号の表示
set number
autocmd ColorScheme * highlight LineNr ctermfg=10
" 右下に表示される行・列の番号を表示する
set ruler
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
" set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
" vue.js
autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html
" □や○文字が崩れる問題を解決
"set ambiwidth=double
" Scala HighLight
map ,st :%!java -jar /home/me/bin/scalariform.jar -f -q +compactControlReadability +alignParameters +alignSingleLineCaseStatements +doubleIndentClassDeclaration +preserveDanglingCloseParenthesis +rewriteArrowSymbols +preserveSpaceBeforeArguments --stdin --stdout <CR>
" spell check
set spelllang+=cjk
set spell
hi clear SpellBad
hi SpellBad cterm=underline
" set colorを制限して重くなるのを回避
set synmaxcol=200
" haskell indent
autocmd Filetype haskell setlocal ts=4 sts=4 sw=4 expandtab
" 括弧の対応色の色
let loaded_matchparen = 1
" cursor line
set cursorline
set cursorcolumn

""""操作系""""
" tabをスペース2個分に
set expandtab
set tabstop=2
" vimが自動で生成するtab幅をスペース2個に
set shiftwidth=2
" 入力モード中に素早くJJと入力した場合はESCとみなす
inoremap jj <Esc>
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
" INSERTモードでもhjkl移動を可能に
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %
" インクリメンタルサーチ. 1文字入力毎に検索を行う
set incsearch
" 検索パターンに大文字小文字を区別しない
set ignorecase
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase
" 検索結果をハイライト
set hlsearch
" クリップボードにコピー
set clipboard+=unnamedplus
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
" escape遅いの回避
set ttimeoutlen=10
" vim-tagsのjumpをgdに
nnoremap gd g<C-]>
" 新しいtabのコマンドをTに
command T tabnew
" json format with jq
command JQ %!jq '.'

"""others"""
" 補完の際の大文字小文字の区別しない
set infercase
" ex modeでの補完
set wildmode=longest:full,full
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
" vi非互換モード
set nocompatible
" json format
" autocmd BufWritePre *.json :execute '%!python -m json.tool'
" 文字化け対策
set ttimeout
set ttimeoutlen=50

function! <SID>AutoProjectRootCD()
  try
    if &ft != 'help'
      ProjectRootCD
    endif
  catch
    " Silently ignore invalid buffers
  endtry
endfunction

autocmd BufEnter * call <SID>AutoProjectRootCD()

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" ~/.config/deinで
" sh installer.sh .
" したと仮定
let deinroot = "~/.config/dein/."
let $DEIN_PATH= deinroot . "/repos/github.com/Shougo/dein.vim"
let s:toml = "~/.config/nvim/dein.toml"

" Required:
set runtimepath+=$DEIN_PATH

" Required:
if dein#load_state(deinroot)
  call dein#begin(deinroot)
  call dein#add($DEIN_PATH)
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

"End dein Scripts-------------------------

" http://cohama.hateblo.jp/?page=1376705613
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()
