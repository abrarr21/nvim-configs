return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "BufReadPost",

		opts = {
			suggestion = {
				enabled = not vim.g.ai_cmp,
				auto_trigger = true,
				hide_during_completion = vim.g.ai_cmp,
				keymap = {
					accept = "<M-l>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			panel = { enabled = false },

			filetypes = {
				-- Core web
				javascript = true,
				typescript = true,
				javascriptreact = true,
				typescriptreact = true,
				html = true,
				css = true,
				scss = true,
				json = true,

				-- Frameworks
				svelte = true,
				vue = true,
				astro = true,

				-- Backend
				lua = true,
				python = true,
				go = true,
				rust = true,
				php = true,
				java = true,
				sh = true,
				bash = true,
				yaml = true,
				toml = true,

				-- Markup & docs
				markdown = true,
				markdown_inline = true,

				-- Configs
				dockerfile = true,
				Dockerfile = true,
				make = true,
				gitcommit = true,
				gitrebase = true,

				-- Neovim/editor
				help = true,
				vim = true,

				-- Disable for everything else
				["*"] = false,
			},
		},

		config = function(_, opts)
			vim.g.copilot_no_tab_map = true
			require("copilot").setup(opts)

			-- 🟢 Toggle key
			local enabled = not vim.g.ai_cmp
			vim.api.nvim_create_user_command("CopilotToggle", function()
				enabled = not enabled
				if enabled then
					vim.cmd("Copilot enable")
					vim.notify("✅ Copilot enabled", vim.log.levels.INFO)
				else
					vim.cmd("Copilot disable")
					vim.notify("🚫 Copilot disabled", vim.log.levels.WARN)
				end
			end, {})

			-- 🔧 Keymap: <leader>cc to toggle Copilot
			vim.keymap.set("n", "<leader>cop", "<cmd>CopilotToggle<CR>", { desc = "Toggle Copilot" })
		end,
	},

	-- 🔌 Optional nvim-cmp integration
	{
		"zbirenbaum/copilot-cmp",
		dependencies = "zbirenbaum/copilot.lua",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
