" 行番号を表示
set number
" 不可視文字の可視化
set list
" ターミナルのタイトルをセットする
set title
" 行末の1文字先までカーソル移動できるように
set virtualedit=onemore
" バックスペースを有効にする
set backspace=indent,eol,start
" 対応括弧に<と>を入れる
set matchpairs& matchpairs+=<:>
" 160文字目に線を入れる
set colorcolumn=160
" 自動的に改行が入るのを阻止
set textwidth=0
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" OSのクリップボードをレジスタ指定なしでYank,Putできるようにする
set clipboard=unnamed
" マウスの入力を受け付ける
set mouse=a
" swapファイルを作らない
set noswapfile
" タブに関する記述 set smarttab 改行時に前の行のインデントを継続する
set autoindent
" 改行時などに自動でインデントを設定してくれる
set smartindent
" 前のインデントを使う
set copyindent
" タブ入力を複数の空白入力に置き換える
set expandtab
" 画面上でタブ文字の占める幅
set tabstop=4
" 自動インデントでずれる幅
set shiftwidth=4
" 連続した空白に対してタブキーやバックスペースでカーソルが動く幅
set softtabstop=4
" バックアップを作らない
set nowritebackup
set nobackup
set noswapfile
" ステータスラインの表示
set laststatus=2
" buffer移動で保存しなくても怒られない
set hidden
" 補完の色
hi Pmenu guifg=white guibg=grey
"hi PmenuSel guifg=white guibg=1
" ウインドウは常に右に開く
set splitright
" K でカーソル下のヘルプを開く
set keywordprg=:help
" autoGroup作成
augroup MyAutoCmd
    autocmd!
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.blade.php setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.vue setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType vue syntax sync fromstart

    autocmd BufWritePost *.php silent! eval '[ -f ".git/hooks/ctags" ]; and .git/hooks/ctags'
    autocmd FileType help,git-status,git-log nnoremap <buffer> q <C-w>c
augroup END

command! Reload source ~/.config/nvim/init.vim

" キーバインド
" <Leader> を , に
let g:mapleader = ','

" ヘルプコマンド
nnoremap <Space>t :<C-u>tab help<Space>
nnoremap <Space>v :<C-u>vertical belowright help<Space>
" Ctrl + p で前のtab
nnoremap <silent> <C-p> :tabprevious<CR>
" Ctrl + n で次のtab
nnoremap <silent> <C-n> :tabnext<CR>
" Ctrl + q でtabを閉じる
nnoremap <silent> <C-q> :close<CR>
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

" Split Window
nmap ss :split<CR><C-j>
nmap sv :vsplit<CR><C-l>
" Resize Window
nmap <C-w><left> <C-w>>
nmap <C-w><right> <C-w><
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

" MAC_OS_Xとそれ以外で場合分け
" let g:python_host_prog = '/usr/bin/python2.7'
let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'

" deinがなかったらインストール
let s:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME
let s:nvim_home = s:config_home . '/nvim'
let s:cache_home = s:config_home . '/.cache'
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

" Required:
let &runtimepath = s:dein_repo_dir . ',' . &runtimepath

" tomlファイル管理
let s:toml_dir = s:nvim_home . '/toml'
let s:toml_file = s:toml_dir . '/dein.toml'
let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
let s:php_toml = s:toml_dir . '/php.toml'
let s:js_toml = s:toml_dir . '/javascript.toml'
let s:python_toml = s:toml_dir . '/python.toml'
let s:cpp_toml = s:toml_dir . '/cpp.toml'

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#load_toml(s:php_toml, {'lazy': 1})
  call dein#load_toml(s:js_toml, {'lazy': 1})
  call dein#load_toml(s:python_toml, {'lazy': 1})
  call dein#load_toml(s:cpp_toml, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
"
colorscheme yaflandia
let g:airline_theme = 'dark'
