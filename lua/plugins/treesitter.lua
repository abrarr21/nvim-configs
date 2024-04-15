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
    end
}