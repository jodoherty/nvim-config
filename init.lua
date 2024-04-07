vim.cmd [[ let loaded_matchparen = 1 ]]

require('common')

vim.cmd [[ set rtp^=~/.opam/default/share/ocp-indent/vim ]]

-- Setup language servers.
-- local lspconfig = require('lspconfig')
-- lspconfig.clangd.setup {}
-- lspconfig.gopls.setup {}
-- lspconfig.pyright.setup {}
-- lspconfig.tsserver.setup {}
-- lspconfig.rust_analyzer.setup {}
