return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true, -- start up nvim with oil instead of netrw.
			float = {
				max_width = 80,
				max_height = 25,
				border = "rounded",
			},
			columns = { "icon" },
			keymaps = {
				["<leader>oh"] = false,
				["<C-c>"] = function() end, -- prevent ctrl+c from closing out of oil
				["q"] = "actions.close",
				["<C-r>"] = "actions.refresh",
				["<BS>"] = "actions.parent",
				["<C-y>"] = "actions.copy_entry_path",
				["<C-v>"] = "actions.select_vsplit",
				["<leader>w"] = function()
					require("oil").save()
				end,
			},
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
			skip_confirm_for_simple_edits = false, -- Quick edits with confirm
		})

		-- Keymaps for oil
		vim.keymap.set("n", "<leader>e", function()
			if vim.bo.filetype == "oil" then
				require("oil").close()
			else
				require("oil").toggle_float()
			end
		end, { desc = "Oil: toggle float" })

		vim.keymap.set("n", "-", function()
			if vim.bo.filetype == "oil" then
				require("oil").close()
			else
				vim.cmd("Oil")
			end
		end, { desc = "Oil: toggle" })

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil",
			callback = function()
				vim.opt_local.cursorline = true
			end,
		})
	end,
}
