return {
	"rachartier/tiny-code-action.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim" },
	},
	event = "LspAttach",
    keys = {
        {
            "<leader>ca",
            function() require("tiny-code-action").code_action() end,
            mode = { "n", "x" },
            desc = "Code action" },
    },
	opts = {
		picker = {
			"buffer",
			opts = {
				hotkeys = true, -- Enable hotkeys for quick selection of actions
				hotkeys_mode = "text_diff_base", -- Modes for generating hotkeys
				auto_preview = false, -- Enable or disable automatic preview
				auto_accept = true, -- Automatically accept the selected action
				position = "cursor", -- Position of the picker window
				winborder = "single", -- Border style for picker and preview windows
				custom_keys = {
					{ key = "m", pattern = "Fill match arms" },
					{ key = "m", pattern = "Consider making this binding mutable: mut" },
					{ key = "r", pattern = "Rename.*" }, -- Lua pattern matching
					{ key = "e", pattern = "Extract Method" },
				},
			},
		},
	},
}

