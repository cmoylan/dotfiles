" Basic configuration
set nocompatible


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
