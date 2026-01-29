local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clear search highlight
map("n", "<leader>h", "<cmd>nohlsearch<cr>", opts)

-- Better motion
map("i", "jj", "<Esc>", opts)
map("i", "kk", "<Esc>", opts)
map("i", "jk", "<Esc>", opts)
map("i", "kj", "<Esc>", opts)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize splits
map("n", "<A-h>", "<cmd>vertical resize -3<cr>", opts)
map("n", "<A-l>", "<cmd>vertical resize +3<cr>", opts)
map("n", "<A-j>", "<cmd>resize -2<cr>", opts)
map("n", "<A-k>", "<cmd>resize +2<cr>", opts)
