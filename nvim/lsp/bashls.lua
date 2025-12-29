-- lspconfig.bashls.setup({
-- 	capabilities = capabilities,
-- 	settings = {
-- 		bashIde = {
-- 			globPattern = vim.env.GLOB_PATTERN
-- 				or "*@(*.bash|*.sh|.bashrc|.bash_aliases|.bash_profile|.bash_logout|.bashrc|.profile)",
-- 		},
-- 	},
-- })

return {
	cmd = { "bash-language-server", "start" },
	filetypes = { "bash", "sh" },
	root_markers = { ".git", "Makefile" }, -- Makefile is good marker
	settings = {
		bashIde = {
			globPattern = "*@(*.sh|*.bash|.bashrc|.bash_profile)",
		},
	},
}
