local status, bufferline = pcall(require, "bufferline")

if not status then
  vim.notify('似乎没有安装bufferline')
  return
end

bufferline.setup({
  options = {
    colse_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
  },

})
