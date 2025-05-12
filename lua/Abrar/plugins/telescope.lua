return {
	"nvim-telescope/telescope.nvim",
	build = ":TSUpdate",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"andrew-george/telescope-themes",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.load_extension("fzf")
		telescope.load_extension("themes")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
					},
				},
			},
			extensions = {
				themes = {
					enable_previewer = true,
					enable_live_preview = true,
					persist = {
						enabled = true,
						path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
					},
				},
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })

		--  Live Grep
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Fuzzy Grep in files (Live Grep)" })
		vim.keymap.set("n", "<leader>fw", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end, { desc = "Find Connected Words under cursor" })

		vim.keymap.set(
			"n",
			"<leader>ft",
			"<cmd>Telescope themes<CR>",
			{ noremap = true, silent = true, desc = "Theme Switcher" }
		)

		-- ✅ New Keymap: Find Active Buffers
		vim.keymap.set("n", "<leader>fb", function()
			require("telescope.builtin").buffers({
				sort_lastused = true, -- Sort buffers by last used
				ignore_current_buffer = true, -- Exclude current buffer from list
			})
		end, { desc = "Find active buffers" })
	end,
}
