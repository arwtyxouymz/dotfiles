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

if not test -f $XDG_CONFIG_HOME/fish/functions/fisher.fish
  echo "Installing fisherman for the first time"
  curl -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish --create-dirs git.io/fisher
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
set -g theme_title_use_abbreviated_path no
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 0
set -g theme_newline_cursor yes

status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)

alias vi nvim
alias vim nvim
alias dc docker-compose

# set -xg PYTHONPATH /Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Resources/Python
# set -xg PYTHONPATH $PYTHONPATH $HOME/.pyenv/versions/2.7.14/envs/neovim2/lib/python2.7/site-packages

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

# cmakeプロジェクトの初期化
function CppInitialize
    mkdir -p ./build/
    touch ./CMakeLists.txt
    touch ./main.cpp
end

# build
function build
    mkdir -p ./build; and cd build > /dev/null
    if test -x (command -v clang)
        cmake .. -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
        if test -x (command -v compdb)
            compdb list > ../compile_commands.json
        else
            echo "\e[33mWarning: compdb is not installed"
        end
    else
        cmake ..
        echo "\e[33mWarning: clang is not installed, using default compiler"
    end
    cd ../ > /dev/null
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
