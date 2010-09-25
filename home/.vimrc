" Autoload modules
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on


" Basic configuration
set nocompatible
set number
set mouse=a


" Tab settings
set cindent
set smartindent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2


" Color and theme
set t_Co=256
syntax on
colorscheme molokai


" Textmate compatibility
set list
set listchars=tab:▸\ ,eol:¬


" Search tweaks
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase


" Nerdtree plugin
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
