" キーバインド

" ヘルプコマンド
nnoremap <Space>t :<C-u>tab help<Space>
nnoremap <Space>v :<C-u>vertical belowright help<Space>
" Ctrl + p で前のtab
nnoremap <silent> <C-p> :tabprevious<CR>
" Ctrl + n で次のtab
nnoremap <silent> <C-n> :tabnext<CR>
" Ctrl + q でtabを閉じる
nnoremap <silent> <C-q> :tabclose<CR>
" インサートモードからjjで抜ける
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> <C-o>o
inoremap <silent> <C-o> <Up>
inoremap <C-l> <C-r>=lexima#insmode#leave(1, '<LT>C-G>U<LT>RIGHT>')<CR>
" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" esc + escで検索ハイライトを消す
nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR><C-l>
" xやsではヤンクしない
nnoremap x "_x
vnoremap x "_x
nnoremap s "_s
vnoremap s "_s
" 移動を一行毎
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk
" スクロール後にカーソルを真ん中に持ってくる
nnoremap <C-u> <C-u>zz
vnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
vnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
vnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-b> <C-b>zz

" ctags
nnoremap <C-]> g<C-]>
