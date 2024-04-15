--This configuration sets up several plugins for Neovim's completion using nvim-cmp and related plugins (cmp-nvim-lsp, LuaSnip, etc.). It configures cmp to work with LuaSnip for snippets and uses various mappings for completion and navigation within the completion menu. It also specifies the sources for completion, prioritizing luasnip and including buffer as a source. This setup enhances Neovim's autocompletion and snippet capabilities.

--    <C-b>: Scrolls up within the completion menu by calling cmp.mapping.scroll_docs(-4).
--    <C-f>: Scrolls down within the completion menu by calling cmp.mapping.scroll_docs(4).
--    <C-Space>: Triggers completion by calling cmp.mapping.complete().
--    <C-e>: Aborts the completion menu by calling cmp.mapping.abort().
--    <CR> (Enter key): Confirms the currently selected item in the completion menu. The { select = true }   option means it will automatically select the item upon pressing Enter.

--These mappings enhance the usability of the completion menu provided by nvim-cmp:

return {
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets"
        },
    },
    {
        "hrsh7th/nvim-cmp",
    config = function()
        local cmp = require('cmp')
        require("luasnip.loaders.from_vscode").lazy_load()


        cmp.setup({
          snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
            --   vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
              require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
              -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
              -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
              -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
            end,
          },
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
          mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          }),
          sources = cmp.config.sources({
            -- { name = 'nvim_lsp' },
            -- { name = 'vsnip' }, -- For vsnip users.
            { name = 'luasnip' }, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
          }, {
            { name = 'buffer' },
          })
        })
    end,
    },
}