return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "NvimTreeToggle", "NvimTreeOpen" },
	keys = {
		{ "<leader>t", "<cmd>NvimTreeOpen<cr>", desc = "Open NvimTree", silent = true },
		{ "<leader>y", "<cmd>NvimTreeClose<cr>", desc = "Close NvimTree", silent = true },
	},
	lazy = false,
	opts = {
		disable_netrw = true,
		hijack_netrw = true,
		view = {
			side = "right",
			width = { min = 20, max = 50, padding = 3, lines_excluded = { "root" } },
			preserve_window_proportions = true,
			relativenumber = true,
		},
		actions = {
			open_file = {
				-- resize_window = false,
				-- quit_on_open = true,
			},
		},
		filters = { dotfiles = false },
		git = { enable = true, ignore = false },
		filesystem_watchers = { enable = true },
		renderer = {
			indent_markers = {
				enable = true,
				icons = {
					corner = "└ ",
					edge = "│ ",
					none = "│ ",
				},
			},
			icons = {
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},
			},
		},
	},
}
