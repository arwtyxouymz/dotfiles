let g:LanguageClient_serverCommands = {
    \ 'c': ['clangd', '-compile-commands-dir=' . getcwd()],
    \ 'cpp': ['clangd', '-compile-commands-dir=' . getcwd()],
    \ 'python': ['pyls'],
    \ 'vue': ['vls'],
    \ 'html': [],
    \ 'css': [],
    \ 'javascript': [],
    \ 'bash': ['bash-language-server', 'start'],
    \ 'sh': ['bash-language-server', 'start'],
\ }
let g:LanguageClient_diagnosticsDisplay = {
    \     1: {
    \         "name": "Error",
    \         "texthl": "ALEError",
    \         "signText": "✖",
    \         "signTexthl": "ErrorMsg",
    \     },
    \     2: {
    \         "name": "Warning",
    \         "texthl": "ALEWarning",
    \         "signText": "⚠",
    \         "signTexthl": "ALEWarningSign",
    \     },
    \     3: {
    \         "name": "Information",
    \         "texthl": "ALEInfo",
    \         "signText": "ℹ",
    \         "signTexthl": "ALEInfoSign",
    \     },
    \     4: {
    \         "name": "Hint",
    \         "texthl": "ALEInfo",
    \         "signText": "➤",
    \         "signTexthl": "ALEInfoSign",
    \     },
\ }
" not stop completion $ & /
set hidden
set signcolumn=yes
let g:LanguageClient_hoverPreview = "Never"
