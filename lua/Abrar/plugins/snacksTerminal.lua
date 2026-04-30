return {
	{
		"folke/snacks.nvim",
		opts = {
			terminal = {
				win = {
					position = "float",
					width = 0.6,
					border = "rounded",
				},
			},
		},
		keys = {
			{
				"<leader>\\",
				function()
					Snacks.terminal()
				end,
				desc = "Toggle Terminal",
			},
		},
		config = function(_, opts)
			require("snacks").setup(opts)

			-- terminal keymaps
			vim.api.nvim_create_autocmd("TermOpen", {
				callback = function()
					local opts = { noremap = true, silent = true, buffer = 0 }

					vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
					vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)

					vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
					vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
					vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
					vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)

					vim.keymap.set("t", "<C-q>", [[<C-\><C-n>:q<CR>]], opts)
				end,
			})
		end,
	},
}
