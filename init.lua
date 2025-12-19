require('config.lazy')

vim.opt.ts = 8
vim.opt.sts = 2
vim.opt.sw = 2
vim.opt.et = true

vim.opt.textwidth = 79

vim.opt.ai = true
vim.opt.cindent = false
vim.opt.smartindent = false
vim.opt.indentexpr = ''
vim.opt.visualbell = true
vim.opt.list = true
vim.opt.listchars = "tab:▒░,trail:·,nbsp:·"

vim.opt.nu = false

vim.opt.linebreak = true
vim.opt.showbreak = "↳ "
vim.opt.breakindent = true
vim.opt.breakindentopt = "min:40,shift:2,sbr"

vim.opt.encoding = "utf-8"

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.signcolumn = "no"

if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  vim.opt.fileformats = "unix,dos"
  vim.opt.fileencodings = "utf-8,ucs-bom,default,latin1"
end

vim.cmd([[
  filetype indent off

  autocmd FileType cmake :setlocal ts=8 sw=8 sts=0 noet
  autocmd FileType go setlocal ts=4 sw=4 sts=0 noet
  autocmd FileType meson :setlocal ts=8 sw=8 sts=0 noet
  autocmd FileType make :setlocal ts=8 sw=8 sts=0 noet
  autocmd FileType python :setlocal ts=8 sw=4 sts=4 et
  autocmd FileType zig :setlocal ts=8 sw=4 sts=4 et

  set termguicolors
]])

-- vim.lsp.enable('ada_ls')
vim.lsp.enable('clangd')
-- vim.lsp.enable('clojure_lsp')
-- vim.lsp.enable('erlangls')
-- vim.lsp.enable('expert')
-- $ go install golang.org/x/tools/gopls@latest
vim.lsp.enable('gopls')
vim.lsp.enable('hls')
-- See: https://download.eclipse.org/jdtls/milestones/?d
-- vim.lsp.enable('jdtls')
-- $ opam install ocaml-lsp-server
-- vim.lsp.enable('ocamllsp')
vim.lsp.enable('pyright')
vim.lsp.enable('rust_analyzer')
-- $ gem install --user-install solargraph
-- vim.lsp.enable('solargraph')
-- $ npm install -g typescript-language-server typescript
vim.lsp.enable('ts_ls')
vim.lsp.enable('zls')

vim.keymap.set('n', '<space>f', function()
  vim.cmd("Neoformat")
end)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.opt.formatprg = ''
  end,
})
