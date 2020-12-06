call plug#begin('~/.config/nvim/plugged')

Plug 'ghifarit53/tokyonight-vim' " Theme
Plug 'drewtempelmeyer/palenight.vim' " Theme
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug 'coreyja/fzf.devicon.vim' " Same as fzf.vim but with devicons, needs the devicon-lookup crate (cargo install devicon-lookup)
Plug 'machakann/vim-sandwich'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'Raimondi/delimitMate' " Auto-close matching parens, not perfect
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on':  'NERDTreeToggle'}
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'bryanmylee/vim-colorscheme-icons' " DevIcons color in Startify
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'

" Javascript/React {{{
" Plug 'yuezk/vim-js', { 'for': 'javascript' }
" Plug 'HerringtonDarkholme/yats.vim', { 'for': 'javascript' }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': 'javascript' } " Conflicts with VIM Polyglot
Plug 'leafgarland/typescript-vim', { 'for': 'javascript' } " vim-jsx-typescript dep
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'peitalin/vim-jsx-typescript', { 'for': 'javascript' }
" }}}

" Ruby and Rails {{{
Plug 'tpope/vim-rails'
" }}}
call plug#end()

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
" }}}
" NERDTree {{{

nnoremap <leader>t :NERDTreeToggle<CR>
" Don't show list chars when on NERDTree
autocmd FileType nerdtree setlocal nolist
let g:NERDTreeQuitOnOpen = 1

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
" }}}

source $HOME/.config/nvim/coc.conf.vim

" Special chars: , │
" }}}
