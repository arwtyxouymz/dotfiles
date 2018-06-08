#!/bin/bash

DOT_DIRECTORY="${HOME}/dotfiles"

cd ${DOT_DIRECTORY}

# ln -sf ${DOT_DIRECTORY}/Brewfile ${HOME}/Brewfile
#
# for f in .??*
# do
#     [ "$f" = ".git" ] && continue
#     [ "$f" = ".gitignore" ] && continue
#     [ "$f" = ".DS_Store" ] && continue
#     ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
# done

cd config

mkdir -p $HOME/.config/ 2>/dev/null

for d in * ; do
    ln -snfv ${DOT_DIRECTORY}/config/${d} ${HOME}/.config/${d}
    echo "hogehoge"
done

