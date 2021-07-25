call plug#begin('~/.config/nvim/plugged')

Plug 'marko-cerovac/material.nvim' " Theme

Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'bryanmylee/vim-colorscheme-icons' " DevIcons color in Startify

" LSP **************
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'hrsh7th/nvim-compe' " Better Completion
" ******************

" Telescope ********
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" ******************

Plug 'windwp/nvim-autopairs' " Auto-close parens

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise' " Help adding the correct 'closing' to a language construct
Plug 'tpope/vim-rails'

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
Plug 'elixir-lsp/elixir-ls', { 'do': { -> g:ElixirLS.compile() }}


Plug 'hoob3rt/lualine.nvim' " Status bar in lua
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'ryanoasis/vim-devicons' " The plugins that use this need to be loaded before
call plug#end()

" Plugin Configs {{{
set termguicolors " Some colorschemes require this to be set before
set background=dark
let g:material_style = 'darker'
colorscheme material

" Elixir LSP, Based on this site: https://bernheisel.com/blog/vim-elixir-ls-plug {{{
let g:ElixirLS = {}
let ElixirLS.path = stdpath('config').'/plugged/elixir-ls'
let ElixirLS.lsp = ElixirLS.path.'/release/language_server.sh'
let ElixirLS.cmd = join([
      \ 'cp .release-tool-versions .tool-versions &&',
      \ 'asdf install &&',
      \ 'mix do',
      \ 'local.hex --force --if-missing,',
      \ 'local.rebar --force,',
      \ 'deps.get,',
      \ 'compile,',
      \ 'elixir_ls.release &&',
      \ 'rm .tool-versions'
      \ ], ' ')

function ElixirLS.on_stdout(_job_id, data, _event)
  let self.output[-1] .= a:data[0]
  call extend(self.output, a:data[1:])
endfunction

let ElixirLS.on_stderr = function(ElixirLS.on_stdout)

function ElixirLS.on_exit(_job_id, exitcode, _event)
  if a:exitcode[0] == 0
    echom '>>> ElixirLS compiled'
  else
    echoerr join(self.output, ' ')
    echoerr '>>> ElixirLS compilation failed'
  endif
endfunction

function ElixirLS.compile()
  let me = copy(g:ElixirLS)
  let me.output = ['']
  echom '>>> compiling ElixirLS'
  let me.id = jobstart('cd ' . me.path . ' && git pull && ' . me.cmd, me)
endfunction

" If you want to wait on the compilation only when running :PlugUpdate
" then have the post-update hook use this function instead:

" function ElixirLS.compile_sync()
"   echom '>>> compiling ElixirLS'
"   silent call system(g:ElixirLS.cmd)
"   echom '>>> ElixirLS compiled'
" endfunction

" Then, update the Elixir language server
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
" LSPSaga {{{
luafile ~/.config/nvim/lua/lspsaga.conf.lua
nnoremap <silent>K :Lspsaga hover_doc<CR>
" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" Signature help
nnoremap <silent> gs :Lspsaga signature_help<CR>
" Preview definition
nnoremap <silent> gd :Lspsaga preview_definition<CR>
" Show diagnostics
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
" Jump to diagnostic
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
" }}}
" Nvim Compe {{{
luafile ~/.config/nvim/lua/nvim-compe.conf.lua
set completeopt=menuone,noselect
inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Nvim autopairs {{{
inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
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
nnoremap <leader>t <cmd>NvimTreeToggle<CR>
" }}}

" }}}

