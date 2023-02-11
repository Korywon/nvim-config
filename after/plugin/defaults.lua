-- Colorscheme
vim.cmd.colorscheme 'catppuccin'

-- Tabbing shenanigans
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.tabstop = 2

vim.opt.colorcolumn = '80' -- highlights at column 80
vim.opt.number = true -- shows current line number
vim.opt.relativenumber = true -- shows relative line number

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable fancy notifications
vim.notify = require('notify')

-- Setup telescope shenanigans
local telescope = require('telescope')
telescope.setup {
  pickers = {
    find_files = {
      hidden = true
    }
  }
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Barbar config (defaults)
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

-- Lspsaga shenanigans
local keymap = vim.keymap.set

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like 'open vsplit',
-- you can use <C-t> to jump back
keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>')

-- Code action
keymap({'n','v'}, '<leader>ca', '<cmd>Lspsaga code_action<CR>')

-- Rename all occurrences of the hovered word for the entire file
keymap('n', 'gr', '<cmd>Lspsaga rename<CR>')

-- Rename all occurrences of the hovered word for the selected files
keymap('n', 'gr', '<cmd>Lspsaga rename ++project<CR>')

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to 'definition_action_keys'
-- It also supports tagstack
-- Use <C-t> to jump back
keymap('n', 'gd', '<cmd>Lspsaga peek_definition<CR>')

-- Go to definition
keymap('n','gd', '<cmd>Lspsaga goto_definition<CR>')

-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap('n', '<leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>')

-- Show cursor diagnostics
-- Like show_line_diagnostics, it supports passing the ++unfocus argument
keymap('n', '<leader>sc', '<cmd>Lspsaga show_cursor_diagnostics<CR>')

-- Show buffer diagnostics
keymap('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>')

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
keymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>')

-- Lualine setup
require('lualine').setup{
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
  },
  sections = {lualine_c = {require('auto-session-library').current_session_name}}
}

