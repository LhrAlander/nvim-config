local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then
  vim.notify('似乎没有安装treesitter')
  return
end

treesitter.setup({
  ensure_installed = 'all',
  auto_install = true,
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  ident = {
    enable = true,
  }
})
