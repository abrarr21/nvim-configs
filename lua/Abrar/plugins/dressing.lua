return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",  -- Load only when needed to keep startup fast
  opts = {
    input = {
      enabled = true,
      border = "rounded",
      win_options = {
        winblend = 10,
      },
    },
    select = {
      enabled = true,
      backend = { "telescope", "builtin" },  -- Prioritize Telescope if installed
      telescope = require("telescope.themes").get_dropdown({}),
    },
  },
}
