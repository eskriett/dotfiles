" PLUGINS {{{1

silent! packadd minpac

if !exists('*minpac#init')
  silent !git clone https://github.com/k-takata/minpac.git
	\ ~/.vim/pack/minpac/opt/minpac
  source $MYVIMRC
  call minpac#update()
else
  call minpac#init()
  call minpac#add('chriskempson/base16-vim')
  call minpac#add('ctrlpvim/ctrlp.vim')
  call minpac#add('godlygeek/tabular')
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('k-takata/minpac')
  call minpac#add('sheerun/vim-polyglot')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-surround')
  call minpac#add('wellle/targets.vim')
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

" GENERAL {{{1

set nocompatible        " don't try to be compatible with vi

set modelines=0         " explicity turn off vim modelines (for security)
set nomodeline

set encoding=utf-8      " use utf-8 character set by default
syntax on               " turn on syntax highlighting
set synmaxcol=800       " don't highlight lines longer than 800 characters

set ttyfast             " use a fast terminal connection
set visualbell          " use a visual bell instead of annoying beep
set title               " update the terminal title with file name
set titleold=           " Don't set the title to 'Thanks for ...' when exiting

set hidden              " Allow buffers to exist in the background

set number              " show absolute line number on current line
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands at the bottom
set scrolloff=5         " keep 5 lines visible around cursor (if possible)
set matchtime=3         " highlight matching parens for 3 seconds

set textwidth=80        " set maximum line width to 80 characters
set linebreak           " use soft-wrapping on long lines
set colorcolumn=80      " display a column at 120 characters

set tabstop=4           " set hard tabstop size to 4
set softtabstop=4       " set soft tabstop size to 4
set shiftwidth=4        " set size of an 'indent' to 4
set shiftround          " when shifting, always use a multiple of shiftwidth
set autoindent          " automatically indent new lines
set expandtab           " use spaces instead of <tab>s
set smarttab            " make adding/removing tabs (spaces) smarter

set incsearch           " search incrementally as you type
set hlsearch            " highlight search matches
set ignorecase          " use case-insensitive search
set smartcase           " automatically decide to search with case or not
set gdefault            " global substitution by default

set autoread            " re-read an open file that has changed outside vim

set notimeout           " timeout out on keycodes, but not mappings
set ttimeout
set ttimeoutlen=10      " wait 10ms for a keycode to complete

set splitbelow          " always make new splits below, not above
set splitright          " always make new splits on the right, not on the left

set spelllang=en_gb     " set spelling to use British English

set foldmethod=marker   " use fold markers for folding

set backspace=2

" Stop using the cursor keys once and for all! (Unbind them)
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" ADVANCED OPTIONS {{{1

" Strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" Highlight VCS conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" TEMPORARY FILES {{{1

set history=1000                " keep 1000 lines of command line history
set undofile                    " save undo history to a file
set undoreload=10000            " save 10000 lines of undo history

set undodir=~/.vim/tmp/undo     " save undo files to ~/.vim/tmp/undo
set backupdir=~/.vim/tmp/backup " save backup files to ~/.vim/tmp/backup
set directory=~/.vim/tmp/swap   " save swap files to ~/.vim/tmp/swap

" Create temporary folders if they don't already exist
if !isdirectory( expand( &undodir ) )
    call mkdir( expand( &undodir ), "p" )
endif
if !isdirectory( expand( &backupdir ) )
    call mkdir( expand( &backupdir ), "p" )
endif
if !isdirectory( expand( &directory ) )
    call mkdir( expand( &directory ), "p" )
endif

" FOLDING {{{1

" Use space to toggle folds
nnoremap <Space> za

" COLOUR SCHEME {{{1

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

" STATUSLINE {{{1

" Always show the statusline
set laststatus=2

let g:lightline = {
\	 'active': {
\	   'left': [ [ 'mode', 'paste' ],
\	             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\	 },
\	 'component_function': {
\	   'gitbranch': 'fugitive#head'
\	 },
\ }

