require('config.lazy')

vim.opt.ts = 8
vim.opt.sts = 2
vim.opt.sw = 2
vim.opt.et = true
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
  set bg=light
  colorscheme quiet
  hi Normal guibg=#ffffff
  hi LineNr guibg=#d0d0d0
  hi Whitespace guifg=#e0e0e0
  hi SpecialKey guifg=#e0e0e0
  hi clear Comment
  hi clear TODO
  hi Comment guifg=#505050
]])

vim.lsp.enable('clangd')
vim.lsp.enable('gopls')
vim.lsp.enable('pyright')
vim.lsp.enable('rust-analyzer')
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
  end,
})
