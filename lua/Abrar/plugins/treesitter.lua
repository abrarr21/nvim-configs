return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		version = false,
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			local ts = require("nvim-treesitter")

			-- NEW API: setup() only takes highlight/indent/folds now
			ts.setup({
				highlight = { enable = true },
				indent = { enable = true },
			})

			-- ensure_installed is now done via install(), not setup()
			local ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"go",
				"yaml",
				"html",
				"css",
				"python",
				"lua",
				"vim",
				"vimdoc",
				"dockerfile",
				"markdown",
				"markdown_inline", -- needed by render-markdown.nvim
			}
			-- only install missing parsers, not all on every startup
			local installed = require("nvim-treesitter.config").get_installed()
			local to_install = vim.tbl_filter(function(p)
				return not vim.tbl_contains(installed, p)
			end, ensure_installed)
			if #to_install > 0 then
				ts.install(to_install)
			end

			-- incremental selection is now a Neovim builtin (v_an, v_in etc.)
			-- use <C-space> to start visual then an/in to expand/contract
			vim.keymap.set("n", "<C-space>", "van", { remap = true, desc = "Start treesitter node selection" })
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
				per_filetype = {
					["html"] = { enable_close = true },
					["typescriptreact"] = { enable_close = true },
				},
			})
		end,
	},
}
