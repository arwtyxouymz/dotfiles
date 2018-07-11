#####################################
# Symbolic Links
#####################################
echo $'\e[32mCreate Symbolic Links ..............\e[0m'
DOT_DIRECTORY="${HOME}/dotfiles"
CONFIG_DIRECTORY="${DOT_DIRECTORY}/.config"
XDG_CONFIG_HOME="${HOME}/.config"

# $HOME/.configがなければ作る
mkdir -p $XDG_CONFIG_HOME 2>/dev/null
cd ${DOT_DIRECTORY}


__dot_link() {
    dotfile="${DOT_DIRECTORY}/$1"
    linkfile="${HOME}/$1"
    if [ -e $dotfile ]; then
        ln -snfv $dotfile $linkfile
    else
        echo $'\e[31mファイルが存在していません\e[0m'
    fi
}

__fish_link() {
    local FISH_DIR="${CONFIG_DIRECTORY}/fish"
    cd ${FISH_DIR}
    # $XDG_CONFIG_HOME/fishを作成
    mkdir -p ${XDG_CONFIG_HOME}/fish 2>/dev/null
    for f in *; do
        ln -snfv ${FISH_DIR}/${f} ${XDG_CONFIG_HOME}/fish/${f}
    done
}

__composer_link() {
    local COMPOSER_DIR="${CONFIG_DIRECTORY}/composer"
    cd ${COMPOSER_DIR}
    # $XDG_CONFIG_HOME/composerを作成
    mkdir -p ${XDG_CONFIG_HOME}/composer 2>/dev/null
    for f in *; do
        ln -snfv ${COMPOSER_DIR}/${f} ${XDG_CONFIG_HOME}/composer/${f}
    done
}

__dir_link() {
    ln -snfv ${dotdir} "${XDG_CONFIG_HOME}/$1"
}

__config_link() {
    cd ${CONFIG_DIRECTORY}
    for d in *; do
        dotdir="${CONFIG_DIRECTORY}/${d}"
        if [ -e $dotdir ]; then
            if [ ${d} = "fish" ]; then
                __fish_link
            elif [ ${d} = "composer" ]; then
                __composer_link
            else
                __dir_link ${d}
            fi
        else
            echo $'\e[31mファイルが存在していません\e[0m'
        fi
    done
}

for f in * .*; do
    basename=$(basename "$f")
    if [ ${basename} = "." ] || [ ${basename} = ".." ] || [ ${basename##*.} = "sh" ] || [ ${basename##*.} = "md" ] || [ ${basename} = ".git" ] || [ ${basename} = ".gitignore" ] || [ ${basename} = "com.googlecode.iterm2.plist" ] || [ ${basename} = "bin" ] || [ ${basename} = "code-signing.webarchive" ]; then
        :
    elif [ ${basename} = ".config" ]; then
        __config_link
    else
        __dot_link ${basename}
    fi
done 
