lua <<EOF
local cmd = vim.cmd
local o = vim.o
local g = vim.g
local fn = vim.fn

cmd 'packadd paq-nvim' -- loading package manager
local paq = require'paq-nvim'.paq -- Import module and bind `paq` function

paq{'savq/paq-nvim', opt = true} -- Let Paq manage itself

-- Packages
paq 'ghifarit53/tokyonight-vim' -- Theme
paq 'drewtempelmeyer/palenight.vim' -- Theme
paq 'morhetz/gruvbox' -- Theme

paq{'junegunn/fzf', run = fn['fzf#install']}
paq 'junegunn/fzf.vim'

paq 'mhinz/vim-startify'
paq 'mhinz/vim-signify'
paq{'neoclide/coc.nvim', branch = 'release'}

paq 'Raimondi/delimitMate' -- Auto-close matching parens, not perfect
paq 'vwxyutarooo/nerdtree-devicons-syntax'
paq 'bryanmylee/vim-colorscheme-icons' -- DevIcons color in Startify
paq 'tpope/vim-commentary'
paq 'tpope/vim-repeat'
paq 'tpope/vim-surround'
paq 'tpope/vim-fugitive'
paq 'tpope/vim-endwise' -- Help adding the correct 'closing' to a language construct
paq 'vim-airline/vim-airline'
paq 'vim-airline/vim-airline-themes'
paq 'Yggdroot/indentLine'
paq 'sheerun/vim-polyglot'
paq 'andymass/vim-matchup' -- Show off screen matches and more
paq 'vim-scripts/AnsiEsc.vim' -- Colorize Ansi output (console output)

-- Javascript/React {{{
-- paq 'yuezk/vim-js'
-- paq 'HerringtonDarkholme/yats.vim'
paq 'MaxMEllon/vim-jsx-pretty' -- Conflicts with VIM Polyglot
paq 'leafgarland/typescript-vim' -- vim-jsx-typescript dep
paq 'pangloss/vim-javascript'
paq 'peitalin/vim-jsx-typescript'
-- }}}

-- Ruby and Rails {{{
paq 'tpope/vim-rails'
-- }}}

-- Elixir {{{
paq 'elixir-editors/vim-elixir'
-- }}}

-- TreeSitter {{{
paq{'nvim-treesitter/nvim-treesitter', run = fn[':TSUpdate']}
-- }}}

-- Telescope {{{
paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-telescope/telescope.nvim' -- fuzzy finder alternative
-- }}}

-- DevIcons {{{
-- Puting this before devicons to preserve order
paq 'preservim/nerdtree'
paq 'Xuyuanp/nerdtree-git-plugin'
paq 'ryanoasis/vim-devicons' -- The plugins that use this need to be loaded before
--}}}

EOF

" Matchup {{{
let g:matchup_matchparen_offscreen = {'method': 'popup'}
" }}}

" Plugin Configs {{{
set termguicolors " Some colorschemes require this to be set before
colorscheme palenight
set background=dark
let g:airline_theme='palenight'

" Airline {{{

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
  let g:airline_powerline_fonts = 1
endif
let g:airline_detect_spell     = 0 " Don't display spell
let g:airline#extensions#hunks#enabled = 0 " Don't display the hunks info
let g:airline#extensions#ale#enabled = 1

" }}}

" FZF {{{
nmap <leader>f :GFiles<CR>
nmap <leader>b :Buffers<CR>
"}}}

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

" Vim Javascript {{{
let g:javascript_plugin_jsdoc = 1
" }}}

" Signify {{{
set updatetime=100
let g:signify_sign_add=''
let g:signify_sign_delete=''
let g:signify_sign_change=''
" }}}

" NERDTree {{{

nnoremap <leader>t :NERDTreeToggle<CR>
" Don't show list chars when on NERDTree
autocmd FileType nerdtree setlocal nolist
let g:NERDTreeQuitOnOpen = 1


source $HOME/.config/nvim/coc.conf.vim

" Special chars: , │
" }}}

" Disable arrow icons at the left side of folders for NERDTree.
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ' '
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
highlight! link NERDTreeFlags NERDTreeDir
autocmd FileType nerdtree setlocal signcolumn=no
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" }}}

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

let g:webdevicons_enable_airline_statusline = 1
" }}}
