vim.opt.backupcopy = 'no'
vim.opt.clipboard = 'unnamedplus'
vim.opt.colorcolumn = '80'
vim.cmd('hi ColorColumn guibg=Black')
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.expandtab = true
vim.opt.fileformat = 'unix'
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.scrolloff = 255
vim.opt.shadafile = 'NONE'
vim.opt.shiftwidth = 4
vim.opt.showbreak = '+> '
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.statusline = '%=%= %-2{mode()}   %f %-22(%m%r%h%w%) %= %{&fileencoding} [%{&fileformat}] %= %5l:%-5c   %3p%% %=%='
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.timeoutlen = 50
vim.opt.termguicolors = true
vim.opt.visualbell = true

require('impatient')
require('init.keymaps')
require('init.packer')
require('init.lsp')
require('init.nvd')

vim.cmd('colorscheme tokyonight')

