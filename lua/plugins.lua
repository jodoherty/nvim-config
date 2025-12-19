return {
  { "ellisonleao/gruvbox.nvim" },
  { 'sbdchd/neoformat' },
  { 'neovim/nvim-lspconfig' },
--  { 'mfussenegger/nvim-jdtls' },
  { 'nvim-mini/mini.icons' },
  { 'nvim-tree/nvim-web-devicons', opts = {} },
  {
    'folke/snacks.nvim',
    ---@type snacks.Config
    opts = {
      explorer = {
        replace_netrw = false,
        trash = false,
      },
      picker = {
        formatters = {
          file = {
            git_status_hl = false,
          },
        },
        icons = {
          git = {
            enabled = false,
          },
        },
        sources = {
          explorer = {}
        },
      }
    },
    keys = {
      { '<leader><space>', function() Snacks.picker.smart() end, desc = 'Smart Find Files' },
      { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { '<leader>e', function() Snacks.explorer() end, desc = 'File Explorer' },
    },
  }
}
