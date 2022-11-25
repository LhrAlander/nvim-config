local status, comment = pcall(require, 'Comment')
if not status then
  vim.notify('似乎没有安装 Comment')
  return
end

comment.setup({
  
})
