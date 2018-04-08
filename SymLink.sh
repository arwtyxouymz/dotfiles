#!/bin/bash

DOT_DIRECTORY="${HOME}/dotfiles"

cd ${DOT_DIRECTORY}

ln -sf ${DOT_DIRECTORY}/Brewfile ${HOME}/Brewfile

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done
