return {
	-- =========================================================
	-- 🔹 Noice: main UI for messages, cmdline, LSP progress
	-- =========================================================
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		enabled = true,
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {},
		config = function()
			local noice = require("noice")

			-- =========================================================
			-- Full Noice setup with cmdline formatting, views, LSP, routes
			-- =========================================================
			noice.setup({
				cmdline = {
					enabled = true,
					view = "cmdline_popup",
					format = {
						cmdline = { pattern = "", icon = "󱐌 :", lang = "vim" },
						help = { pattern = "^:%s*he?l?p?%s+", icon = " 󰮦 :" },
						search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
						search_up = { kind = "search", pattern = "^%?", icon = "/", lang = "regex" },
						filter = { pattern = "^:%s*!", icon = " $ :", lang = "bash" },
						lua = {
							pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
							icon = "  :",
							lang = "lua",
						},
						input = { view = "cmdline_input", icon = " 󰥻 :" },
					},
				},
				views = {
					popupmenu = {
						relative = "editor",
						position = { row = 8, col = "50%" },
						win_options = {
							winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
						},
					},
					mini = {
						size = { width = "auto", height = "auto", max_height = 15 },
						position = { row = -2, col = "100%" },
					},
				},
				lsp = {
					progress = { enabled = true },
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				routes = {
					{
						filter = {
							event = "msg_show",
							any = {
								{ find = "%d+L, %d+B" },
								{ find = "; after #%d+" },
								{ find = "; before #%d+" },
								{ find = "%d fewer lines" },
								{ find = "%d more lines" },
							},
						},
						opts = { skip = true },
					},
				},
				messages = { enabled = false }, -- don't show normal messages
				health = { checker = true },
				popupmenu = { enabled = true },
				signature = { enabled = true },
			})

			-- =========================================================
			-- Noice Keymaps
			-- =========================================================
			vim.keymap.set("n", "<leader>snd", function()
				require("noice").cmd("dismiss")
			end, { desc = "Dismiss All Noice Messages" })
			vim.keymap.set("n", "<leader>snl", function()
				require("noice").cmd("last")
			end, { desc = "Noice Last Message" })
			vim.keymap.set("n", "<leader>snh", function()
				require("noice").cmd("history")
			end, { desc = "Noice Message History" })
			vim.keymap.set("n", "<leader>sna", function()
				require("noice").cmd("all")
			end, { desc = "Noice All Messages" })
			vim.keymap.set("n", "<leader>snt", function()
				require("noice").cmd("pick")
			end, { desc = "Noice Picker" })

			-- Scroll in Noice messages
			vim.keymap.set({ "i", "n", "s" }, "<C-f>", function()
				if not require("noice.lsp").scroll(4) then
					return "<C-f>"
				end
			end, { expr = true, silent = true, desc = "Scroll Forward in Noice" })

			vim.keymap.set({ "i", "n", "s" }, "<C-b>", function()
				if not require("noice.lsp").scroll(-4) then
					return "<C-b>"
				end
			end, { expr = true, silent = true, desc = "Scroll Backward in Noice" })
		end,
	},

	-- =========================================================
	-- 🔹 nvim-notify: fallback for plugins using vim.notify
	-- =========================================================
	{
		"rcarriga/nvim-notify",
		opts = {
			stages = "fade",
			timeout = 500,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
		},
		config = function(_, opts)
			local notify = require("notify")
			notify.setup(opts)

			-- Only override vim.notify if Noice is NOT loaded
			if not package.loaded["noice"] then
				vim.notify = notify
			end

			-- Keymap to dismiss all notifications
			vim.keymap.set("n", "<leader>un", function()
				notify.dismiss({ silent = true, pending = true })
			end, { desc = "Dismiss All Notifications" })
		end,
	},
}
