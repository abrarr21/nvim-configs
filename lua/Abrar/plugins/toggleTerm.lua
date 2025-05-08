return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		open_mapping = "<leader>tt", -- Mapping to open/close the terminal
		shade_filetypes = {}, -- Adjust the filetypes to be shaded (if any)
		shade_terminals = true, -- Enable shading for terminal windows
		shading_factor = 2, -- Degree of shading (0-3)
		start_in_insert = true, -- Start in insert mode when opening a terminal
		insert_mappings = true, -- Allow insert mappings in terminal mode
		terminal_mappings = true, -- Enable terminal key mappings
		persist_size = true, -- Persist the terminal size across sessions
		direction = "horizontal", -- Set the terminal direction (horizontal, vertical, float, tab)
		on_open = function(term)
			-- Ensure the buffer exists and then apply key mappings
			if term and term.buf then
				vim.api.nvim_buf_set_keymap(term.buf, "t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(term.buf, "t", "jk", [[<C-\><C-n>]], { noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(
					term.buf,
					"t",
					"<C-h>",
					[[<Cmd>wincmd h<CR>]],
					{ noremap = true, silent = true }
				)
				vim.api.nvim_buf_set_keymap(
					term.buf,
					"t",
					"<C-j>",
					[[<Cmd>wincmd j<CR>]],
					{ noremap = true, silent = true }
				)
				vim.api.nvim_buf_set_keymap(
					term.buf,
					"t",
					"<C-k>",
					[[<Cmd>wincmd k<CR>]],
					{ noremap = true, silent = true }
				)
				vim.api.nvim_buf_set_keymap(
					term.buf,
					"t",
					"<C-l>",
					[[<Cmd>wincmd l<CR>]],
					{ noremap = true, silent = true }
				)
				vim.api.nvim_buf_set_keymap(
					term.buf,
					"t",
					"<C-w>",
					[[<C-\><C-n><C-w>]],
					{ noremap = true, silent = true }
				)
			end
		end,
	},
}
