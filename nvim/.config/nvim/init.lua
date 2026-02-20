-- ==========================================================================
-- 1. lazy.nvim のセットアップ
-- ==========================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- 基本設定
vim.g.mapleader = " " -- スペースをリーダーキーに設定

-- 行番号を表示
vim.opt.number = true

-- 検索時に大文字小文字を区別しない（smartcaseと併用で大文字入力時のみ区別）
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 挿入モード(i)で jj を高速に入力した時に <Esc> とする
vim.keymap.set('i', 'jj', '<Esc>', { silent = true })

-- システムクリップボードと同期する
vim.opt.clipboard = "unnamedplus"

-- 表示行単位で移動するように変更
vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })
vim.keymap.set('v', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('v', 'k', 'gk', { noremap = true, silent = true })

-- ノーマルモードで ee を押すと NERDTree をトグル
vim.keymap.set('n', 'ee', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- ノーマルモードで tt を押すと新しいタブを開く
vim.keymap.set('n', 'tt', ':tabnew<CR>', { noremap = true, silent = true })

-- :JQ コマンドでバッファ全体のJSONをjqで整形
vim.api.nvim_create_user_command('JQ', '%!jq .', {})

-- ==========================================================================
-- 2. プラグイン構成
-- 1. lazy.nvim 自体のインストール
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. プラグインの設定
require("lazy").setup({
  -- 見た目系
  {
    'jacoborus/tender.vim',
    lazy = false, -- カラースキーマは起動時に必要なので遅延させない
    priority = 1000,
    config = function()
      vim.cmd('syntax enable')
      vim.cmd('colorscheme tender')
    end
  },

  {
    'vim-airline/vim-airline',
    dependencies = { 'vim-airline/vim-airline-themes' },
    init = function()
      vim.g.airline_theme = 'bubblegum'
      vim.g.airline_powerline_fonts = 1
      vim.g["airline#extensions#branch#enabled"] = 0
      vim.g["airline#extensions#readonly#enabled"] = 0
      vim.g["airline#extensions#tabline#enabled"] = 1
      vim.g.airline_section_c = ''
    end
  },

  { 'othree/yajs.vim', ft = 'javascript' }, -- ファイルタイプで遅延読み込み
  { 'ntpeters/vim-better-whitespace' },

  {
    'frazrepo/vim-rainbow',
    config = function()
      vim.g.rainbow_load_separately = {
        { '*', { {'(', ')'}, {'[', ']'}, {'{', '}'} } },
        { '*.{html,htm,tsx,jsx}', { {'(', ')'}, {'[', ']'}, {'{', '}'}, {'<\\a[^>]*>', '</[^>]*>'} } },
      }
      vim.g.rainbow_guifgs = {'RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick'}
      vim.g.rainbow_ctermfgs = {'lightblue', 'lightgreen', 'yellow', 'red', 'magenta'}
    end
  },

  {
    'chrisbra/Colorizer',
    init = function() vim.g.colorizer_auto_color = 1 end
  },

  {
    'Yggdroot/indentLine',
    init = function() vim.g.indentLine_bgcolor_gui = '#808080' end
  },

  { 'airblade/vim-gitgutter' },
  { 'tpope/vim-fugitive' },

  -- 機能系
  { 'scrooloose/nerdtree', dependencies = { 'ryanoasis/vim-devicons' } },
  { 'cohama/lexima.vim' },
  { 'Chiel92/vim-autoformat' },
  { 'Shougo/vimproc.vim', build = 'make' },

  {
    'ruanyl/vim-gh-line',
    init = function()
      vim.g.gh_line_map = 'ghline'
      vim.g.gh_github_domain = vim.env.GHE_DOMAIN
    end
  },

  { 'christoomey/vim-tmux-navigator' },

  -- fzf
  {
    'junegunn/fzf',
    build = './install --bin',
  },
  {
    'junegunn/fzf.vim',
    dependencies = { 'fzf' },
    config = function()
      -- Vimscriptのコマンド定義をそのまま移植
      vim.cmd([[
        command! -bang -nargs=* Ag
          \ call fzf#vim#ag(<q-args>,
          \                 <bang>0 ? fzf#vim#with_preview('up:60%')
          \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
          \                 <bang>0)

        command! -bang -nargs=* Files
          \ call fzf#vim#files(<q-args>,
          \                 <bang>0 ? fzf#vim#with_preview('up:60%')
          \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
          \                 <bang>0)
      ]])

      -- キーマッピング
      local opts = { silent = true }
      vim.keymap.set('n', '<space><space>', ':GFiles<CR>', opts)
      vim.keymap.set('n', '<space>h', ':History!<CR>', opts)
      vim.keymap.set('n', '<space>f', ':Rg<CR>', opts)
      vim.keymap.set('n', '<space>c', ':Commits<CR>', opts)
    end
  },
})
