local packer = require("packer")
packer.startup(
  function (use)
    use 'wbthomason/packer.nvim'
  end,
  {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    }
  }
)
