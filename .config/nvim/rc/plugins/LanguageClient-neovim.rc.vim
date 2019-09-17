" not stop completion $ & /
set hidden
set signcolumn=yes
let g:LanguageClient_useFloatingHover = 1
let g:LanguageClient_hoverPreview = "Hover"

let g:LanguageClient_serverCommands = {
    \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'cuda': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'objc': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'sh': [$HOME . '/.yaml/bin/bash-language-server'],
    \ 'yaml': [$HOME . '/.yaml/bin/yaml-language-server'],
\ }

let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = $XDG_CONFIG_HOME . '/nvim/autoload/settings.json'
let g:LanguageClient_hasSnippetSupport = 0
let g:LanguageClient_hoverPreview = "Never"

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
