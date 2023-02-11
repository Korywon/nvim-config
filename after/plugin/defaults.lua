-- Colorscheme
vim.cmd.colorscheme 'catppuccin'

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Tabbing shenanigans
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.tabstop = 2

vim.opt.colorcolumn = '80' -- highlights at column 80
vim.opt.number = true -- shows current line number
vim.opt.relativenumber = true -- shows relative line number

-- Enable fancy notifications
vim.notify = require('notify')

