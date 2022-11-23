  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  local map = vim.api.nvim_set_keymap
  local opt = { noremap = true, silent = true }
  map("n", "s", "", opt)
  -- increment/decrement
  map("n", "+", "<C-a>", opt)
  map("n", "-", "<C-x>", opt)
  -- slect all
  map("n", "<C-a>", 'gg<S-v>G', opt)
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

  -- lsp
  pluginKeys.map_lsp = function(mapbuf)
    mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")
    mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
    mapbuf("n", "<leader>gd", "<cmd>Lspsaga preview_definition<CR>")
    mapbuf("n", "<leader>gh", "<cmd>Lspsaga hover_doc<CR>")
    mapbuf("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
    mapbuf("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    mapbuf("n", "<leader>gr", "<cmd>Lspsaga lsp_finder<CR>")
    mapbuf("n", "<leader>gp", "<cmd>Lspsaga show_line_diagnostics<CR>")
    mapbuf("n", "<leader>gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    mapbuf("n", "<leader>gj", "<cmd>Lspsaga diagnostic_jump_next<CR>")
    mapbuf("n", "<S-¬>", "<cmd>lua vim.diagnostic.formatting()<CR>")
  end

  -- cmp
  pluginKeys.cmp = function(cmp)
    return {
    -- 出现补全
    ["<C-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    -- 取消
    ["<C-,>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close()
    }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    -- 上一个
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- 确认
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- 如果窗口内容太多，可以滚动
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
  }
end


return pluginKeys
