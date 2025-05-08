return {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
    config = function()
        local autopairs = require("nvim-autopairs")

        autopairs.setup({
            chech_ts = true,
            ts_config = {
                lua = { "string" },
                html = { "tag" },
                javascript = { "template_string" },
                java = false,
                typescript = { "string", "template_string" },  -- Added TypeScript
                golang = { "string" },  -- Added Go
                tsx = { "jsx_element", "jsx_fragment", "template_string" },  -- Added TSX
                jsx = { "jsx_element", "jsx_fragment", "template_string" },
            },
        })

        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")

        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}
