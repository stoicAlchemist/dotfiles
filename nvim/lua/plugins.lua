-------------------- HELPERS ------------------------------

local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

-- Required if opt is set to false
cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Themes
  use({'wbthomason/packer.nvim', opt = false})
  use('folke/tokyonight.nvim')
  use('joshdick/onedark.vim')
  use('morhetz/gruvbox')
  use('sainnhe/everforest')
  use {
    'goolord/alpha-nvim',
    config = function ()
      require'alpha_conf'
      -- require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }

  --------------------- LSP --------------------------
  use('neovim/nvim-lspconfig')
  use('tami5/lspsaga.nvim') -- lspsaga fork, pretty lsp notifications
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- cmp sources, an autocomplete plugin
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/nvim-cmp')

  -- vsnip sources for cmp and also vsnip, a snipets plugin
  use('hrsh7th/cmp-vsnip')
  use('hrsh7th/vim-vsnip')

  ----------------- Telescope ------------------------------
  use('nvim-lua/popup.nvim')
  use('nvim-lua/plenary.nvim') -- Also requirement for gitsigns
  use('nvim-telescope/telescope.nvim')

  use('windwp/nvim-autopairs') -- Auto-close parens

  ------------------ Tim Pope stuff --------------------------
  use('tpope/vim-commentary')
  use('tpope/vim-repeat')
  use('tpope/vim-fugitive')
  use('tpope/vim-rhubarb')
  use('tpope/vim-surround')
  use('tpope/vim-endwise') -- Adding the correct 'closing' to a language construct
  use('tpope/vim-rails')

  use('thoughtbot/vim-rspec')

  use('lewis6991/gitsigns.nvim') -- Requires Plenary
  use('lukas-reineke/indent-blankline.nvim')
  use('sheerun/vim-polyglot')
  use('vim-scripts/AnsiEsc.vim')

  use('andymass/vim-matchup')
  vim.g.matchup_matchparen_offscreen = { method = 'popup'}

  use('elixir-editors/vim-elixir')
  use('Glench/Vim-Jinja2-Syntax')
  use('hoob3rt/lualine.nvim')

  use('kyazdani42/nvim-web-devicons') -- This is also used by Alpha dashboard
  use('kyazdani42/nvim-tree.lua')
  vim.g.nvim_tree_refresh_wait = 500 -- 1000 by default, how often the tree can be refreshed
end)

