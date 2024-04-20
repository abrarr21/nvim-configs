--This configuration sets up the "catppuccin/nvim" plugin to load immediately with priority 1000 under the name "catppuccin". It applies a specific color scheme named "catppuccin" to Neovim upon initialization.

return {
    "catppuccin/nvim", 
    lazy = false,
    name = "catppuccin", 
    priority = 1000,
    config = function()
        vim.cmd.colorscheme "catppuccin"
    end
}

-- return {
--     "Tsuzat/NeoSolarized.nvim",
--       lazy = false, -- make sure we load this during startup if it is your main colorscheme
--       priority = 1000, -- make sure to load this before all the other start plugins
--       config = function()
--         vim.cmd [[ colorscheme NeoSolarized ]]
--       end
--   }