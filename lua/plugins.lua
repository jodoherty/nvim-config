return {
  {'sbdchd/neoformat'},
  {'neovim/nvim-lspconfig'},
  {'nvim-mini/mini.icons'},
  {'nvim-tree/nvim-web-devicons', opts = {}},
  {
    'folke/snacks.nvim',
    ---@type snacks.Config
    opts = {
      explorer = {},
      picker = {
        sources = {
          explorer = {}
        }
      }
    },
    keys = {
      { '<leader><space>', function() Snacks.picker.smart() end, desc = 'Smart Find Files' },
      { '<leader>e', function() Snacks.explorer() end, desc = 'File Explorer' },
    },
  }
}
