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

vim.opt.encoding = "utf-8"

vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.updatetime = 300

vim.cmd[[hi MatchParen cterm=bold,underline gui=bold,underline]]

