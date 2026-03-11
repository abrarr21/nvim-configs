return {
	"sphamba/smear-cursor.nvim",
	event = "CursorMoved", -- lazy load
	opts = {
		-- Disable smearing in insert mode
		smear_insert_mode = false,
		smear_visual_mode = true,
		smear_length = 8,
		smear_delay = 30,
		disable_filetypes = { "markdown", "help" }, -- skip distraction in these files
	},
}
