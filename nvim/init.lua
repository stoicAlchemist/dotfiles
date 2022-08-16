-- Author: Brian Martinez
-- Description: Personal NeoVim configuration file
-- Contact xangelux at gmail dot com

-- Add an autocommand to source pluggings.lua when it's edited
require('plugins')
vim.api.nvim_create_augroup('reload_plugins', {clear = true})
local au_plugins_reload = function() require('plugins') end
vim.api.nvim_create_autocmd({"BufWritePost"}, {
		pattern = {"plugins.lua"},
		callback = au_plugins_reload,
		group = "reload_plugins"
	})

-- Configurations
require('lsp_conf')
require('treesitter_conf')
require('nvim_cmp_conf')
-- Requires setup but for one line doesn't need a lua file
require('nvim-autopairs').setup()
require('gitsigns').setup()

require('lualine_conf')
require('nvim_tree_conf')
require('alpha_conf')

-- Customizing Nvim
require('custom')
require('directories')
require('mappings')

