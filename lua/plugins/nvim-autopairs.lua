return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,  -- Enable Treesitter integration for better pairing
      ts_config = {
        lua = {"string"}, -- Don't add pairs in Lua string treesitter nodes
        javascript = {"template_string"}, -- Don't add pairs in JS template strings
        java = false, -- Don't check Treesitter on java
      },
      disable_filetype = { "TelescopePrompt" }, -- Disable autopairs in specific filetypes
    })

    -- If you're using cmp for autocompletion
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}

