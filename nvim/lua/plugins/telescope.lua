return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live grep",
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>fp",
				function()
					require("telescope.builtin").persisted()
				end,
				desc = "Persisted sessions",
			},
			{
				"<leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Persisted sessions",
			},
			--
			--             local builtin = require('telescope.builtin')
			-- vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = 'Neovim help tags' })
			-- vim.keymap.set('n', '<leader>tl', function() builtin.help_tags({ search = 'lua' }) end, { desc = 'Lua API help' })
		},
		opts = {
			defaults = {
				prompt_prefix = "🔍 ",
				selection_caret = "➤ ",
				sorting_strategy = "ascending",
				path_display = { "smart" },
				layout_strategy = "horizontal",
				mappings = {
					i = {
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
						["<esc>"] = require("telescope.actions").close,
					},
					n = {
						["q"] = require("telescope.actions").close,
					},
				},
			},
			pickers = {
				-- theme's value can be "ivy", "dropdown", "cursor"
				find_files = {
					theme = "dropdown",
					previewer = true,
					find_command = { "rg", "--files", "--no-ignore-vcs" },
				},
				live_grep = {
					-- theme = "ivy",
					theme = "dropdown",
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--no-ignore",
						"--no-ignore-vcs",
					},
				},
				buffers = {
					theme = "dropdown",
					initial_mode = "normal",
					ignore_current_buffer = true,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				file_browser = {
					theme = "ivy",
				},
				persisted = {
					layout_config = { width = 0.55, height = 0.55 },
				},
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("fzf")
		end,
	},
}
