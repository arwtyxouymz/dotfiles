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


set background=dark
colorscheme yowish
