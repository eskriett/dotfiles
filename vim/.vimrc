 " BASIC OPTIONS {{{1

set noesckeys           " remove the delay when hitting esc in insert mode  *MUST BE BEFORE nocompatible*
set nocompatible

set modelines=0         " explicity turn off vim modelines (for security)
set nomodeline

set encoding=utf-8      " use utf-8 character set by default
syntax on               " turn on syntax highlighting
set synmaxcol=800       " don't highlight lines longer than 800 characters

set ttyfast             " use a fast terminal connection
set visualbell          " use a visual bell instead of annoying beep
set title               " update the terminal title with file name

set hidden              " Allow buffers to exist in the background

set number              " show absolute line number on current line
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands at the bottom
set scrolloff=5         " keep 5 lines visible around cursor (if possible)
set matchtime=3         " highlight matching parens for 3 seconds

set textwidth=100       " set maximum line width to 80 characters
set linebreak           " use soft-wrapping on long lines
set colorcolumn=100     " display a column at 120 characters

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
au VimResized * :wincmd =

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

set foldlevelstart=0

" Use space to toggle folds
nnoremap <Space> za

" VUNDLE {{{1

" Install with:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins

set shell=/bin/bash     " use bash as shell

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage vundle (required)
Plugin 'gmarik/vundle'

" Colour Schemes
Plugin 'jonathanfilip/vim-lucius'

" Core Plugins
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
" Plugin 'airblade/vim-gitgutter'

" All of Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" COLOUR SCHEME {{{1

" Enable 256 colours
set t_Co=256

" Enable lucius theme
colorscheme lucius
set background=dark

" AIRLINE / BUFFERLINE {{{1

set noshowmode      " stop vim displaying the mode, as airline now shows it
set laststatus=2    " always display the status line

" Use base16 theme
let g:airline_theme='lucius'

" Turn on fancy separators
let g:airline_left_sep=''
let g:airline_right_sep=''

" Don't collapse left section of airline when inactive
let g:airline_inactive_collapse=0

" Stop bufferline showing on command line
let g:bufferline_echo=0

" Stop airline overwriting bufferline settings
let g:airline#extensions#bufferline#overwrite_variables = 0

" Set highlight colors for bufferline
highlight bufferline_selected gui=bold cterm=bold term=bold
highlight link bufferline_selected_inactive airline_c_inactive
let g:bufferline_inactive_highlight = 'airline_c'
let g:bufferline_active_highlight = 'bufferline_selected'
let g:bufferline_separator = ' '

" Put [ ] around the active buffer
let g:bufferline_active_buffer_left='['
let g:bufferline_active_buffer_right=']'

" Don't display buffer numbers
let g:bufferline_show_bufnr=0

" Custom airline layout
" mode | buffers/filename [RO]                  branch | [warnings]
let g:airline_section_a = '%{airline#util#wrap(airline#parts#mode(),0)}%{airline#util#append(airline#parts#paste(),0)}%{airline#util#append(airline#parts#iminsert(),0)}'
let g:airline_section_b = ''
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)}'

