call plug#begin('~/.config/nvim/plugged')

Plug 'joshdick/onedark.vim' " Theme
Plug 'morhetz/gruvbox' " Theme

Plug 'junegunn/vim-easy-align' " Default mapping conflicts with cmp
Plug 'mhinz/vim-startify'
Plug 'bryanmylee/vim-colorscheme-icons' " DevIcons color in Startify

" LSP **************
Plug 'neovim/nvim-lspconfig'
Plug 'tami5/lspsaga.nvim' " Fork
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" cmp sources ******
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip' " VSnip, snippets

" For luasnip users.
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy'
" ******************

" Telescope ********
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" ******************

Plug 'windwp/nvim-autopairs' " Auto-close parens

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise' " Help adding the correct 'closing' to a language construct
Plug 'tpope/vim-rails'

Plug 'thoughtbot/vim-rspec'

Plug 'lewis6991/gitsigns.nvim' " Requires Plenary

Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'andymass/vim-matchup' " Show off screen matches and more
Plug 'vim-scripts/AnsiEsc.vim' " Colorize Ansi output (console output)

" Matchup {{{
let g:matchup_matchparen_offscreen = {'method': 'popup'}
" }}}
" Plug 'yuezk/vim-js', { 'for': 'javascript' }
" Plug 'HerringtonDarkholme/yats.vim', { 'for': 'javascript' }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': 'javascript' } " Conflicts with VIM Polyglot
Plug 'leafgarland/typescript-vim', { 'for': 'javascript' } " vim-jsx-typescript dep
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'peitalin/vim-jsx-typescript', { 'for': 'javascript' }

Plug 'elixir-editors/vim-elixir'
Plug 'Glench/Vim-Jinja2-Syntax'

Plug 'hoob3rt/lualine.nvim' " Status bar in lua
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'ryanoasis/vim-devicons' " The plugins that use this need to be loaded before
call plug#end()

" Plugin Configs {{{
set termguicolors " Some colorschemes require this to be set before
set background=dark
" let g:gruvbox_italic=1
colorscheme onedark

" vim-easy-align {{{
vmap <leader><Enter> <Plug>(EasyAlign)
" }}}

" Startify {{{
nnoremap <leader>d :Startify<CR>

" Don't change to directory of file visited throgh Startify
let g:startify_change_to_dir = 0

" Fancy custom header
let g:startify_custom_header = [
  \ "  ",
  \ '   ┏┓ ╻   ╻ ╻   ╻   ┏┳┓',
  \ '   ┃┗┓┃   ┃┏┛   ┃   ┃┃┃',
  \ '   ╹ ┗┛   ┗┛    ╹   ╹ ╹',
  \ '   ',
  \ ]
" }}}

" IndentLine {{{
let g:indentLine_char = '│'
" }}}

" Matchup {{{
let g:matchup_matchparen_offscreen = {'method': 'popup'}
" }}}

" Vim Javascript {{{
let g:javascript_plugin_jsdoc = 1
" }}}

" Special chars: , │

" DevIcons {{{

    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {} " needed
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.spec\.ts$'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['^package.json$'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['lock'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['^Jenkinsfile$'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['^Gemfile$'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.ru$'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['^Rakefile$'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['^README\.'] = ''

    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['properties'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tgz'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['erb'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jbuilder'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = ''
" }}}

" LSP {{{
luafile ~/.config/nvim/lua/lsp.conf.lua
luafile ~/.config/nvim/lua/treesitter.conf.lua
luafile ~/.config/nvim/lua/lspsaga.conf.lua

" VSnip {{{
set completeopt=menu,menuone,noselect

luafile ~/.config/nvim/lua/nvim.cmp.conf.lua
" }}}

" Nvim autopairs {{{

lua <<EOF
require('nvim-autopairs').setup()
EOF
" }}}

" }}}
" }}}

" Lualine {{{
luafile ~/.config/nvim/lua/lualine.conf.lua
" }}}

" Telescope {{{
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" }}}

" nvim-tree {{{

" let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', '_build' ] "empty by default
" let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

nnoremap <leader>t <cmd>NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus and NvimTreeResize are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`

luafile ~/.config/nvim/lua/nvim-tree.conf.lua
" }}}

" gitsigns {{{
lua <<EOF
require('gitsigns').setup()
EOF
" }}}

" }}}

