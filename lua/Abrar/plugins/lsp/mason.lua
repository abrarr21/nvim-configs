-- mason.lua — installs servers and enables them via vim.lsp.enable (Neovim 0.11+)
-- server configurations live in servers.lua, loaded after lspconfig in lspconfig.lua
return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- Mason UI
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- Mason LSPConfig — just ensure servers are installed and enabled
		-- all vim.lsp.config() calls are in servers.lua
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"html",
				"cssls",
				"gopls",
				"marksman",
				"vtsls",
			},

			handlers = {
				function(server_name)
					local ignore = {
						denols = true,
					}
					if not ignore[server_name] then
						vim.lsp.enable(server_name)
					end
				end,
			},
		})

		-- Tools (formatters, linters) — not LSP servers
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"pylint",
				"eslint_d",
			},
		})
	end,
}
