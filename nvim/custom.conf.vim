set number
set relativenumber
set textwidth=100

" Movement {{{
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" }}}

inoremap kj <ESC>
nnoremap <CR> za
vnoremap <CR> za
nnoremap <leader>v :vsplit $MYVIMRC<CR>
cmap wq w

" TUI {{{
set colorcolumn=+1
set spelllang=en,es_mx
" Display non-visible characters like end of line, tabs, trailing spaces etc.
set list
" Configure how the non-visible chars will look like
set listchars=tab:▸\ ,trail:·,eol:¬,extends:»,precedes:«,nbsp:+
" How filler chars will be displayed
set fillchars=diff:⣿,eob:•
" How to show a line has been broken in two
set showbreak=↪
" Highlight the current line
set cursorline
" As it's name says, redraw lazily
set lazyredraw
" Options for diff:
" - iwhite: Ignore changes of white space
" - vertical: Start diff mode in vertical splits unless other specified
set diffopt+=iwhite,vertical
" Ignore case when searching or a pattern
set ignorecase
" If upper case used, then be case sensitive
set smartcase
" Start scrolling 3 lines before reaching the screen edge
set scrolloff=3
" Minimum chars off the screen to start scrolling (when wrap is off)
set sidescroll=1
" Start scrolling vertically 6 char before reaching screen edge
set sidescrolloff=6
set showmatch   " Show matching parens when closing
set matchtime=10 " Show for this amount of tenth of a second

" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Fold text {{{

" From https://jdhao.github.io/2019/08/16/nvim_config_folding/
function! MyFoldText()
    let line = getline(v:foldstart)
    let folded_line_num = v:foldend - v:foldstart
    let line_text = substitute(line, '^"{\+', '', 'g')
    let fillcharcount = &textwidth - len(line_text) - len(folded_line_num)
    return repeat('-', 2) . line_text . repeat('.', fillcharcount) . ' (' . folded_line_num . ' L)'
endfunction
set foldtext=MyFoldText()

" }}}

" }}}

" Backup and info {{{

" Patch mode is used to generate .orig files, this files are saved in backup directory
set backupdir=$HOME/.config/nvim/temp/backup/
" Mkview is used to 'save' a view of the current window and it's saved here
set viewdir=$HOME/.config/nvim/temp/view/
" Undo files are created to have 'infinite' undo
set undodir=$HOME/.config/nvim/temp/undo/
" Turn on backup, turn off swap files and turn on 'infinite undo'
set backup
set noswapfile
set undofile
set shadafile="~/.config/nvim/temp/shada"
set clipboard+=unnamed

" Directories check {{{

if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&viewdir))
  call mkdir(expand(&viewdir), "p")
endif

"}}}

" Save buffer to file for each buffer action (next, rewind, last, first, etc.)
" All this are taking into account you are using the argument list
set autowrite
" Detect when a file is being changed while a it's buffer is open and reload
" it if confirmed
set autoread
" So crontab works properly, disable backup and writebackup
autocmd filetype crontab setlocal nobackup nowritebackup
" }}}
