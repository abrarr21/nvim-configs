-- This Neovim configuration sets up nvim-neo-tree/neo-tree.nvim for a file tree explorer with specific key mappings:

--     nvim-neo-tree/neo-tree.nvim:
--         Installs the neo-tree.nvim plugin for Neovim.

--     Dependencies:
--         Includes required dependencies such as nvim-lua/plenary.nvim, nvim-tree/nvim-web-devicons, and MunifTanjim/nui.nvim.

--     Configuration:
--         The config function sets up key mappings for neo-tree.nvim.

-- Key Mappings:

--     <C-n> in normal mode reveals the filesystem tree on the left using :Neotree filesystem reveal left<CR>.
--     <leader>bf in normal mode reveals the list of buffers in a floating window using :Neotree buffers reveal float<CR>.

-- These key mappings enhance Neovim by providing quick access to file and buffer navigation using neo-tree.nvim.


return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        -- vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
        vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
        vim.keymap.set('n', '<C-n>', ':Neotree toggle filesystem left<CR>', { desc = "Toggle Neotree filesystem" })

    end
}