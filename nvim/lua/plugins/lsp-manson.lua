return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"pyright",
				"lua_ls",
				"gopls",
				"bashls",
			},
			automatic_installation = true,
			automatic_enable = false,
		})

		vim.diagnostic.config({
			virtual_text = { spacing = 8, prefix = "● " },
			signs = true,
			update_in_insert = true,
			underline = true,
			severity_sort = true,
		})

		vim.lsp.config("*", {
			on_attach = function(_, bufnr)
				local map = function(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, {
						buffer = bufnr,
						desc = desc,
						noremap = true,
						silent = true,
					})
				end

				map("gd", vim.lsp.buf.definition, "Go to definition")
				map("gD", vim.lsp.buf.declaration, "Go to declaration")
				map("gi", vim.lsp.buf.implementation, "Go to implementation")
				map("gr", vim.lsp.buf.references, "List references")

				map("K", vim.lsp.buf.hover, "Hover doc")
				map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")

				map("<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace symbol")
				map("<leader>ds", vim.diagnostic.open_float, "Show diagnostics")
				map("[d", vim.diagnostic.goto_prev, "Prev diagnostic")
				map("]d", vim.diagnostic.goto_next, "Next diagnostic")
			end,
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})

		vim.lsp.enable("pyright")
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("gopls")
		vim.lsp.enable("bashls")
	end,
}
