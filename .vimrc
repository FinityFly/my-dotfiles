set nocompatible
set mouse=a
set number relativenumber
set smarttab
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set autochdir
set splitright
set splitbelow
set showcmd
set wildmenu
set wildmode=longest:full,full

syntax on
filetype on
filetype plugin indent on

" Specify a directory for plugins
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter' " Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
" Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'yuttie/comfortable-motion.vim'
Plug 'mhinz/vim-startify'
Plug 'tmsvg/pear-tree'
Plug 'junegunn/fzf'
Plug 'luochen1990/rainbow'
Plug 'yggdroot/indentline'

" Initialize plugin system
call plug#end()

set hlsearch
set guifont=MesloLGS\ NF:h12
set background=dark
syntax enable
colorscheme gruvbox
autocmd VimEnter * NERDTree | wincmd t

let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeWinSize = 40

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

nmap <C-n> :NERDTreeToggle<CR>
nmap <C-s> :Startify<CR>

let g:startify_bookmarks = [
\ { 'r': '/' },
\ { 'h': '~/' },
\ { 'd': '~/Documents'},
\ { 'g': '~/Github'},
\ { 'v': '~/.vimrc' },
\ { 'z': '~/.zshrc' },
\ ]

let g:startify_lists = [
\ { 'header': [' Bookmarks'], 'type': 'bookmarks' },
\ { 'header': [' MRU'], 'type': 'files' },
\ { 'header': [' MRU'. getcwd()], 'type': 'dir' },
\ { 'header': [' Sessions'], 'type': 'sessions' },
\ { 'header': [' Commands'], 'type': 'commands' },
\ ]

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

autocm VimEnter *
            \   if !argc()
            \ |   Startify
   \ |   wincmd o
            "\ |   NERDTree
            "\ |   wincmd w
   \ | endif

