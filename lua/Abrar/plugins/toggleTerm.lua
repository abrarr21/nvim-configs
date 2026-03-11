return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local toggleterm = require("toggleterm")
		local Terminal = require("toggleterm.terminal").Terminal

		toggleterm.setup({
			open_mapping = "<leader>\\", -- easy toggle key
			direction = "float", -- floating terminal
			float_opts = { border = "curved", winblend = 5 },
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			shading_factor = 2,
			shade_terminals = true,
			on_open = function(term)
				local opts = { buffer = term.buf, noremap = true, silent = true }

				-- Exit terminal mode
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)

				-- Window navigation
				vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
				vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
				vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
				vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)

				-- Close terminal quickly
				vim.keymap.set("t", "<C-q>", [[<C-\><C-n>:q<CR>]], opts)
			end,
		})
	end,
}
