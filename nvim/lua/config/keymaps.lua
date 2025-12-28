local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Clear search highlights
map("n", "<leader>nh", ":nohl<CR>", opts, { desc = "Clear search highlights" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts, { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", opts, { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", opts, { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", opts, { desc = "Window right" })

map("n", "<leader>wh", "<C-w>h", opts, { desc = "Window left" })
map("n", "<leader>wj", "<C-w>j", opts, { desc = "Window down" })
map("n", "<leader>wk", "<C-w>k", opts, { desc = "Window up" })
map("n", "<leader>wl", "<C-w>l", opts, { desc = "Window right" })
