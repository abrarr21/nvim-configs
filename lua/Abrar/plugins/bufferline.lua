return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "buffers", -- Show file buffers in bufferline
			numbers = "none",
			diagnostics = "nvim_lsp",
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
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)

		-- Buffer navigation keymaps
		vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
		vim.keymap.set("n", "<leader>bn", ":enew<CR>", { desc = "New buffer" })
		vim.keymap.set("n", "<leader>1", ":bnext<CR>", { desc = "Next buffer" })
		vim.keymap.set("n", "<leader>2", ":bprevious<CR>", { desc = "Previous buffer" })

		-- Tab management keymaps
		vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
		vim.keymap.set("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close current tab" })
		vim.keymap.set("n", "L", "<cmd>tabn<CR>", { desc = "Go to next tab" })
		vim.keymap.set("n", "H", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
		vim.keymap.set("n", "<leader>tt", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
	end,
}
