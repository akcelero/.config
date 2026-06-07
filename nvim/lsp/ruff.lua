return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
	init_options = {
		settings = {
			-- any ruff server settings here, e.g.:
			-- lint = { select = { 'E', 'F', 'I' } },
		},
	},
}
