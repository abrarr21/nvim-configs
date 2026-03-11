return {
	"karb94/neoscroll.nvim",
	config = function()
		require("neoscroll").setup({
			mappings = {
				"<C-u>", -- scroll half-page up
				"<C-d>", -- scroll half-page down
				"<C-y>", -- scroll by one line
				"<C-e>",
				"zt",
				"zz",
				"zb",
			},
			hide_cursor = true,
			stop_eof = false,
			respect_scrolloff = false,
			cursor_scrolls_alone = true,
			duration_multiplier = 1.0,
			easing = "linear",
			pre_hook = nil,
			post_hook = nil,
			performance_mode = false,
			ignored_events = { "WinScrolled", "CursorMoved" },
		})
	end,
}
