-- This configuration sets up nvim-treesitter/nvim-treesitter for syntax highlighting and indentation in Neovim:

--     nvim-treesitter/nvim-treesitter:
--         Installs the nvim-treesitter plugin for Neovim.

--     Configuration:
--         The config function initializes the Treesitter setup using require("nvim-treesitter.configs").
--         Configures Treesitter with the following options:
--             auto_install = true: Automatically installs missing parsers for detected file types.
--             highlight = { enable = true }: Enables syntax highlighting using Treesitter.
--             indent = { enable = true }: Enables automatic indentation based on Treesitter rules.

-- Additionally, it includes build = ":TSUpdate" which triggers a Treesitter update when Neovim starts to ensure parsers are up to date.

-- This setup enhances Neovim by providing improved syntax highlighting and indentation using the Treesitter plugin with automatic parser installation and highlighting enabled.


return {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
        -- ensure_installed = {"lua", "vim", "vimdoc", "query", "elixir", "c", "javascript", "html"},
        auto_install = true,
        highlight = { enable = true},
        indent = { enable = true },
        })
    end,
}

