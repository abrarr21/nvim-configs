-- This configuration installs and sets up nvim-lualine/lualine.nvim for a customized status line in Neovim:

--     nvim-lualine/lualine.nvim:
--         Installs the lualine.nvim plugin for Neovim.

--     Configuration:
--         The config function is used to set up lualine.nvim.
--         Calls require('lualine').setup({...}) to configure lualine with specific options.

-- Options:

--     Sets the theme to 'dracula' for the status line appearance.

-- This setup enhances Neovim's UI by adding a custom, themed status line using lualine.nvim with the 'dracula' theme.


return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require('lualine').setup({
            options = {
                theme = 'dracula',
            },
        })
    end,
}