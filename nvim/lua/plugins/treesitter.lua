return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	opts = {
		ensure_installed = {
			"c",
			"lua",
			"vim",
			"ghostty",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
			"python",
			"bash",
			"go",
            "json",
            "yaml",
            "toml",
            "dockerfile",
		},
		sync_install = true,
		auto_install = true,

		highlight = {
			enable = true,
			disable = function(_, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			additional_vim_regex_highlighting = false,
		},
	},
}

