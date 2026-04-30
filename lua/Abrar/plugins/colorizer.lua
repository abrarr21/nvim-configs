return {
	-- Tailwind color squares in nvim-cmp completion menu
	-- formatting is handled in cmp.lua, no cmp.setup() call needed here
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		opts = {},
		-- config = function()
		-- 	require("cmp").setup({
		-- 		formatting = {
		-- 			format = require("tailwindcss-colorizer-cmp").formatter,
		-- 		},
		-- 	})
		-- end,
	},

	-- Buffer color highlighting
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			filetypes = {
				"html",
				"css",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"jsx",
				"tsx",
				"vue",
				"svelte",
				"go",
				"markdown",
			},
			default_options = {
				names = true,
				RGB = true,
				RRGGBB = true,
				AARRGGBB = true,
				tailwind = "both",
				mode = "background",
			},
		},
	},
}
