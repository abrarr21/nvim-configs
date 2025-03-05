return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    --import comment plugin safely
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    --enable comment
    comment.setup({
      --for commenting tsx, jsx, html files
      pre_hook = ts_context_commentstring.create_pre_hook(),

      -- Custom keybindings (optional)
      toggler = {
        line = "<leader>cc", -- Toggle comment for the current line
        block = "<leader>bc", -- Toggle block comment for the current line
      },
      opleader = {
        line = "<leader>c", -- Comment/uncomment lines in visual mode
        block = "<leader>b", -- Comment/uncomment blocks in visual mode
      },
    })
  end,
}

