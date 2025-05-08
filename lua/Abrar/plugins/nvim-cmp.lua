return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip", -- auto-completion
        "rafamadriz/friendly-snippets", -- snippet
        "nvim-treesitter/nvim-treesitter",
        "onsails/lspkind.nvim", -- VS-Code pictogram
        "roobert/tailwindcss-colorizer-cmp.nvim",
    },
    config = function()
        local cmp = require("cmp")
        local has_luasnip, luasnip = pcall(require, 'luasnip')
        local lspkind = require("lspkind")
        local colorizer = require("tailwindcss-colorizer-cmp").formatter

        local lsp_kinds = {
                    Class = ' ',
                    Color = ' ',
                    Constant = ' ',
                    Constructor = ' ',
                    Enum = ' ',
                    EnumMember = ' ',
                    Event = ' ',
                    Field = ' ',
                    File = ' ',
                    Folder = ' ',
                    Function = ' ',
                    Interface = ' ',
                    Keyword = ' ',
                    Method = ' ',
                    Module = ' ',
                    Operator = ' ',
                    Property = ' ',
                    Reference = ' ',
                    Snippet = ' ',
                    Struct = ' ',
                    Text = ' ',
                    TypeParameter = ' ',
                    Unit = ' ',
                    Value = ' ',
                    Variable = ' ',
                }

        local select_next_item = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end

        local select_prev_item = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end

        local confirm = function(entry)
            local behavior = cmp.ConfirmBehavior.Replace
            if entry then
                local completion_item = entry.completion_item
                local newText = ''
                if completion_item.textEdit then
                    newText = completion_item.textEdit.newText
                elseif type(completion_item.insertText) == 'string' and completion_item.insertText ~= '' then
                    newText = completion_item.insertText
                else
                    newText = completion_item.word or completion_item.label or ''
                end

                local diff_after = math.max(0, entry.replace_range['end'].character + 1) - entry.context.cursor.col
                if entry.context.cursor_after_line:sub(1, diff_after) ~= newText:sub(-diff_after) then
                    behavior = cmp.ConfirmBehavior.Insert
                end
            end
            cmp.confirm({ select = true, behavior = behavior })
        end

        -- Loads VS-Code style snippets from installed plugins (eg. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            -- HACK: experimenting with ghost_text
            -- look at `toggle_ghost_text()` function below
            experimental = {
                ghost_text = true,
            },
            
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            window = {
                documentation = {
                    border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
                },
                completion = {
                    border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
                }

            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            -- auto-completion sources
            sources = cmp.config.sources({
                { name = "luasnip" },
                { name = "nvim_lsp"},
                { name = "buffer" },
                { name = "path" },
                { name = "tailwindcss-colorizer-cmp" },
            }),
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-j>'] = cmp.mapping(select_next_item),
                ['<C-k>'] = cmp.mapping(select_prev_item),
                ['<C-n>'] = cmp.mapping(select_next_item),
                ['<C-p>'] = cmp.mapping(select_prev_item),
                ['<Down>'] = cmp.mapping(select_next_item),
                ['<Up>'] = cmp.mapping(select_prev_item),
                ['<CR>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        local entry = cmp.get_selected_entry()
                        confirm(entry)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),

            -- Setup lspkind for VS-Code pictogram in auto-completion dropdown menu
            formatting = {
                format = function(entry, vim_item)
                    vim_item.kind = string.format('%s %s', lspkind[vim_item.kind] or '', vim_item.kind)

                    -- Add menu tags (eg. [Buffer], [LSP])
                    vim_item.menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                        latex_symbols = "[LaTeX]",
                    })[entry.source.name]
                    
                    -- use lspkind and tailwindcss-colorizer-cmp for additional formatting
                    vim_item = lspkind.cmp_format({
                        maxwidth = 30,
                        ellipsis_char = "...",
                    })(entry, vim_item)

                    if entry.source.name == "nvim_lsp" then
                        vim_item = colorizer(entry, vim_item)
                    end

                    return vim_item
                end,
            },
        })
        -- NOTE: Added Ghost text stuff
        -- Only show ghost text at word boundaries, not inside keywords. Based on idea
        -- from: https://github.com/hrsh7th/nvim-cmp/issues/2035#issuecomment-2347186210

        local config = require('cmp.config')
        local toggle_ghost_text = function()
            if vim.api.nvim_get_mode().mode ~= 'i' then
                return
            end

            local cursor_column = vim.fn.col('.')
            local current_line_contents = vim.fn.getline('.')
            local character_after_cursor = current_line_contents:sub(cursor_column, cursor_column)

            local should_enable_ghost_text = character_after_cursor == '' or vim.fn.match(character_after_cursor, [[\k]]) == -1

            local current = config.get().experimental.ghost_text
            if current ~= should_enable_ghost_text then
                config.set_global({
                    experimental = {
                        ghost_text = should_enable_ghost_text,
                    },
                })
            end
        end

        vim.api.nvim_create_autocmd({ 'InsertEnter', 'CursorMovedI' }, {
            callback = toggle_ghost_text,
        })
        -- ! Ghost text stuff ! -- 
    end,
}
