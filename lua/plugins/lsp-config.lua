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