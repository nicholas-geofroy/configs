return {
    'christoomey/vim-tmux-navigator', -- work with tmux
    {
        'nvim-treesitter/nvim-treesitter',
        build = function ()
            require("nvim-treesitter.install").update({ with_sync = true })()
        end,
        config = function ()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "terraform", "go", "python", "rust" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function() 
            local ts = require('telescope.builtin')
            -- Find files using Telescope command-line sugar.
            vim.keymap.set('n', '<leader>ff', ts.find_files, {})
            vim.keymap.set('n', '<leader>fg', ts.live_grep, {})
            vim.keymap.set('n', '<leader>fb', ts.buffers, {})
            vim.keymap.set('n', '<leader>fh', ts.help_tags, {})
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function ()
            local harpoon = require('harpoon')
            harpoon:setup()
            vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "harpoon add" })
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

            -- Toggle previous & next buffers stored within Harpoon list
            vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
            vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
        end,
    },
}
