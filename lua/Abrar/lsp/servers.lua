-- servers.lua — LSP server configurations (Neovim 0.11+)
-- Required at the end of lspconfig.lua's config function,
-- AFTER nvim-lspconfig has loaded its defaults, so our settings win.

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits", "command", "data" },
}

-- graphql (only attaches if a GraphQL config file is found)
vim.lsp.config("graphql", {
	capabilities = capabilities,
	root_markers = {
		".graphqlrc",
		".graphqlrc.json",
		".graphqlrc.yaml",
		".graphqlrc.yml",
		".graphqlrc.js",
		"graphql.config.js",
		"graphql.config.json",
		"graphql.config.yaml",
	},
	workspace_required = true,
})

-- gopls
vim.lsp.config("gopls", {
	capabilities = capabilities,
	root_markers = { "go.work", "go.mod" },
	settings = {
		gopls = {
			memoryMode = "DegradeClosed",
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

-- lua_ls
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
					vim.fn.stdpath("config") .. "/lua",
				},
				checkThirdParty = false,
			},
		},
	},
})

-- emmet_language_server
vim.lsp.config("emmet_language_server", {
	capabilities = capabilities,
	filetypes = {
		"css",
		"eruby",
		"html",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"pug",
		"svelte",
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

-- vtsls (avoids attaching in Deno projects)
vim.lsp.config("vtsls", {
	capabilities = capabilities,
	root_markers = { "tsconfig.json", "package.json", "jsconfig.json" },
	single_file_support = false,
	flags = {
		debounce_text_changes = 150,
	},
	settings = {
		-- FIX 2: top-level key that enables function call completion globally
		complete_function_calls = true,

		vtsls = {
			autoUseWorkspaceTsdk = true,
			enableMoveToFileCodeAction = true,
			experimental = {
				-- FIX 1: server-side fuzzy match — completions appear much faster
				-- vtsls filters candidates itself instead of sending everything to nvim-cmp
				completion = {
					enableServerSideFuzzyMatch = true,
					entriesLimit = 100, -- cap results sent per request (default is unbounded)
				},
			},
		},

		typescript = {
			updateImportsOnFileMove = { enabled = "always" },
			suggest = { completeFunctionCalls = true },

			-- FIX 3 + 4: tsserver process tuning
			tsserver = {
				-- Split into syntax server (fast) + semantic server (thorough)
				-- Completions now come from the syntax server without waiting for type-checks
				useSeparateSyntaxServer = true,
				-- Hard cap on memory — prevents the SIGABRT crash every ~10 minutes
				-- Raise to 8192 if you have RAM to spare and work on large codebases
				maxTsServerMemory = 4096,
				-- Throttle how often tsserver re-analyses open files
				experimental = {
					enableProjectDiagnostics = false, -- set true only if you want whole-project errors
				},
				log = "off", -- don't waste I/O writing tsserver logs unless debugging
			},

			preferences = {
				-- "non-relative" = "import from 'src/utils/foo'" instead of "../../../utils/foo"
				-- swap to "project-relative" if your project uses path aliases like @/
				importModuleSpecifier = "non-relative",
			},

			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = false }, -- FIX: was missing, shows arg types
				enumMemberValues = { enabled = false },
				functionLikeReturnTypes = { enabled = false },
				propertyDeclarationTypes = { enabled = false },
				variableTypes = { enabled = false }, -- keep off — too noisy
			},
		},

		javascript = {
			updateImportsOnFileMove = { enabled = "always" },
			suggest = { completeFunctionCalls = true },
			inlayHints = {
				parameterNames = { enabled = "literals" },
				variableTypes = { enabled = false },
				returnTypes = { enabled = true },
			},
		},
	},
})

-- denols (only attaches in Deno projects)
vim.lsp.config("denols", {
	capabilities = capabilities,
	root_markers = { "deno.json", "deno.jsonc" },
	workspace_required = true,
})
