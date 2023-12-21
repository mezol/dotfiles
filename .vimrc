" Disable Vi compatibility
set nocompatible

" Set encoding to UTF-8
set encoding=utf8

" Detect the filetype and apply options related to this filetype
filetype on

" Enable syntax highlighting
syntax enable

" Set the leader key to <Space>
let mapleader = " "

" Set tho colorscheme
colorscheme sorbet

" Allow backspacing over line breaks, etc. 
set backspace=indent,eol,start

" Show some additional information in the last line of the screen
set showcmd

" Enhance command-line completion
set wildmenu

" Always show the status line
set laststatus=2

" Do not wrap long lines
set nowrap

" Do not break lines on characters
set linebreak

" Allow switching unsaved buffers
set hidden

" Precede each line with its line number
set number

" Show the line and column number of the cursor position, separated by a comma
set ruler

" Copy indent from current line when starting a new line
set autoindent

" The minimal number of screen lines to keep above and below the cursor
set scrolloff=5

" The number of columns to scroll horizontally
set sidescroll=1

" The minimal number of screen columns to keep to the left and to the right of the cursor if 'nowrap' is set
set sidescrolloff=5

" Highlight the text line of the cursor
set cursorline

" Do not save session options and mappings
set sessionoptions-=options
set viewoptions-=options

" While typing a search command, show where the pattern, as it was typed so far, matches
set incsearch

" When there is a previous search pattern, highlight all its matches
set hlsearch

" Ignore case of the normal letters when the pattern contains lowercase letters only
set ignorecase
set smartcase

" Press Y to yank from cursor to the end of the line
nnoremap Y y$

" Center on search
nnoremap n nzz
nnoremap N Nzz

" Press <C-ARROW> to resize window
nnoremap <C-LEFT> :vertical resize -2<CR>
nnoremap <C-DOWN> :resize -2<CR>
nnoremap <C-UP> :resize +2<CR>
nnoremap <C-RIGHT> :vertical resize +2<CR>

" Redo deletions made in insert mode
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" Quickly switch buffers with Tab and Shift + Tab
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Hide netrw banner by default
let g:netrw_banner = 0

" Press <leader>f to open netrw
" nnoremap <leader>f :E<CR>

" Press <leader>b to list open buffers; Type a number to switch to a buffer
" nnoremap <leader>b :ls<CR>:b<Space>

" --- plugin section ---
call plug#begin()

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" CtrlP settings
let g:ctrlp_show_hidden = 1
