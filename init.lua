require('common')

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.clangd.setup {}
lspconfig.gopls.setup {}
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}

