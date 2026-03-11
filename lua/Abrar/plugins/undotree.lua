-- return {
--     "mbbill/undotree",
--     config = function()
--         vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
--     end,
-- }

return {
	{
		"mbbill/undotree",

		-- Lazy load only when needed
		cmd = { "UndotreeToggle", "UndotreeShow", "UndotreeHide" },

		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle UndoTree" },
		},

		config = function()
			-- Enable persistent undo (important)
			vim.opt.undofile = true

			-- Better layout
			vim.g.undotree_WindowLayout = 2 -- tree on left
			vim.g.undotree_SplitWidth = 28 -- tree width
			vim.g.undotree_DiffpanelHeight = 10 -- diff panel height

			-- UX improvements
			vim.g.undotree_SetFocusWhenToggle = 1
			vim.g.undotree_ShortIndicators = 1
			vim.g.undotree_HighlightChangedText = 1
			vim.g.undotree_HighlightChangedWithSign = 1

			-- Auto-close when leaving the Undotree window
			vim.api.nvim_create_autocmd("BufLeave", {
				pattern = "undotree_*",
				callback = function()
					vim.cmd("UndotreeHide")
				end,
			})
		end,
	},
}
