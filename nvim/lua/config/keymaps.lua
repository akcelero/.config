local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Clear search highlights
map("n", "<leader>nh", ":nohl<CR>", opts, { desc = "Clear search highlights" })

-- Window resize
map("n", "<C-S-h>", "<C-w>5<", opts, { desc = "Window widht -1" })
map("n", "<C-S-j>", "<C-w>5-", opts, { desc = "Window height -1" })
map("n", "<C-S-k>", "<C-w>5+", opts, { desc = "Window height +1" })
map("n", "<C-S-l>", "<C-w>5>", opts, { desc = "Window width +1" })

-- Jumps
map("n", "<C-f>", "<C-f>zz", opts, { desc = "Page down centered" })
map("n", "<C-b>", "<C-b>zz", opts, { desc = "Page up centered" })
map("n", "<C-d>", "<C-d>zz", opts, { desc = "Half page down centered" })
map("n", "<C-u>", "<C-u>zz", opts, { desc = "Half page up centered" })

-- Buffor select
map("n", "[b", ":bprevious<CR>", opts, { desc = "Previous buffer" })
map("n", "]b", ":bnext<CR>", opts, { desc = "Next buffer" })
map("n", "[B", ":bfirst<CR>", opts, { desc = "First buffer" })
map("n", "]B", ":blast<CR>", opts, { desc = "Last buffer" })

vim.keymap.set("n", "<leader>rr", function()
	local file = vim.fn.expand("%")

	local buf = vim.api.nvim_create_buf(false, true)

	vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = math.floor(vim.o.columns * 0.7),
		height = math.floor(vim.o.lines * 0.5),
		row = math.floor(vim.o.lines * 0.25),
		col = math.floor(vim.o.columns * 0.15),
		style = "minimal",
		border = "rounded",
	})

	vim.fn.termopen("go run " .. file)
	vim.cmd("startinsert")
end, { desc = "Go run current file (interactive)" })
