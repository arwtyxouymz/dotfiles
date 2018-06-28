function! vimrc#on_filetype() abort
    if execute('filetype') =~# 'OFF'
        " Lazy loading
        silent! filetype plugin indent on
        syntax enable
        filetype detect
    endif
endfunction

function! vimrc#change_python_path() abort
    if has('mac') && &filetype ==# 'cpp' || &filetype ==# 'c'
        let g:python_host_prog = '/usr/bin/python2.7'
    else
        let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
    endif
endfunction
