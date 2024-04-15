-- This configuration sets up nvimtools/none-ls.nvim for language server integration with specific source configurations and a key mapping:

--     nvimtools/none-ls.nvim:
--         Installs the none-ls.nvim plugin for Neovim.

--     Configuration:
--         The config function sets up null-ls for language server capabilities.
--         Configures null-ls with specific sources like stylua for formatting Lua, erb_lint for ERB linting, and prettier for general formatting.

-- Key Mapping:

--     <leader>gf in normal mode triggers the LSP formatting action using vim.lsp.buf.format.

-- This setup enhances Neovim by enabling language server functionality through null-ls with support for various formatting and linting tools, and it provides a key mapping for convenient code formatting.


return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.diagnostics.erb_lint,
                null_ls.builtins.formatting.prettier,
            },
        })
        vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
    end
}