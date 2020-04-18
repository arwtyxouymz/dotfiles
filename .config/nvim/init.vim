" Use English interface
language message C

" <Leader> is ,
let g:mapleader = ','

let s:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME

"=========================================
" Require only once
"=========================================
let s:cache_dir = s:config_home . "/.cache"
if !isdirectory(expand(s:cache_dir))
    call mkdir(expand(s:cache_dir, "p"))
endif

" Load dein
let s:dein_dir = finddir('dein.vim', '.;')
echo s:dein_dir

if &runtimepath !~ 'dein.vim'
    if s:dein_dir == ''
        let s:dein_dir = expand(s:cache_dir) . '/dein/repos/github.com/Shougo/dein.vim'
        if !isdirectory(s:dein_dir)
            execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
        endif
    endif
    execute 'set runtimepath+=' . substitute(fnamemodify(s:dein_dir, ':p'), '/$', '', '')
endif
"=========================================

let s:nvim_home = s:config_home . '/nvim'
let s:toml_dir = s:nvim_home . '/toml'
let s:dein_toml = s:toml_dir . '/dein.toml'
let s:dein_lazy_toml = s:toml_dir . '/dein_lazy.toml'
let s:coc_toml = s:toml_dir . '/coc.toml'

"=========================================
" Dein
" =========================================
let g:dein#auto_recache = 1
let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = 1
let g:dein#notification_icon = ""
let g:dein#install_log_filename = '~/.config/.cache/.dein.log'

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath

if dein#load_state(s:cache_dir . "/dein")
  call dein#begin(s:cache_dir . "/dein")

  call dein#add('~/.config/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#load_toml(s:dein_toml, {"lazy": 0})
  call dein#load_toml(s:dein_lazy_toml, {"lazy": 1})

  if !has('nvim')
  endif

  call dein#end()
  call dein#save_state()
endif

if !has('vim_starting') && dein#check_install()
    " Installation Check
    call dein#install()
endif

filetype plugin indent on
syntax enable
"=========================================

let g:python_host_prog = '/usr/bin/python'

if executable("python3.7")
    let g:python3_host_prog = '/usr/bin/python3.7'
else
    let g:python3_host_prog = '/usr/bin/python3'
endif

if has("macunix")
    let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
    let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'
endif

" 行番号を表示
set number
" カーソル表示
set cursorline
" 行番号相対表示
set relativenumber
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
set clipboard^=unnamedplus
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
" completeoptは下に開く
set splitbelow
" ウインドウは常に右に開く
set splitright
" K でカーソル下のヘルプを開く
set keywordprg=:help
" True Colorを使用
set termguicolors
" コマンド入力を2行に(echodoc用)
set cmdheight=2
" コマンドラインモードの補完
set wildoptions+=pum

set sh=fish

" Reload init.vim
command! Reload source ~/.config/nvim/init.vim

" =================================================
" Mappings
" =================================================
" jj is exit from insert mode
inoremap <silent> jj <ESC>
" Ctrl + hjkl is move windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" move by one line
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk

" <C-l> is go to next character
inoremap <C-l> <C-r>=lexima#insmode#leave(1, '<LT>C-G>U<LT>RIGHT>')<CR>

tnoremap jj <C-\><C-n>

if has('nvim')
    autocmd TermOpen term://* startinsert
endif
command! -nargs=* ST split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

set background=dark
colorscheme hybrid

highlight Comment cterm=italic gui=italic
