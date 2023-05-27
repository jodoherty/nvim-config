require('lsp/common')

-- npm i -g typescript-language-server typescript pyright

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}

