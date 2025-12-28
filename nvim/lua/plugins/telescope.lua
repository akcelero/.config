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
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("fzf")
		end,
	},
}
