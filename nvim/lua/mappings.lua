-------------------- HELPERS ------------------------------

local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local g = vim.g      -- a table to access global variables

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-------------------- CONFIG -------------------------------
g['mapleader'] = ' ' -- leader key

map('i', 'kj', '<ESC>')
-- Init file on a split
map('n', '<leader>v', ':vs $MYVIMRC')
-- Clear highlight
map('n', '<leader><leader>', ':noh<CR>')
-- Fat fingers, avoid close
map('c', 'wq', 'w')
-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
-- Startify
map('n', '<leader>d', ':Startify<CR>')
-- Nvim Tree
map('n', '<leader>tt', ':NvimTreeToggle<CR>')
map('n', '<leader>tr', ':NvimTreeRefresh<CR>')
map('n', '<leader>tn', ':NvimTreeFindFile<CR>')
