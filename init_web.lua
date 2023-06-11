require('common')

-- windows install
-- git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"

-- unix install
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\
--  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'sbdchd/neoformat'
  use {'neovim/nvim-lspconfig'}
end)
require('lsp/common')

-- npm i -g typescript-language-server typescript prettier

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {}

vim.cmd [[
let g:neoformat_enabled_javascript = ['prettier']
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]]
