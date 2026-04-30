return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-treesitter-textobjects").setup({
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
						["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
						["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
						["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
						["a:"] = { query = "@property.outer", desc = "Select outer part of an object property" },
						["i:"] = { query = "@property.inner", desc = "Select inner part of an object property" },
						["l:"] = { query = "@property.lhs", desc = "Select left part of an object property" },
						["r:"] = { query = "@property.rhs", desc = "Select right part of an object property" },
						["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
						["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },
						["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
						["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },
						["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
						["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },
						["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
						["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },
						["am"] = { query = "@function.outer", desc = "Select outer part of a method/function def" },
						["im"] = { query = "@function.inner", desc = "Select inner part of a method/function def" },
						["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>na"] = "@parameter.inner",
						["<leader>n:"] = "@property.outer",
						["<leader>nm"] = "@function.outer",
					},
					swap_previous = {
						["<leader>pa"] = "@parameter.inner",
						["<leader>p:"] = "@property.outer",
						["<leader>pm"] = "@function.outer",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]f"] = "@call.outer",
						["]m"] = "@function.outer",
						["]c"] = "@class.outer",
						["]i"] = "@conditional.outer",
						["]l"] = "@loop.outer",
						["]s"] = { query = "@scope", query_group = "locals" },
						["]z"] = { query = "@fold", query_group = "folds" },
					},
					goto_next_end = {
						["]F"] = "@call.outer",
						["]M"] = "@function.outer",
						["]C"] = "@class.outer",
						["]I"] = "@conditional.outer",
						["]L"] = "@loop.outer",
					},
					goto_previous_start = {
						["[f"] = "@call.outer",
						["[m"] = "@function.outer",
						["[c"] = "@class.outer",
						["[i"] = "@conditional.outer",
						["[l"] = "@loop.outer",
					},
					goto_previous_end = {
						["[F"] = "@call.outer",
						["[M"] = "@function.outer",
						["[C"] = "@class.outer",
						["[I"] = "@conditional.outer",
						["[L"] = "@loop.outer",
					},
				},
			},
		})

		local ok, rm = pcall(require, "nvim-treesitter.textobjects.repeatable_move")
		if ok then
			-- repeat last move
			vim.keymap.set({ "n", "x", "o" }, ";", rm.repeat_last_move)
			vim.keymap.set({ "n", "x", "o" }, ",", rm.repeat_last_move_opposite)

			-- override f/F/t/T safely
			if rm.builtin_f then
				vim.keymap.set({ "n", "x", "o" }, "f", rm.builtin_f)
			end
			if rm.builtin_F then
				vim.keymap.set({ "n", "x", "o" }, "F", rm.builtin_F)
			end
			if rm.builtin_t then
				vim.keymap.set({ "n", "x", "o" }, "t", rm.builtin_t)
			end
			if rm.builtin_T then
				vim.keymap.set({ "n", "x", "o" }, "T", rm.builtin_T)
			end
		end
	end,
}
