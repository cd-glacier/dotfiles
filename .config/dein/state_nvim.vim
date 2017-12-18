if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/glacier/Dropbox/dev/src/github.com/g-hyoga/dotfiles/.config/nvim/init.vim'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/glacier/.config/dein/.'
let g:dein#_runtime_path = '/Users/glacier/.config/dein/./.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/glacier/.config/dein/./.cache/init.vim'
let &runtimepath = '/Users/glacier/.config/nvim,/etc/xdg/nvim,/Users/glacier/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/Users/glacier/.config/dein/./repos/github.com/Shougo/dein.vim,/Users/glacier/.config/dein/./.cache/init.vim/.dein,/usr/local/Cellar/neovim/0.2.0_1/share/nvim/runtime,/Users/glacier/.config/dein/./.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/glacier/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/glacier/.config/nvim/after,/Users/glacier/.config/dein/repos/github.com/Shougo/dein.vim'
filetype off
