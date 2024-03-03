-- Any plugins that don't require additional configuration go here
return {
	{
		"stevearc/oil.nvim",

		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },

		config = function()
			require("oil").setup({
				vim.keymap.set("n", "<leader>oo", "<cmd>Oil<cr>", { desc = "Open Oil" }),
			})
		end,
	},
	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VeryLazy", -- Sets the loading event to 'VeryLazy'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()

			-- Document existing key chains
			require("which-key").register({
				["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
				["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
				["<leader>o"] = { name = "[O]pen", _ = "which_key_ignore" },
				["<leader>h"] = { name = "[H]elp", _ = "which_key_ignore" },
				["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
	{
		"numToStr/Comment.nvim",

		opts = {

			-- add any options here
		},
		lazy = false,
	},
	{
		"folke/noice.nvim",

		event = "VeryLazy",
		opts = {
			-- add any options here
		},

		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback

			"rcarriga/nvim-notify",
		},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			vim.keymap.set("n", "<leader>cd", function()
				require("trouble").toggle()
			end),
		},
	},
}
