" key mappings

" help command
nnoremap <Space>t :<C-u>tab help<Space>
nnoremap <Space>v :<C-u>vertical belowright help<Space>
" Ctrl + p is previous tab
nnoremap <silent> <C-p> :bprevious<CR>
" Ctrl + n is next tab
nnoremap <silent> <C-n> :bnext<CR>
" Ctrl + q is close window
nnoremap <silent> <C-q> :bdelete<CR>
" jj is exit from insert mode
inoremap <silent> jj <ESC>
" <C-j> is go to new line
inoremap <silent> <C-j> <C-o>o
" <C-o> is up previous line
inoremap <silent> <C-o> <Up>
" <C-l> is go to next character
inoremap <C-l> <C-r>=lexima#insmode#leave(1, '<LT>C-G>U<LT>RIGHT>')<CR>
" Ctrl + hjkl is move windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Prevent yank of x and s
nnoremap x "_x
vnoremap x "_x
nnoremap s "_s
vnoremap s "_s
" move by one line
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk
" scroll and move cursor to ceter of window
nnoremap <C-u> <C-u>zz
vnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
vnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
vnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-b> <C-b>zz
" Centerize search results
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" ctags
nnoremap <C-]> g<C-]>

" Resize Window
nmap <C-w><left> <C-w>>
nmap <C-w><right> <C-w><
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

" Terminal mode
tnoremap <silent> jj <C-\><C-n>
nnoremap <C-t> :terminal<CR>
