local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    {
      'rmehri01/onenord.nvim',
      config = function()
        require('onenord').setup()
      end
    },
    {
      'goolord/alpha-nvim',
      requires = { 'nvim-tree/nvim-web-devicons' },
      config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
      end
    },
    'neovim/nvim-lspconfig', -- Has a config file
    {
      "glepnir/lspsaga.nvim",
      event = "BufRead",
      config = function()
        require("lspsaga").setup()
      end,
      dependencies = {
        {"nvim-tree/nvim-web-devicons"},
        --Make sure you install markdown and markdown_inline parser on treesitter
        {"nvim-treesitter/nvim-treesitter"}
      }
    },
    {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        require('nvim-treesitter.install').update({ with_sync = true })
      end,
    },
    {
      'folke/noice.nvim',
      dependencies = {
        {'MunifTanjim/nui.nvim'},
        {'rcarriga/nvim-notify'}
      },
      config = function()
        require('noice').setup()
        -- Remember to install Treesitter's VIM plugin
      end
    }, -- Fancy remplacement for messages, command and notifications
    'MunifTanjim/nui.nvim', -- Required for fancy Noice plugin
    {
      'rcarriga/nvim-notify',
      config = function()
        vim.opt.termguicolors = true -- Required for opacity and animations
        require('notify').setup({})
        require('telescope').load_extension('notify')
      end,
      dependencies = {
        {'nvim-telescope/telescope.nvim'} -- Be able to list and filter notifications
      }
    }, -- Pretty notifications for errors and messages
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim', -- Also requirement for gitsigns
    {
      'nvim-telescope/telescope.nvim',
      opts = {
        pickers = {
          find_files = {
            prompt_prefix = " 🔍 "
          }
        }
      }
    },
    {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup()
      end
    }, -- Auto-close parens
    'tpope/vim-commentary',
    'tpope/vim-repeat',
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'tpope/vim-surround',
    'tpope/vim-endwise', -- Adding the correct 'closing' to a language construct
    'tpope/vim-rails',
    'thoughtbot/vim-rspec',
    {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }, -- Requires Plenary
    'lukas-reineke/indent-blankline.nvim',
    'sheerun/vim-polyglot',
    'vim-scripts/AnsiEsc.vim',
    'andymass/vim-matchup',
    'elixir-editors/vim-elixir',
    'Glench/Vim-Jinja2-Syntax',
    'hoob3rt/lualine.nvim',
    'nvim-tree/nvim-web-devicons', -- This is also used by Alpha dashboard
    {
      'kyazdani42/nvim-tree.lua',
      config = function()
        require('nvim-tree').setup({})
      end
    },
  },
  opts
)

vim.g.matchup_matchparen_offscreen = { method = 'popup'}
vim.g.nvim_tree_refresh_wait = 500 -- Default is 1000, how often to refresh the tree
vim.notify = require('notify') -- Use nvim-notify to show pretty notifications
