" Use English interface
language message C

" <Leader> is ,
let g:mapleader = ','
let s:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME

" =================================================
" Plugins
" =================================================
call plug#begin()

"" Denops
Plug 'vim-denops/denops.vim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'liuchengxu/vista.vim'

Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'cohama/lexima.vim'
Plug 'machakann/vim-sandwich'

Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-qfreplace'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rakr/vim-one'

Plug 'ryanoasis/vim-devicons'

Plug 'RRethy/vim-illuminate'
Plug 'folke/todo-comments.nvim'
Plug 'goolord/alpha-nvim'
Plug 'yggdroot/indentline'
Plug 'deris/vim-shot-f'

Plug 'terrortylor/nvim-comment'

call plug#end()

" =================================================
" General
" =================================================
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

set sh=zsh

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

tnoremap jj <C-\><C-n>

highlight Comment cterm=italic gui=italic

if has('nvim')
    autocmd TermOpen term://* startinsert
endif
command! -nargs=* ST 10split | terminal <args>
command! -nargs=* ST5 5split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

" =================================================
" alpha
" =================================================

" =================================================
" coc.nvim
" =================================================
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=number

let g:coc_global_extensions = [
    \ 'coc-fzf-preview',
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-snippets',
    \ 'coc-tailwindcss',
    \ 'coc-rust-analyzer',
    \ 'coc-docker',
    \ 'coc-sh',
    \ 'coc-toml',
    \ 'coc-yaml',
\]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" =================================================
" fzf-preview
" =================================================
let g:fzf_preview_use_dev_icons = 1
let g:fzf_preview_dev_icon_prefix_string_length = 3
let g:fzf_preview_dev_icons_limit = 5000

nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>

" =================================================
" lightline
" =================================================
set noshowmode

function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction
function! CocCurrentFunction() abort
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified' ],
    \             [ 'cocstatus', 'currentfunction', 'gitbranch' ],
    \           ]
    \ },
    \ 'component_function': {
    \   'vista': 'NearestMethodOrFunction',
    \   'cocstatus': 'coc#status',
    \   'currentfunction': 'CocCurrentFunction',
    \   'gitbranch': 'gitbranch#name',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' },
    \ }

" =================================================
" Vista
" =================================================
nmap <silent> <F8> :<C-u>Vista coc<CR>
let g:vista_sidebar_width = 40

" =================================================
" Fern
" =================================================
" Ctrl+nでファイルツリーを表示/非表示する
nnoremap <Space>f :Fern . -reveal=% -drawer -toggle -width=40<CR>
let g:fern#renderer = "nerdfont"

" =================================================
" Indent line
" =================================================
set list lcs=tab:\|\

" =================================================
" Lua Configurations
" =================================================
lua<<EOF
-- ======================
-- alpha
-- ======================
require('alpha').setup(require('alpha.themes.startify').config)

-- ======================
-- nvim-treesitter
-- ======================
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "vim",
        "lua",
        "bash",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "svelte",
        "rust",
        "go",
        "python",
        "json",
        "toml",
        "yaml",
    },
    highlight = {
        enable = true
    }
}

-- ======================
-- nvim-comment
-- ======================
require('nvim_comment').setup({
    line_mapping = "<leader>cl",
    operator_mapping = "<leader>c"
})
EOF

" =================================================
" Vim-One
" =================================================
let g:airline_theme='one'
let g:one_allow_italics = 1
set background=dark
colorscheme one
