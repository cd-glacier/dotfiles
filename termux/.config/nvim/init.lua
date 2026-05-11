vim.g.mapleader = " "

vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard = "unnamedplus"

-- jj to escape in insert mode
vim.keymap.set('i', 'jj', '<Esc>', { silent = true })

-- move by display line
vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })
vim.keymap.set('v', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('v', 'k', 'gk', { noremap = true, silent = true })
