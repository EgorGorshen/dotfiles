vim.g.mapleader = ' '

vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('n', '<leader>e', ':Ex<CR>')
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'Y', "\"+y")

vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

