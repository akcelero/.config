return {
	"olimorris/persisted.nvim",
	event = "BufReadPre",
	config = function()
		require("persisted").setup({
			autosave = {
				enabled = true,
				notify = true,
			},
			telescope = {
				enable = true,
			},
		})
	end,
}
