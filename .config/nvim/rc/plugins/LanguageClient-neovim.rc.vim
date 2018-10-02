let g:LanguageClient_serverCommands = {
    \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
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
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = $XDG_CONFIG_HOME . "/nvim/autoload/settings.json"
" not stop completion $ & /
set hidden
set signcolumn=yes
let g:LanguageClient_hoverPreview = "Never"
