return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			-- HACK: doc @ github.com/folke/snacks.nvim/blob/main/docs
			explorer = {
				enabled = true,
				layout = {
					cycle = false,
				},
			},
			quickfile = {
				enabled = true,
				exclude = { "latex" },
			},

			--HACK: read picker doc @ github.com/folke/snack.nvim/blob/man/docs/picker.md
			picker = {
				enabled = true,
				matchers = {
					frecency = true,
					cwd_bonus = true,
				},
				formatters = {
					file = {
						filename_first = false,
						filename_only = false,
						icon_width = 2,
					},
				},
				layout = {
					preset = "telescope",
					cycle = false,
				},
				layouts = {
					select = {
						preview = false,
						layout = {
							backdrop = false,
							width = 0.6,
							min_width = 80,
							height = 0.4,
							min_height = 10,
							box = "vertical",
							border = "rounded",
							title = "{title}",
							title_pos = "center",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
							{ win = "preview", title = "{preview}", width = 0.6, height = 0.4, border = "top" },
						},
					},
					telescope = {
						reverse = true, -- set false for search bar to be on top
						layout = {
							box = "horizontal",
							backdrop = false,
							width = 0.8,
							height = 0.9,
							border = "none",
							{
								box = "vertical",
								{ win = "list", title = "Results", title_pos = "center", border = "rounded" },
								{
									win = "input",
									height = 1,
									border = "rounded",
									title = "{title} {live} {flags}",
									title_pos = "center",
								},
							},
							{
								win = "preview",
								title = "{preview:Preview}",
								width = 0.50,
								border = "rounded",
								title_pos = "center",
							},
						},
					},
				},
			},
			dashboard = {
				enabled = true,
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 3 },
					{ section = "startup" },
					{
						section = "terminal",
						cmd = "ascii-image-converter /home/abrar/Pictures/Profiles.JPG -C -c",
						random = 10,
						pane = 2,
						indent = 4,
						height = 25,
					},
				},
			},
		},
		keys = {
			{
				"<leader>lg",
				function()
					require("snacks").lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>gl",
				function()
					require("snacks").lazygit().log()
				end,
				desc = "Lazygit Logs",
			},
			{
				"<leader>es",
				function()
					require("snacks").explorer()
				end,
				desc = "Open Snacks Explorer ",
			},
			{
				"<leader>rN",
				function()
					require("snacks").rename.rename_file()
				end,
				desc = "Fast Rename Current File ",
			},
			{
				"<leader>dB",
				function()
					require("snacks").bufdelete()
				end,
				desc = "Delete or Close Buffer (Confirm)",
			},
			-- Snack Picker
			{
				"<leader>pf",
				function()
					require("snacks").picker.files()
				end,
				desc = "Find Files (Snack Picker) ",
			},
			{
				"<leader>pc",
				function()
					require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find Config File ",
			},
			{
				"<leader>ps",
				function()
					require("snacks").picker.grep()
				end,
				desc = "Grep Word ",
			},
			{
				"<leader>pws",
				function()
					require("snacks").picker.grep_word()
				end,
				desc = "Search Visual selection or Word",
				mode = { "n", "x" },
			},
			{
				"<leader>pk",
				function()
					require("snacks").picker.keymaps({ layout = "ivy" })
				end,
				desc = "Search Keymaps (Snacks Picker)",
			},
			{
				"<leader>gbr",
				function()
					require("snacks").picker.git_branches({ layout = "select" })
				end,
				desc = "Pick and Switch Git Branch ",
			},
			{
				"<leader>th",
				function()
					require("snacks").picker.colorschemes({ layout = "ivy" })
				end,
				desc = "Pick Color Scheme ",
			},
			{
				"<leader>vh",
				function()
					require("snacks").picker.help()
				end,
				desc = "Help Page ",
			},
		},
	},

	{
		"folke/todo-comments.nvim",
		events = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"<leader>pt",
				function()
					require("snacks").picker.todo_comments()
				end,
				desc = "Todo",
			}, -- Find all the TODO comments (todo/fix/fixme)
			{
				"<leader>pT",
				function()
					require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
				end,
				desc = "Todo/fix/fixme",
			},
		},
	},
}
