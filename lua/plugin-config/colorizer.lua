local status, colorizer = pcall(require, 'colorizer')
if not status then
  vim.notify('似乎没有安装 colorizer')
  return
end

colorizer.setup({})
pcall(
vim.cmd,
[[
augroup colorizer_toggle
autocmd!
autocmd BufEnter * ColorizerAttachToBuffer
augroup end
]]
)
