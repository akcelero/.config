return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.mod", ".git" },
	settings = {
		gopls = {
			gofumpt = true,
			usePlaceholders = true,
			semanticTokens = true,
			analyses = {
				unusedparams = true,
				staticcheck = true,
			},
		},
	},
}
