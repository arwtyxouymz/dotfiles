let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'

" dein configurations
" dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

let s:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME
let s:nvim_home = s:config_home . '/nvim' " ~/.config/nvim

" If dein is not installed, install dein
let s:cache_home = s:config_home . '/.cache' " ~/.config/.cache
let s:dein_dir = s:cache_home . '/dein' " ~/.config/.cache/dein
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

" Required:
let &runtimepath = s:dein_repo_dir . ',' . &runtimepath

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('Shougo/deoplete.nvim', {
              \ 'on_i' : 1,
              \ 'hook_source': 'call deoplete#enable()'
              \ })
  call dein#add('autozimu/LanguageClient-neovim', {
              \ 'build' : './install.sh',
              \ })

  " Required:
  call dein#end()
  call dein#save_state()

endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

filetype plugin indent on
syntax enable


let g:LanguageClient_serverCommands = {
    \ 'c': ['clangd', '-compile-commands-dir=' . getcwd() . '/build'],
    \ 'cpp': ['clangd', '-compile-commands-dir=' . getcwd() . '/build'],
    \ }
" not stop completion $ & /
set hidden
set signcolumn=yes
let g:LanguageClient_hoverPreview = "Never"