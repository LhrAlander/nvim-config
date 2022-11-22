vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

map("n", "s", "", opt)
-- split and move right
map("n", "sl", ":vsp<CR>", opt)
-- split and move down
map("n", "sj", ":sp<CR>", opt)
map("n", "sc", "<C-w>c", opt)
-- close other windows
map("n", "so", "<C-w>o", opt)

-- Option + hjkl move throw windows
map("n", "˙", "<C-w>h", opt)
map("n", "∆", "<C-w>j", opt)
map("n", "˚", "<C-w>k", opt)
map("n", "¬", "<C-w>l", opt)

-- window resize Option + .,ui
map("n", "≥", ":vertical resize -20<CR>", opt)
map("n", "≤", ":vertical resize +20<CR>", opt)
map("n", "…", ":resize +20<CR>", opt)
map("n", "æ", ":resize -20<CR>", opt)
