return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      -- Modify the separator highlight to change the appearance if needed
      diagnostics = "nvim_lsp", -- Optional, add LSP diagnostics if you need it
      custom_areas = {
        left = function()
          return { -- Add your custom elements here
            { " ", "BufferlineTab", " " },
          }
        end,
      },
    },
  },
  config = function()
    local devicons = require("nvim-web-devicons")
    require("bufferline").setup({
      options = {
        -- Render function for bufferline with modified status
        numbers = "none", -- Customize numbering if needed
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        separator_style = "slant", -- You can customize the style of the separator

        -- Custom indicator logic
        buffer_close_icon = "",
        -- You can also adjust the custom icons if you wish
        -- Add logic to show the [+] when file is modified
        modified_icon = " [+]",
        -- You can adjust the color as well based on your theme
        modified_icon_color = "#ff9e64", -- For unsaved files (modified)

        -- You can add other customizations here as needed
      },
    })
  end,
}
