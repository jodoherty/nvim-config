vim.opt.bg = "dark"
vim.opt.colorcolumn = "80,120"
vim.opt.termguicolors = true
vim.cmd [[ hi ColorColumn guibg=#181818 ]]
vim.cmd [[ hi LineNr guibg=#333333 guifg=#888888 ]]
vim.cmd [[ hi SignColumn guibg=#252525 ]]

vim.api.nvim_set_hl(0, 'FloatBorder', {bg='#3B4252', fg='#5E81AC'})
vim.api.nvim_set_hl(0, 'NormalFloat', {bg='#3B4252'})
vim.api.nvim_set_hl(0, 'TelescopeNormal', {bg='#3B4252'})
vim.api.nvim_set_hl(0, 'TelescopeBorder', {bg='#3B4252'})
