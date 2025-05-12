local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Ctrl+o for entering new line in insert mode
vim.keymap.set("i", "<C-o>", "<Esc>o", { noremap = true, silent = true })

--Cursor movement while in Insert mode
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true, silent = true })

-- Save files with ctrl+s
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { noremap = true, silent = true })

-- Vertical Scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- Delete single characters without copying into register
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })

-- Delete without Yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d"]])

-- Move a line up and down
vim.keymap.set("n", "<A-k>", ":move -2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<A-j>", ":move +1<CR>==", { desc = "Move line down" })

-- Move the selected para up and down
vim.keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv", { desc = "Move line up in visual mode" })
vim.keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv", { desc = "Move line down" })

-- Clear the clipboard
vim.api.nvim_set_keymap("n", "<leader>cb", ":let @+ = ''<CR>", { noremap = true, silent = true })

-- Searched item will be centred in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move the selected text right and left
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Highlight Yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
