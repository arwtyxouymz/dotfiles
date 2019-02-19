if executable('rg')
    call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
    call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
    call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
endif

call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])

call denite#custom#map('insert', "<C-j>", '<denite:move_to_next_line>')
call denite#custom#map('insert', "<C-k>", '<denite:move_to_previous_line>')
call denite#custom#map('insert', "<C-t>", '<denite:do_action:tabopen>')
call denite#custom#map('insert', "<C-v>", '<denite:do_action:vsplit>')
call denite#custom#map('insert', "<C-h>", '<denite:do_action:split>')
call denite#custom#map('insert', "<C-p>", '<denite:do_action:preview>')

call denite#custom#map('normal', "<C-p>", '<denite:do_action:preview>')

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', [
            \ '.git/', 'build/', '__pycache__/',
            \ 'images/', '*.o', '*.make', '*.min.*',
            \ 'img/', 'fonts/', '*~', '*.exe', '*.bak',
            \ '.DS_Store', '*.pyc', '*.class', 'tags'
            \ ])

call denite#custom#action('help', 'tabopen',
            \ { context -> denite#do_action(context, 'tabopen', context['targets']) })

let s:menus = {}
let s:menus.conf = { 'description': 'configuration' }
let s:menus.conf.file_candidates = [
            \ ['bash', '~/.bash_profile'],
            \ ['fish', '~/.config/fish/config.fish'],
            \ ['neovim', '~/.config/nvim/init.vim']
            \ ]
let s:menus.commands = { 'description': 'my commands' }
let s:menus.commands.command_candidates = [
            \ ['Split the window', 'vnew'],
            \ ['Open configuration menu', 'Denite menu:conf']
            \ ]

call denite#custom#var('menu', 'menus', s:menus)
