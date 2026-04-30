return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {

			-- Snacks Explorer
			-- HACK: doc @ github.com/folke/snacks.nvim/blob/main/docs
			explorer = {
				enabled = true,
				hidden = true, --show hidden (dot) files by default
				layout = {
					cycle = false,
				},
			},
			quickfile = {
				enabled = true,
				exclude = { "latex" },
			},

			-- snack notifier
			notifier = {
				enabled = true,
				timeout = 2000,
				style = "fancy",
			},

			-- Snacks Picker
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
					require("snacks").lazygit.log()
				end,
				desc = "Lazygit Logs",
			},
			{
				"<C-p>",
				function()
					require("snacks").explorer({ hidden = true })
				end,
				desc = "Open Snacks Explorer ",
			},

			-- -------------------------------------- Snack Picker ----------------------------------------------
			{
				"<leader>ff",
				function()
					require("snacks").picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fr",
				function()
					require("snacks").picker.recent()
				end,
				desc = "Recent Files",
			},
			{
				"<leader>fc",
				function()
					require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find Config File",
			},
			-- Grep
			{
				"<leader>fg",
				function()
					require("snacks").picker.grep()
				end,
				desc = "Live Grep",
			},
			{
				"<leader>fw",
				function()
					require("snacks").picker.grep_word()
				end,
				desc = "Grep Word Under Cursor",
				mode = { "n", "x" },
			},
			-- Buffers
			{
				"<leader>fb",
				function()
					require("snacks").picker.buffers()
				end,
				desc = "Find Buffers",
			},
			-- Help & keymaps
			{
				"<leader>fh",
				function()
					require("snacks").picker.help()
				end,
				desc = "Help Tags",
			},
			{
				"<leader>fk",
				function()
					require("snacks").picker.keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<leader>fo",
				function()
					require("snacks").picker.commands()
				end,
				desc = "Commands",
			},
			-- Theme switcher
			{
				"<leader>ft",
				function()
					require("snacks").picker.colorschemes()
				end,
				desc = "Theme Switcher",
			},
			-- Git
			{
				"<leader>gbr",
				function()
					require("snacks").picker.git_branches()
				end,
				desc = "Git Branches",
			},

			-- notification keys
			{
				"<leader>un",
				function()
					require("snacks").notifier.hide()
				end,
				desc = "Dismiss All Notifications",
			},
			{
				"<leader>nh",
				function()
					require("snacks").picker.notifications()
				end,
				desc = "Notification History",
			},
		},
	},
}
