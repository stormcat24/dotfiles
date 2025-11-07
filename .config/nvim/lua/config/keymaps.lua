-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Line navigation: 1 = line start, 0 = line end
map("n", "1", "^", { desc = "Go to line start" })
map("n", "0", "$", { desc = "Go to line end" })

-- Disable arrow keys
map({ "n", "v", "i" }, "<Up>", "<Nop>")
map({ "n", "v", "i" }, "<Down>", "<Nop>")
map({ "n", "v", "i" }, "<Left>", "<Nop>")
map({ "n", "v", "i" }, "<Right>", "<Nop>")

-- Semicolon to command mode
map("n", ";", ":", { desc = "Command mode" })

-- Exit insert mode with jj
map("i", "jj", "<ESC>", { desc = "Exit insert mode" })

-- Insert mode navigation
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })

-- Page navigation with Space+j/k
map("n", "<Space>j", "<C-f>", { desc = "Page down" })
map("n", "<Space>k", "<C-b>", { desc = "Page up" })

-- Clear search highlight with ESC ESC
map("n", "<ESC><ESC>", ":nohlsearch<CR><ESC>", { desc = "Clear search highlight", silent = true })
