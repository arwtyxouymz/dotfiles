" ---------------------------------------------------------------------------
" For neovim:
"

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3.7'

if exists('&inccommand')
  set inccommand=nosplit
endif

if exists('&winblend')
    set winblend=20
endif

" Use cursor shape feature
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor


autocmd MyAutoCmd TermOpen * setlocal modifiable
autocmd MyAutoCmd TermClose * buffer #

let g:terminal_scrollback_buffer_size = 3000
