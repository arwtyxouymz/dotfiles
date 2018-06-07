" dein configurations

let g:dein#install_progress_type = 'title'
" ~/.cache/dein
let s:path = expand('$CACHE/dein')
if !dein#load_state(s:path)
  finish
endif

call dein#begin(s:path, expand('<sfile>'))

call dein#load_toml('$XDG_CONFIG_HOME/nvim/toml/dein.toml', {'lazy': 0})
call dein#load_toml('$XDG_CONFIG_HOME/nvim/toml/dein_lazy.toml', {'lazy': 1})
call dein#load_toml('$XDG_CONFIG_HOME/nvim/toml/dein_php.toml', {'lazy': 1})
call dein#load_toml('$XDG_CONFIG_HOME/nvim/toml/dein_js.toml', {'lazy': 1})
call dein#load_toml('$XDG_CONFIG_HOME/nvim/toml/dein_python.toml', {'lazy': 1})
call dein#load_toml('$XDG_CONFIG_HOME/nvim/toml/dein_cpp.toml', {'lazy': 1})

" if has('nvim')
"     call dein#load_toml('~/.vim/rc/deineo.toml', {})
" endif
" call dein#load_toml('~/.vim/rc/deinft.toml')

call dein#end()
call dein#save_state()

if !has('vim_starting') && dein#check_install()
  " Installation check.
  call dein#install()
endif
