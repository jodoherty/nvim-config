vim.cmd([[
if has("win32") || has("win64")
  lua require('windows')
elseif !$TERM_PROGRAM =~ "Apple_Terminal"
  lua require('unix')
else
  lua require('macunix')
endif
]])

vim.opt.ts = 8
vim.opt.sts = 2
vim.opt.sw = 2
vim.opt.et = true
vim.opt.ai = true
vim.opt.visualbell = true
vim.opt.list = true

vim.opt.encoding = "utf-8"

vim.opt.backup = false
vim.opt.writebackup = false

vim.cmd([[
autocmd FileType go setlocal ts=4
hi MatchParen cterm=bold,underline gui=bold,underline
]])

-- windows install
-- git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"

-- unix install
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'sbdchd/neoformat'
  use {'neovim/nvim-lspconfig'}
end)
require('lsp/common')
