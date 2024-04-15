-- This Neovim configuration sets up Mason for snippet management (williamboman/mason.nvim) and integrates LSP configurations (neovim/nvim-lspconfig) with key mappings:

--     Mason Setup (williamboman/mason.nvim):
--         Loads Mason with require("mason").setup().

--     Mason LSP Configuration (williamboman/mason-lspconfig.nvim):
--         Lazy loading is disabled (lazy = false).
--         auto_install = true enables automatic installation of LSP servers.

--     LSP Configurations (neovim/nvim-lspconfig):
--         Lazy loading is disabled (lazy = false).
--         Sets up various LSP servers (lua_ls, clangd, dockerls, etc.) with default capabilities.

-- Key Mappings:

--     K in normal mode triggers hover information using LSP (vim.lsp.buf.hover).
--     <leader>gr in normal mode finds references using LSP (vim.lsp.buf.references).
--     <leader>gd in normal mode jumps to the definition using LSP (vim.lsp.buf.definition).
--     <leader>ca in normal or visual mode triggers code actions using LSP (vim.lsp.buf.code_action).

-- These configurations enhance Neovim with snippet management and language server support, improving development capabilities with integrated key mappings for LSP interactions.



return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        -- config = function()
        --     require("mason-lspconfig").setup({
        --         ensure_installed = {"lua_ls", "clangd", "dockerls","docker_compose_language_service","html", "jsonls","tsserver", "prismals", "tailwindcss", "yamlls","vtsls", "taplo", "cssls", "bashls"}
        --     })
        -- end
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.dockerls.setup({ capabilities = capabilities })
            lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })
            lspconfig.html.setup({ capabilities = capabilities })
            lspconfig.jsonls.setup({ capabilities = capabilities })
            lspconfig.tsserver.setup({ capabilities = capabilities })
            lspconfig.prismals.setup({ capabilities = capabilities })
            lspconfig.tailwindcss.setup({capabilities = capabilities })
            lspconfig.yamlls.setup({ capabilities = capabilities })
            lspconfig.vtsls.setup({ capabilities = capabilities })
            lspconfig.taplo.setup({ capabilities = capabilities })
            lspconfig.cssls.setup({ capabilities = capabilities })
            lspconfig.bashls.setup({ capabilities = capabilities })

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
            vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
        end,
    },
}