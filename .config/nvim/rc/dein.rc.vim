" dein configurations

let g:dein#auto_recache = 1
let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = 1
let g:dein#notification_icon = ""
let g:dein#install_log_filename = '~/.config/.cache/.dein.log'

let s:path = expand('$CACHE/dein')
if !dein#load_state(s:path)
    finish
endif

" toml files
let s:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME
let s:nvim_home = s:config_home . '/nvim'
let s:toml_dir = s:nvim_home . '/toml'
let s:dein_toml = s:toml_dir . '/dein.toml'
let s:dein_lazy_toml = s:toml_dir . '/dein_lazy.toml'
let s:dein_php_toml = s:toml_dir . '/php.toml'
let s:dein_js_toml = s:toml_dir . '/javascript.toml'
let s:dein_python_toml = s:toml_dir . '/python.toml'
let s:dein_cpp_toml = s:toml_dir . '/cpp.toml'


call dein#begin(s:path, [
            \ expand('<sfile>'), s:dein_toml, s:dein_lazy_toml, s:dein_python_toml, s:dein_cpp_toml
            \ ])
call dein#load_toml(s:dein_toml, {'lazy': 0})
call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})
" call dein#load_toml(s:dein_python_toml)
" call dein#load_toml(s:dein_cpp_toml)

call dein#end()
call dein#save_state()

if !has('vim_starting') && dein#check_install()
    " Installation Check
    call dein#install()
endif


" dein Scripts-----------------------------
" if &compatible
"   set nocompatible               " Be iMproved
" endif
" " If dein is not installed, install dein
" let s:cache_home = s:config_home . '/.cache'
" let s:dein_dir = s:cache_home . '/dein'
" let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" if !isdirectory(s:dein_repo_dir)
"     call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
" endif
"
" " Required:
" let &runtimepath = s:dein_repo_dir . ',' . &runtimepath
"
" " toml files
" let s:toml_dir = s:nvim_home . '/toml'
" let s:toml_file = s:toml_dir . '/dein.toml'
" let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
" let s:php_toml = s:toml_dir . '/php.toml'
" let s:js_toml = s:toml_dir . '/javascript.toml'
" let s:python_toml = s:toml_dir . '/python.toml'
" let s:cpp_toml = s:toml_dir . '/cpp.toml'
"
" " Required:
" if dein#load_state(s:dein_dir)
"   call dein#begin(s:dein_dir)
"
"   call dein#load_toml(s:toml_file, {'lazy': 0})
"   call dein#load_toml(s:lazy_toml, {'lazy': 1})
"   call dein#load_toml(s:python_toml, {'lazy': 1})
"   "call dein#load_toml(s:cpp_toml, {'lazy': 1})
"
"   " Required:
"   call dein#end()
"   call dein#save_state()
"
" endif
"
" " If you want to install not installed plugins on startup.
" if dein#check_install()
"   call dein#install()
" endif
" "End dein Scripts-------------------------
"
" filetype plugin indent on
" syntax enable
