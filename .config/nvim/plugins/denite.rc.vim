if executable('rg')
    call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
    call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
    call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
else
    call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
endif

call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', ['--'])

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
call denite#custom#source('file/rec', 'matchers',
      \ ['matcher/fuzzy', 'matcher/project_files'])
call denite#custom#source('line', 'matchers',
      \ ['matcher/fuzzy', 'matcher/project_files'])

call denite#custom#action('help', 'tabopen',
            \ { context -> denite#do_action(context, 'tabopen', context['targets']) })

call denite#custom#source('file,file/rec,file/mru,file/old,file/point', 'converters', ['devicons_denite_converter'])
