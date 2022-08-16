-- Window options
local wo = vim.wo
wo.number = true
wo.relativenumber = true
wo.list = true
wo.cursorline = true
wo.colorcolumn = "+1"
wo.signcolumn = "yes"

-- Buffer options
local o = vim.opt
o.spelllang = "en,es_mx"
-- Non-visible chars
o.listchars = {
  tab = '▸ ',
  trail = '·',
  eol = '¬',
  extends = '»',
  precedes = '«',
  nbsp = '+'
}
-- Fill chars used when functionality requires it, like
-- when on a diff split
-- Other usefull chars: , │
o.fillchars = {
  diff = '⣿',
  eob = '•'
}
-- When line has been "warped", show this char
o.showbreak = '↪'
-- Ignore changes of white space on diffs
o.diffopt:append('iwhite')
-- Start diff in vertical splits
o.diffopt:append('vertical')
-- Ignore case when searching
o.ignorecase = true
-- Turn case sensitive when caps are present
o.smartcase = true
-- Start scrooling 3 lines before reaching edge of the screen
o.scrolloff = 3
-- Minimum chars off the screen to start scrolling (whe wrap is off)
o.sidescroll = 1
-- Start scrolling veritcally 6 char before reaching screen edge
o.sidescrolloff = 6
-- Show matching parens
o.showmatch = true
-- Show match for this amount of milliseconds
o.matchtime = 10
-- Custom fold text
o.foldtext = "v:lua.require('fold_text').my_fold_text()"
-- Config for snipets plugin
o.completeopt = "menu,menuone,noselect"
-- Share clipboard with the system
o.clipboard = "unnamedplus"
o.shadafile = vim.env.HOME .. "/.config/nvim/temp/shada"
o.undofile = true

-- Global options
local g = vim.g
g.cmdheight = 2
g.lazyredraw = true
g.backup = true
g.noswapfile = true
g.autowrite = true
g.autoread = true
g.termguicolors = true
g.background = 'dark'

-- Commands
local cmd = vim.cmd
cmd("colorscheme tokyonight")

