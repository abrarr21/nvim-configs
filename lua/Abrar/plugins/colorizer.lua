return {
	-- Tailwind color squares in nvim-cmp completion menu
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		config = function()
			require("cmp").setup({
				formatting = {
					format = require("tailwindcss-colorizer-cmp").formatter,
				},
			})
		end,
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
			},
		},
	},
}
