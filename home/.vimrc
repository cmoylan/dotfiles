" Autoload modules
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on


" Basic configuration
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


" Nerdtree plugin
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
map <F2> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>


" FuzzyFinder key mappins
map <F3> :FufFile<CR>
map <leader>f :FufCoverageFile<CR>


" Taglist plugin
nnoremap <silent> <F4> :TlistToggle<CR>
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=50
let Tlist_Show_One_File=1
set tags=tags


" Gundo plugin
nnoremap <F5> :GundoToggle<CR>


" Buftab plugin
"let g:buftabs_only_basename=1
map <C-p> :bprev<CR>
map <C-n> :bnext<CR>


" Powerline plugin
set laststatus=2  " always show the statusline


" Remove trailing whitespace
:nnoremap <leader>s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" don't use cindent for javascript
autocmd FileType javascript setlocal nocindent

" highlight .ru files like .rb files
au BufRead,BufNewFile *.ru setfiletype ruby
au BufRead,BufNewFile *.rabl setf ruby

" Vimwiki
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'ruby': 'ruby'}
let g:vimwiki_list = [wiki]


" Execute open rspec buffer
" Thanks to Ian Smith-Heisters
function! RunSpec(args)
 if exists("b:rails_root") && filereadable(b:rails_root . "/script/spec")
   let spec = b:rails_root . "/script/spec"
 else
   let spec = "rspec"
 end
 let cmd = ":! " . spec . " % -cfn " . a:args
 execute cmd
endfunction

" Mappings
" run one rspec example or describe block based on cursor position
map <leader>r :call RunSpec("-l " . <C-r>=line('.')<CR>)
" run full rspec file
map <leader>R :call RunSpec("")
