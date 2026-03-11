return {
	-- here only for wrapping html tags
	-- emmet_ls is already installed in mason
	"olrtg/nvim-emmet",
	config = function()
		vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
	end,
}

-- Steps:

-- 1. v press karo
-- 2. Text select karo → Hello World
-- 3. <leader>xe press karo
-- 4. Prompt aayega — abbreviation likho:
-- 5. enter (eg. p.text-lg)
-- 6. <p class="text-lg">Hello World</p>
