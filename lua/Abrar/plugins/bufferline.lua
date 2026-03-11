return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	event = "BufReadPre", -- Load bufferline when a buffer is read (faster startup)
	opts = {
		options = {
			mode = "buffers", -- Show file buffers in bufferline
			numbers = "none",
			diagnostics = "nvim_lsp", -- Show LSP diagnostics on buffers
			separator_style = "slant",
			show_buffer_close_icons = true,
			show_close_icon = false,
			show_tab_indicators = true,
			always_show_bufferline = true,
			color_icons = true,
			buffer_close_icon = "",
			modified_icon = "✚",
			left_trunc_marker = "",
			right_trunc_marker = "",
			name_formatter = function(buf)
				return vim.fn.fnamemodify(buf.name, ":t") -- Show filename only
			end,
			diagnostics_update_in_insert = false, -- update LSP diagnostics only in normal mode (faster)
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)

		-- Buffer navigation keymaps
		vim.keymap.set("n", "<leader>dd", "<cmd>bdelete<CR><cmd>bnext<CR>", { desc = "Delete buffer and go to next" })
		vim.keymap.set("n", "<leader>dq", ":bdelete!<CR>", { desc = "Force delete buffer (even unnamed/unsaved)" })
		vim.keymap.set("n", "<leader>bn", ":enew<CR>", { desc = "New buffer" })

		-- Added faster buffer cycling/navigation using "Tab / Shift+Tab"
		vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer (Tab)" })
		vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer (Shift+Tab)" })

		-- Tab management keymaps removed as it isn't used. Add here if needed.

		-- Show LSP diagnostics in bufferline faster
		vim.opt.updatetime = 250 -- Reduce delay for hover diagnostics
	end,
}
