" use a POSIX shell
if &shell =~# 'fish$'
    set shell=sh
endif


" ----- Plugins ----- "
call plug#begin()
Plug 'https://github.com/dag/vim-fish.git'
Plug 'https://github.com/vim-scripts/FuzzyFinder.git'
Plug 'https://github.com/sjl/gundo.vim.git'
Plug 'https://github.com/vim-scripts/L9.git'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/vim-scripts/taglist.vim.git'
Plug 'https://github.com/vimwiki/vimwiki.git'
call plug#end()


" ----- Configuration ----- "
"
" Basic
set nocompatible
set number
"set mouse=a
inoremap jj <ESC>


" Tab settings
set cindent
set smartindent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2

" Usability tweaks
set cursorline


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
set textwidth=80
set formatoptions=qrn1
" set colorcolumn=85


" Code Folding
set foldmethod=syntax
set foldlevel=99


" Remove trailing whitespace
:nnoremap <leader>s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>


" don't use cindent for javascript
autocmd FileType javascript setlocal nocindent


" highlight .ru files like .rb files
au BufRead,BufNewFile *.ru setfiletype ruby
au BufRead,BufNewFile *.rabl setf ruby



" --- Nerdtree --- "
map <F2> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>


" --- FuzzyFinder --- "
map <F3> :FufFile<CR>
map <leader>f :FufCoverageFile<CR>


" --- Taglist --- "
nnoremap <silent> <F4> :TlistToggle<CR>
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=50
let Tlist_Show_One_File=1
set tags=tags


" --- Gundo --- "
nnoremap <F5> :GundoToggle<CR>


" --- Buftab --- "
map <C-p> :bprev<CR>
map <C-n> :bnext<CR>


" --- Powerline --- "
set laststatus=2  " always show the statusline


" --- Vimwiki --- "
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'ruby': 'ruby'}
let g:vimwiki_list = [wiki]


" --- vim-fish --- "
syntax enable
filetype plugin indent on
" set up :make to use fish for syntax checking
autocmd FileType fish compiler fish
" set this to have long lines wrap inside comments
autocmd FileType fish setlocal textwidth=79
" enable folding of block structures in fish
autocmd FileType fish setlocal foldmethod=expr
