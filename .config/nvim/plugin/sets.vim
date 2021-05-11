"*****************************************************************************
"" Basic Setup
"*****************************************************************************
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set exrc
set guicursor=

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

"" Enable hidden buffers
set hidden

"" Searching
set nohlsearch
set incsearch
set ignorecase
set smartcase

" disabling errorbells
set noerrorbells

" Fileformats
set fileformats=unix,dos,mac

" Disable swapfile and backup
set noswapfile
set nobackup
set nowritebackup

" Set the undo directory and undofile
set undodir=~/.config/nvim/undodir
set undofile

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" smartindent
set smartindent

set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number
set relativenumber
set cursorline
set nowrap
set termguicolors
set colorcolumn=80
set signcolumn=yes
highlight ColorColumn ctermbg=0 guibg=lightgrey

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
