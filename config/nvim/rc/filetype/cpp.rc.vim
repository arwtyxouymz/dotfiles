
function! s:LLDBPythonPath() abort
    let g:python_host_prog = '/usr/bin/python2.7'
endfunction

function! s:PyenvPythonPath() abort
    let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
endfunction
