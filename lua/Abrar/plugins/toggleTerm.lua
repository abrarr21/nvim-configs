return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local toggleterm = require("toggleterm")

		toggleterm.setup({
			open_mapping = "<leader>]", -- Toggle terminal
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			direction = "float", -- Keep float mode
			float_opts = {
				border = "curved",
				winblend = 0,
			},
			on_open = function(term)
				-- Escape and movement in terminal
				local opts = { buffer = term.buf, noremap = true, silent = true }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
				vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
			end,
		})
	end,
}
