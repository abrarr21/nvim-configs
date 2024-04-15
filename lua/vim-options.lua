vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"

vim.wo.number = true

vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')   --in normal mode to move to the pane above.
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')   --in normal mode to move to the pane below.
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')   --in normal mode to move to the pane to the left.
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')   --in normal mode to move to the pane to the right.


vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

