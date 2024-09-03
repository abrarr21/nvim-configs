-- This configuration sets up nvim-telescope/telescope.nvim and nvim-telescope/telescope-ui-select.nvim plugins for Neovim with specific key mappings and setup:

--     nvim-telescope/telescope.nvim:
--         Installs the telescope.nvim plugin with tag 0.1.6.
--         Dependencies include nvim-lua/plenary.nvim.
--         The config function sets up key mappings using telescope.builtin functions:
--             <C-p> in normal mode triggers file search using builtin.find_files.
--             <leader>fg in normal mode triggers live grep using builtin.live_grep.

--     nvim-telescope/telescope-ui-select.nvim:
--         Installs the telescope-ui-select.nvim plugin.
--         The config function sets up telescope with custom extensions:
--             Configures the ui-select extension with a dropdown theme using telescope.themes.get_dropdown({}).
--             Loads the ui-select extension using telescope.load_extension("ui-select").

-- Key Mappings:

--     <C-p> in normal mode opens the file finder using telescope.builtin.find_files.
--     <leader>fg in normal mode starts a live grep search using telescope.builtin.live_grep.

-- These configurations enhance Neovim by integrating telescope.nvim for efficient file searching and live grep functionality, and telescope-ui-select.nvim for a customized UI selection experience.


return {
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
        vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})
      end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown ({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end
    },
    }