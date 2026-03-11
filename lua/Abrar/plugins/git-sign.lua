-- return {
-- 	"lewis6991/gitsigns.nvim",
-- 	config = function()
-- 		require("gitsigns").setup()

-- 		vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
-- 	end,
-- }
return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			-- Optional: customize signs in the gutter
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
			},
			-- Show inline blame at the end of line
			current_line_blame = false,
		})

		-- ===============================
		-- Keymaps for common Git actions
		-- ===============================

		local gs = require("gitsigns")

		-- Preview current hunk
		vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { desc = "Preview Git Hunk" })

		-- Stage current hunk
		vim.keymap.set("n", "<leader>gs", gs.stage_hunk, { desc = "Stage Git Hunk" })

		-- Undo stage (unstage) current hunk
		vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })

		-- Blame current line
		vim.keymap.set("n", "<leader>gb", gs.blame_line, { desc = "Blame Git Line" })

		-- Diff current buffer against HEAD
		vim.keymap.set("n", "<leader>ggd", gs.diffthis, { desc = "Diff buffer vs HEAD" })

		-- Navigate between hunks
		vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next Git Hunk" })
		vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Previous Git Hunk" })

		-- ===============================
		-- Short usage guide:
		-- ===============================
		-- <leader>gp -> Preview current hunk
		-- <leader>gs -> Stage current hunk
		-- <leader>gu -> Undo stage hunk
		-- <leader>gb -> Show blame info for current line
		-- <leader>gd -> Show diff of current buffer vs HEAD
		-- ]h        -> Jump to next hunk
		-- [h        -> Jump to previous hunk
	end,
}
