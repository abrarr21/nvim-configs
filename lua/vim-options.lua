vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true
opt.signcolumn = "yes"
opt.background = "dark"

opt.clipboard:append("unnamedplus")

--split windows
opt.splitright = true --split vertical window to the right
opt.splitbelow = true --split horizontal window to the bottom

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = true

vim.g.mapleader = " "
vim.g.background = "light"

vim.wo.number = true

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>") --in normal mode to move to the pane above.
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>") --in normal mode to move to the pane below.
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>") --in normal mode to move to the pane to the left.
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>") --in normal mode to move to the pane to the right.

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })                   -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })                 -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })                    -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })               -- close current split window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
vim.keymap.set("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
vim.keymap.set("n", "L", "<cmd>tabn<CR>", { desc = "Go to next tab" })                              --  go to next tab
vim.keymap.set("n", "H", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                          --  go to previous tab
vim.keymap.set("n", "<leader>tt", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Ctrl+o for entering new line in insert mode
vim.keymap.set("i", "<C-o>", "<Esc>o", { noremap = true, silent = true })

--Cursor movement while in Insert mode
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true, silent = true })

-- Save files with ctrl+s
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", { noremap = true, silent = true })

-- Vertical Scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- Delete single characters without copying into register
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })

-- Move a line up and down
vim.keymap.set("n", "<A-k>", ":move -2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<A-j>", ":move +1<CR>==", { desc = "Move line down" })

-- Clear the clipboard
vim.api.nvim_set_keymap("n", "<leader>cb", ":let @+ = ''<CR>", { noremap = true, silent = true })
