return {
	"leath-dub/snipe.nvim",
	keys = {
		{
			"<leader>s",
			function() require("snipe").open_buffer_menu() end,
			desc = "Open Snipe buffer menu",
		},
	},
	opts = {
		ui = {
			max_width = -1, -- dynamic width
		},
		hints = {
			dictionary = "wertyuiopasdfgzxcvbnm",
		},
		navigate = {
			cancel_snipe = "q",
			close_buffer = "c",
		},
	},
}

