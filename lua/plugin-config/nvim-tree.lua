local status, nvim_tree = pcall(require, "nvim-tree")

if not status then
  vim.notify('似乎没有安装nvim-tree')
  return
end

local listKeys = require('keybindings').nvimTreeList

nvim_tree.setup({
  git = {
    enable = false
  },
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    width = 40,
    side = 'left',
    hide_root_folder = false,
    mappings = {
      custom_only = false,
      list = listKeys,
    },
    number = false,
    relativenumber = false,
    signcolumn = 'yes',
  },
  actions = {
    open_file = {
      resize_window = true,
      quit_on_open = false
    },
  },
  system_open = {
    cmd = 'open'
  },
})


