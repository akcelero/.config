return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "pyright", "lua_ls", "gopls" },
			automatic_installation = true,
			automatic_enable = {},
		})
	end,
}
