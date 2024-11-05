vim.opt.ts = 8
vim.opt.sts = 2
vim.opt.sw = 2
vim.opt.et = true
vim.opt.ai = true
vim.opt.visualbell = true
vim.opt.list = true
vim.opt.listchars = "tab:» ,trail:·,nbsp:·"

vim.opt.linebreak = true
vim.opt.showbreak = "↳ "
vim.opt.breakindent = true
vim.opt.breakindentopt = "min:40,shift:2,sbr"

vim.opt.encoding = "utf-8"

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.signcolumn = "no"

vim.cmd([[
syntax off
let loaded_matchparen = 1
autocmd FileType go setlocal ts=4
hi MatchParen cterm=bold,underline gui=bold,underline
]])

if vim.fn.has("macunix") == 1 then
  vim.opt.termguicolors = false
elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  vim.opt.termguicolors = true
  vim.opt.fileformats = "unix,dos"
  vim.opt.fileencodings = "utf-8,ucs-bom,default,latin1"
else
  vim.opt.termguicolors = true
end

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

local overrideFormattingCapability = {
  ['clangd']=true,
  ['tsserver']=true,
}

local function can_format(client)
  return client.server_capabilities.documentFormattingProvider and not overrideFormattingCapability[client.name]
end

vim.keymap.set('n', '<space>f', function()
  vim.cmd("Neoformat")
end)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)

    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil

    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if can_format(client) then
      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end
  end,
})

require('config.lazy')

-- Setup language servers.
-- local lspconfig = require('lspconfig')
-- lspconfig.clangd.setup {}
-- lspconfig.gopls.setup {}
-- lspconfig.pyright.setup {}
-- lspconfig.tsserver.setup {}
-- lspconfig.rust_analyzer.setup {}
