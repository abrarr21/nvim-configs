return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {},
	keys = {
		{
			"zk",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"Zk",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"r", -- use vim-motion key(y,d,c) then press r then press where you wanna go then press (a=around, i=inside) then closing
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},
		{
			"R", -- (visual, pending mode) then R then type your searching word and select
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter Search",
		},
		{
			"<c-s>",
			mode = { "c" }, --in command line mode (when searching any word in command line mode using / then use ctrl+s for activating flash)
			function()
				require("flash").toggle()
			end,
			desc = "Toggle Flash Search",
		},
	},
}
