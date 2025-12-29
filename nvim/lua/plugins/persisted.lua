return {
	"olimorris/persisted.nvim",
	lazy = false,
	config = function()
		require("persisted").setup({
			save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/persisted"),
			autosave = {
				enabled = true,
				notify = false,
			},
			autoload = true,
			on_autoload_no_session = function()
				vim.notify("No session to load", vim.log.levels.INFO)
			end,
			telescope = {
				enable = true,
			},
			should_autosave = function()
				if vim.bo.filetype == "alpha" then
					return false
				end
				return true
			end,
		})
		-- Custom save with name prompt
		local function save_session_with_name()
			local name = vim.fn.input("Session name: ")
			if name ~= "" then
				require("persisted").save({ session_name = name })
				vim.notify("Session saved: " .. name, vim.log.levels.INFO)
			else
				vim.notify("Session save cancelled", vim.log.levels.WARN)
			end
		end
		-- Keybindings
		local map = vim.keymap.set
		map("n", "<leader>pn", save_session_with_name, { desc = "Save session with name" })
		map("n", "<leader>ps", require("persisted").save, { desc = "Save session" })
		map("n", "<leader>pl", require("persisted").load, { desc = "Load session" })
		map("n", "<leader>pd", require("persisted").delete, { desc = "Delete session" })

		-- Telescope picker for sessions
		map("n", "<leader>pp", function()
			require("telescope").extensions.persisted.persisted()
		end, { desc = "Find session" })
	end,
}
