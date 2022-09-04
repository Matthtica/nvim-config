let g:mapleader = "\<Space>"
" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize +2<CR>
nnoremap <M-l>    :vertical resize -2<CR>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

" -- Visual --
" Stay in indent mode
vnoremap < <gv
vnoremap > >gv

" Normal Mode remove highlight
nnoremap <Esc> :noh<CR>

" -- Ultisnips
let g:UltiSnipsEditSplit="vertical"
"set timeoutlen=100
