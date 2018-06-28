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

" Reload init.vim
command! Reload source ~/.config/nvim/init.vim
