local packer = require("packer")
packer.startup(
  function (use)
    use 'wbthomason/packer.nvim'
    use 'ful1e5/onedark.nvim'
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons',
      },
      tag = 'nightly'
    }
    use {
      'akinsho/bufferline.nvim',
      tag = "v3.*",
      requires = { 'nvim-tree/nvim-web-devicons', 'moll/vim-bbye' }
    }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'arkav/lualine-lsp-progress'
    use {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
  end,
  {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    }
  }
)

pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    autoCmd end
  ]]
)
