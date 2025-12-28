-- Dashboard plugin
return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local header = {
			[[⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣀⣀⠀⠀  ⠀]],
			[[⠀⠀⠀⠀⠀⠀⣾⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⢀⠀⠈⡇⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⠀⣿⠀⠁⠀⠘⠁⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠈⠀⠀⡇⠀⠀⠀⠀]],
			[[⣀⣀⣀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠄⠀⠀⠸⢰⡏⠉⠳⣄⠰⠀⠀⢰⣷⠶⠛⣧⠀]],
			[[⢻⡀⠈⠙⠲⡄⣿⠀⠀⠀⠀⠀⠀⠀⠠⠀⢸⠀⠀⠀⠈⠓⠒⠒⠛⠁⠀⠀⣿⠀]],
			[[⠀⠻⣄⠀⠀⠙⣿⠀⠀⠀⠈⠁⠀⢠⠄⣰⠟⠀⢀⡔⢠⠀⠀⠀⠀⣠⠠⡄⠘⢧]],
			[[⠀⠀⠈⠛⢦⣀⣿⠀⠀⢠⡆⠀⠀⠈⠀⣯⠀⠀⠈⠛⠛⠀⠠⢦⠄⠙⠛⠃⠀⢸]],
			[[⠀⠀⠀⠀⠀⠉⣿⠀⠀⠀⢠⠀⠀⢠⠀⠹⣆⠀⠀⠀⠢⢤⠠⠞⠤⡠⠄⠀⢀⡾]],
			[[⠀⠀⠀⠀⠀⢀⡿⠦⢤⣤⣤⣤⣤⣤⣤⣤⡼⣷⠶⠤⢤⣤⣤⡤⢤⡤⠶⠖⠋⠀]],
			[[⠀⠀⠀⠀⠀⠸⣤⡴⠋⠸⣇⣠⠼⠁⠀⠀⠀⠹⣄⣠⠞⠀⢾⡀⣠⠃⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀⠀⠀⠀]],
		}
		local button = require("alpha.themes.dashboard").button
		local buttons = {
			{
				type = "text",
				val = "Quick actions                                ",
				opts = { hl = "SpecialComment", position = "center" },
			},
			button("e", "   New file", "<cmd>ene!<CR>"),
			button("f", "  󰈞 Find file", "<cmd>Telescope find_files<CR>"),
			button("r", "   Recent files", "<cmd>Telescope oldfiles<CR>"),
			button("o", "   Find text", "<cmd>Telescope live_grep<CR>"),
			button("q", "  󰩈 Quit", "<cmd>qa<CR>"),
			{ type = "padding", val = 1, opts = {} },
			{
				type = "text",
				val = "Configs                                      ",
				opts = { hl = "SpecialComment", position = "center", width = 50 },
			},
			button("n", "   Nvim", "<cmd>e ${XDG_CONFIG_HOME}/nvim/<CR>"),
			button("z", "   Zsh", "<cmd>e ${XDG_CONFIG_HOME}/zsh/<CR>"),
			button("t", "   Tmux", "<cmd>e ${XDG_CONFIG_HOME}/tmux/tmux.conf<CR>"),
			button("g", "  󰊠 Ghostty", "<cmd>e ${XDG_CONFIG_HOME}/ghostty/config<CR>"),
		}
		for _, btn in ipairs(buttons) do
			btn.opts.align_shortcut = "left"
		end

		local theta = require("alpha.themes.theta")
		theta.buttons.val = buttons
		theta.header.val = header
		theta.config.layout = {
			theta.header,
			theta.buttons,
			{ type = "padding", val = 1 },
			{
				type = "group",
				val = function()
					return { theta.mru(0, vim.fn.getcwd()) }
				end,
				opts = { shrink_margin = false },
			},
		}
		require("alpha").setup(theta.config)
	end,
}
