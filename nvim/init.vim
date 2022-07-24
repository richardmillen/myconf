set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set exrc

set guicursor=

set relativenumber
set nu

set nohlsearch
set hidden

set noerrorbells

set nowrap

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set incsearch

set termguicolors

set scrolloff=8

set colorcolumn=80
set signcolumn=yes

" more space for displaying messages
set cmdheight=2

set updatetime=50

" :PlugInstall
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'gruvbox-community/gruvbox'
" TODO: neovim lsp, treesitter, undo tree, fugitive
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

" remaps: mode lhs rhs
" n: normal mode
" nnore: normal mode, no recursive execution
" nnoremap: normal, no recursive, map

" <leader> = space char
let mapleader = " "

" project search
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

" trim whitespace from eol:
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" clear and run commands in my auto group:
augroup RICH
    autocmd!
    
    " before write current buffer:
    " autocmd BufWritePre * :call TrimWhitespace()
augroup END

