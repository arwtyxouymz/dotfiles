# tmux
if status is-interactive; and not set -q TMUX
    set create_new_session "new"
    if tmux ls > /dev/null ^ /dev/null
        set IFS
        set ID (tmux ls)
        set IFS \n" "\t
        set ID "$ID\n$create_new_session:"
    else
        set ID "$create_new_session:"
    end

    set ID (echo -e $ID | peco | cut -d: -f1)

    if test "$ID" = "$create_new_session"
        tmux new-session
    else if test -n "$ID"
        tmux attach -t $ID
    else
        echo "Start as a normal shell"
    end
end

set -gx LANG ja_JP.UTF-8

if not test -f $HOME/.config/fish/functions/fisher.fish
  echo "Installing fisherman for the first time"
  curl -sLo $HOME/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  fisher
end

# キーバインディング
function fish_user_key_bindings
  bind \cr peco_select_history
  bind \c] peco_select_ghq_repository
end

# cd のあとに ls -a
function cd
  builtin cd $argv
  ls -a
end

# theme設定
set -g theme_display_git yes
set -g theme_display_git_untracked yes
set -g theme_display_git_master_branch yes

alias vi '/usr/local/bin/nvim'
alias vim '/usr/local/bin/nvim'
alias dc '/usr/local/bin/docker-compose'

# .config/の場所
set -gx XDG_CONFIG_HOME $HOME/.config/

# phpbrewの設定
source ~/.phpbrew/phpbrew.fish

# pyenv
set -gx PYENV_ROOT $HOME/.pyenv/
status --is-interactive; and source (pyenv init -|psub)
# pyenv-virtualenv
set -gx VIRTUALENV_ROOT /usr/local/Cellar/pyenv-virtualenv/1.1.1/
status --is-interactive; and source (pyenv virtualenv-init -|psub)

set -xg PYTHONPATH /Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Resources/Python
set -xg PYTHONPATH $PYTHONPATH $HOME/.pyenv/versions/2.7.14/envs/neovim2/lib/python2.7/site-packages

# composerのupdate Laravel 5.5
function LaravelInitialize5
    # dev環境で構築するように変更
    composer require --dev barryvdh/laravel-ide-helper
    sed -i -e "26d" ./app/Providers/AppServiceProvider.php
    sed -i -e "25a\ \ \ \ \ \ \ \ if (\$this->app->environment() !== 'production') {" ./app/Providers/AppServiceProvider.php
    sed -i -e "26a\ \ \ \ \ \ \ \ \ \ \ \ \$this->app->register(\\\\Barryvdh\\\\LaravelIdeHelper\\\\IdeHelperServiceProvider::class);" ./app/Providers/AppServiceProvider.php
    sed -i -e "27a\ \ \ \ \ \ \ \ }" ./app/Providers/AppServiceProvider.php
    composer require --dev doctrine/dbal
    composer update
    php artisan vendor:publish --provider="Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider" --tag=config
    sed -i -e "28s/false/true/g" ./config/ide-helper.php
    php artisan ide-helper:generate
    sed -i -e "52s/\$/,/g" ./composer.json
    sed -i -e "52a\ \ \ \ \ \ \ \ \"post-update-cmd\": [" ./composer.json
    sed -i -e "53a\ \ \ \ \ \ \ \ \ \ \ \ \"Illuminate\\\\\\\\Foundation\\\\\\\\ComposerScripts::postUpdate\"," ./composer.json
    sed -i -e "54a\ \ \ \ \ \ \ \ \ \ \ \ \"php artisan ide-helper:generate\"," ./composer.json
    sed -i -e "55a\ \ \ \ \ \ \ \ \ \ \ \ \"php artisan optimize\"" ./composer.json
    sed -i -e "56a\ \ \ \ \ \ \ \ ]" ./composer.json
    cp $XDG_CONFIG_HOME/nvim/autoload/laravel/autoload.php ./.autoload.php
    cp $XDG_CONFIG_HOME/nvim/autoload/laravel/phpcd.vim ./.phpcd.vim
    echo ./.autoload.php >> .gitignore
    echo ./.phpcd.vim >> .gitignore
    echo ./_*.php >> .gitignore
    composer update
end

# composerのupdate Laravel 5.2
function LaravelInitialize2
    composer require --dev barryvdh/laravel-ide-helper
    sed -i -e "26d" ./app/Providers/AppServiceProvider.php
    sed -i -e "25a\ \ \ \ \ \ \ \ if (\$this->app->environment() !== 'production') {" ./app/Providers/AppServiceProvider.php
    sed -i -e "26a\ \ \ \ \ \ \ \ \ \ \ \ \$this->app->register(\\\\Barryvdh\\\\LaravelIdeHelper\\\\IdeHelperServiceProvider::class);" ./app/Providers/AppServiceProvider.php
    sed -i -e "27a\ \ \ \ \ \ \ \ }" ./app/Providers/AppServiceProvider.php
    composer require --dev doctrine/dbal
    composer update
    cp $XDG_CONFIG_HOME/nvim/autoload/laravel/autoload.php ./.autoload.php
    cp $XDG_CONFIG_HOME/nvim/autoload/laravel/phpcd.vim ./.phpcd.vim
    echo ./.autoload.php >> .gitignore
    echo ./.phpcd.vim >> .gitignore
    php artisan ide-helper:generate
    sed -i -e "45a\ \ \ \ \ \ \ \ \ \ \ \ \"php artisan ide-helper:generate\"," ./composer.json
    composer update
end

# cmakeプロジェクトの初期化
function CppInitialize
    mkdir -p ./build/
    touch ./CMakeLists.txt
    touch ./main.cpp
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

