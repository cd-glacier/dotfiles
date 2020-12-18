syntax on

set shell=/bin/bash
set encoding=UTF-8
set termencoding=UTF-8
set fileformats=unix,dos,mac
set fileencodings=utf-8

set number
set ruler
set nohlsearch
set title
set showmatch
set matchtime=3
set syntax=markdown
set laststatus=2
" set spelllang+=cjk
" set spell
set synmaxcol=200
set cursorline
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start
set incsearch
set ignorecase
set smartcase
set hlsearch
set clipboard+=unnamedplus
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
set infercase
set wildmode=longest:full,full
set matchpairs& matchpairs+=<:>
set nocompatible
set ttimeout
set ttimeoutlen=50

let g:python_host_prog='/usr/local/bin/python2'
let g:python3_host_prog='/opt/brew/bin/python3'

hi Pmenu ctermbg=6
hi PmenuSel ctermbg=4
hi PmenuSbar ctermbg=2
hi PmenuThumb ctermfg=3
hi clear SpellBad
hi SpellBad cterm=underline
" set filetype
au BufRead,BufNewFile *.md set filetype=markdown

autocmd ColorScheme * highlight LineNr ctermfg=10
" for java
autocmd Filetype java setlocal ts=8 sts=4 sw=4 expandtab

let loaded_matchparen = 1

nnoremap j gj
nnoremap k gk
nnoremap tt :tabnew<CR>
nnoremap ee :e .<CR>

inoremap jj <Esc>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

cmap w!! w !sudo tee > /dev/null %

command JQ %!jq '.'

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

highlight clear SignColumn

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

" vim-rainbow
au FileType java,ruby,json,go call rainbow#load()

nnoremap <silent> <C-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>
