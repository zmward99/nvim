-- Any plugins that don't require additional configuration go here
return {
    {'stevearc/oil.nvim',

    opts = {
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
    require("oil").setup({
            vim.keymap.set('n', '<leader>oo', "<cmd>Oil<cr>", { desc = 'Open Oil' })
    })
    end,
    },
    { -- Useful plugin to show you pending keybinds.
        'folke/which-key.nvim',
        event = 'VeryLazy', -- Sets the loading event to 'VeryLazy'
        config = function() -- This is the function that runs, AFTER loading
            require('which-key').setup()


            -- Document existing key chains
            require('which-key').register {
                ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
                ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
                ['<leader>o'] = { name = '[O]pen', _ = 'which_key_ignore' },
                ['<leader>h'] = { name = '[H]elp', _ = 'which_key_ignore' },
            }
        end,
    },
}
