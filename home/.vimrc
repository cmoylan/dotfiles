" Autoload modules
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on


" Basic configuration
set nocompatible
set number
"set mouse=a


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
colorscheme xoria256


" Textmate compatibility
set list
set listchars=tab:▸\ ,eol:¬


" Search tweaks
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %


" Fix line wrapping
set nowrap
set textwidth=82
set formatoptions=qrn1
" set colorcolumn=85


" Nerdtree plugin
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
map <F2> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>


" FuzzyFinder key mappins
map <F3> :FufFile<CR>


" Taglist plugin
nnoremap <silent> <F4> :TlistToggle<CR>
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=50
let Tlist_Show_One_File=1
set tags=tags


" Buftab plugin
let g:buftabs_only_basename=1
map <C-p> :bprev<CR>
map <C-n> :bnext<CR>


" Remove trailing whitespace
:nnoremap <leader>s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" don't use cindent for javascript
autocmd FileType javascript setlocal nocindent
