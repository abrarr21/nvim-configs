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