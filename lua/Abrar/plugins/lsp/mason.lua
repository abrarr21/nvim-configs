return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		require("neodev").setup()

		-- imports
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- capabilities for autocompletion
		local capabilities = cmp_nvim_lsp.default_capabilities()

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

		-- Mason LSPConfig
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"html",
				"cssls",
				"tailwindcss",
				"gopls",
				"emmet_ls",
				"emmet_language_server",
				"marksman",
			},

			-- ✅ new handler system
			handlers = {
				-- Default handler for all servers
				function(server_name)
					if server_name == "lua_ls" then
						return
					end

					vim.lsp.config(server_name, {
						capabilities = capabilities,
					})
					vim.lsp.enable(server_name)
				end,

				-- gopls
				["gopls"] = function()
					vim.lsp.config("gopls", {
						capabilities = capabilities,
						root_dir = vim.fs.root(0, { "go.work", "go.mod" }),
						settings = {
							gopls = {
								memoryMode = "DegradeClosed",
								-- reduce scanning
								directoryFilters = {
									"-.git",
									"-vendor",
									"-node_modules",
									"-third_party",
									"-scripts",
									"-tools",
									"-bazel-bin",
									"-bazel-out",
									"-bazel-testlogs",
									"-testdata",
									"-mock",
									"-mocks",
								},
								expandWorkspaceToModule = false,
								experimentalWorkspaceModule = false,

								--disable expensive stuffs
								staticcheck = false,
								semanticTokens = false,

								analyses = {
									unusedparams = true, -- keep them true for small-medium level projects, consider toggling it false when large repo/projects
									nilness = true, -- gopls warns when a function parameter is never used
									unusedwrite = true, -- warns when you assign to a variable but never read it
								},
								ui = {
									completion = {
										usePlaceholders = true,
									},
								},
							},
						},
					})
					vim.lsp.enable("gopls")
				end,

				-- lua_ls
				["lua_ls"] = function()
					vim.lsp.config("lua_ls", {
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								completion = {
									callSnippet = "Replace",
								},
								workspace = {
									library = {
										[vim.fn.expand("$VIMRUNTIME/lua")] = true,
										[vim.fn.stdpath("config") .. "/lua"] = true,
									},
								},
							},
						},
					})
					vim.lsp.enable("lua_ls")
				end,

				-- emmet_ls
				["emmet_ls"] = function()
					vim.lsp.config("emmet_ls", {
						capabilities = capabilities,
						filetypes = {
							"html",
							"typescriptreact",
							"javascriptreact",
							"css",
							"sass",
							"scss",
							"less",
							"svelte",
						},
					})
					vim.lsp.enable("emmet_ls")
				end,

				-- emmet_language_server
				["emmet_language_server"] = function()
					vim.lsp.config("emmet_language_server", {
						filetypes = {
							"css",
							"eruby",
							"html",
							"javascript",
							"javascriptreact",
							"less",
							"sass",
							"scss",
							"pug",
							"typescriptreact",
						},
						init_options = {
							includeLanguages = {},
							excludeLanguages = {},
							extensionsPath = {},
							preferences = {},
							showAbbreviationSuggestions = true,
							showExpandedAbbreviation = "always",
							showSuggestionsAsSnippets = false,
							syntaxProfiles = {},
							variables = {},
						},
					})
					vim.lsp.enable("emmet_language_server")
				end,

				-- denols
				["denols"] = function()
					vim.lsp.config("denols", {
						capabilities = capabilities,
						root_dir = vim.fs.root(0, { "deno.json", "deno.jsonc" }),
					})
					vim.lsp.enable("denols")
				end,

				-- tsserver
				["ts_ls"] = function()
					vim.lsp.config("ts_ls", {
						capabilities = capabilities,
						root_dir = function(fname)
							if vim.fs.root(fname, { "deno.json", "deno.jsonc" }) then
								return nil
							end
							return vim.fs.root(fname, { "tsconfig.json", "package.json", "jsconfig.json", ".git" })
						end,
						single_file_support = false,
						init_options = {
							preferences = {
								includeCompletionsWithSnippetText = true,
								includeCompletionsForImportStatements = true,
							},
						},
					})
					vim.lsp.enable("ts_ls")
				end,
			},
		})

		-- Mason tool installer
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"pylint",
				"clangd",
				"eslint_d",
			},
		})
	end,
}
