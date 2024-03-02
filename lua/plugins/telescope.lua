-- For now this is taken from kickstart but in the future I'll re-write this to be exactly what I want
return {
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for install instructions

				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.

				-- This is only run then, not every time Neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- Useful for getting pretty icons, but requires special font.

			--  If you already have a Nerd Font, or terminal set up with fallback fonts
			--  you can enable this
			-- { 'nvim-tree/nvim-web-devicons' }
		},

		config = function()
			-- Telescope is a fuzzy finder that comes with a lot of different things that
			-- it can fuzzy find! It's more than just a "file finder", it can search

			-- many different aspects of Neovim, your workspace, LSP, and more!
			--
			-- The easiest way to use telescope, is to start by doing something like:

			--  :Telescope help_tags
			--
			-- After running this command, a window will open up and you're able to

			-- type in the prompt window. You'll see a list of help_tags options and
			-- a corresponding preview of the help.
			--
			-- Two important keymaps to use while in telescope are:

			--  - Insert mode: <c-/>
			--  - Normal mode: ?
			--

			-- This opens a window that shows you all of the keymaps for the current
			-- telescope picker. This is really useful to discover what Telescope can
			-- do as well as how to actually do it!

			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			require("telescope").setup({
				-- You can put your default mappings / updates / etc. in here
				--  All the info you're looking for is in `:help telescope.setup()`

				--
				-- defaults = {

				--   mappings = {
				--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
				--   },
				-- },
				-- pickers = {}
				extensions = {
					["ui-select"] = {

						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Enable telescope extensions, if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- See `:help telescope.builtin`
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>ht", builtin.help_tags, { desc = "Help Tags" })
			vim.keymap.set("n", "<leader>hk", builtin.keymaps, { desc = "Help Keymaps" })
			vim.keymap.set("n", "<leader>hT", builtin.builtin, { desc = "Help Telescope Search" })

			vim.keymap.set("n", "<leader>.", builtin.find_files, { desc = "Search Files" })
			vim.keymap.set("n", "<leader>s.", builtin.grep_string, { desc = "Search Under Cursor" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search Grep" })
			vim.keymap.set("n", "<leader>sr", builtin.grep_string, { desc = "Search RG" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
			vim.keymap.set("n", "<leader>'", builtin.resume, { desc = "Search Resume" })
			vim.keymap.set("n", "<leader>sf", builtin.oldfiles, { desc = "Search Old Files" })
			vim.keymap.set("n", "<leader>,", builtin.buffers, { desc = "Find Buffers" })

			-- Slightly advanced example of overriding default behavior and theme
			vim.keymap.set("n", "<leader>ss", function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({

					winblend = 10,
					previewer = false,
				}))
			end, { desc = "Search Buffer" })

			-- Also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<leader>sS", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Search Open Files",
				})
			end, { desc = "Search Open Files" })

			-- Shortcut for searching your neovim configuration files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "Search Config Files" })
		end,
	},
}
