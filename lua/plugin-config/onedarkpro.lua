print("hhh")
local status, onedarkpro = pcall(require, 'onedarkpro')
if not status then end return

onedarkpro.setup({
  dark_theme = "onedark_vivid"
})
