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
map("n", "s=", "<C-w>=", opt)

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

-- terminal
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>lt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)

map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- plugins keybinding mappings
local pluginKeys = {}

-- nvim-tree
map("n", "<S-T>", ":NvimTreeToggle<CR>", opt)
pluginKeys.nvimTreeList = {
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  { key = {"v"}, action = "vsplit" },
  { key = {"h"}, action = "split" },
  { key = {"."}, action = "toggle_dotfiles" },
  { key = {"l", "<F5>"}, action = "refresh" },
  { key = {"a"}, action = "create" },
  { key = {"d"}, action = "remove" },
  { key = {"r"}, action = "rename" },
  { key = {"x"}, action = "cut" },
  { key = {"c"}, action = "copy" },
  { key = {"p"}, action = "paste" },
  { key = {"s"}, action = "system_open" },
}

-- bufferline
map("n", "<S-H>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<S-L>", ":BufferLineCycleNext<CR>", opt)
map("n", "∑", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- telescope
map("n", "<S-P>", ":Telescope find_files<CR>", opt)
map("n", "<S-F>", ":Telescope live_grep<CR>", opt)


return pluginKeys
