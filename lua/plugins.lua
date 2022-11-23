local packer = require("packer")
packer.startup(
function (use)
  use 'wbthomason/packer.nvim'
  use 'ful1e5/onedark.nvim'
  use 'folke/tokyonight.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
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
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  })
  -- lsp
  use('williamboman/nvim-lsp-installer')
  -- 补全引擎
  use("hrsh7th/nvim-cmp")
  -- snippet 引擎
  use("hrsh7th/vim-vsnip")
  -- 补全源
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
  use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
  use("hrsh7th/cmp-path") -- { name = 'path' }
  use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

  -- 常见编程语言代码段
  use("rafamadriz/friendly-snippets")
  use("onsails/lspkind-nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("tami5/lspsaga.nvim" )
  -- lsp
  use 'neovim/nvim-lspconfig'
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
