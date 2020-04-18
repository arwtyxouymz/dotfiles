#!/usr/bin/env bash

DOTPATH=$HOME/dotfiles

for f in .??*; do
    [ "$f" == ".git" ] && continue
    [ "$f" == ".gitignore" ] && continue
    [ "$f" == ".DS_Store" ] && continue

    if [ "$f" == ".config" ]; then
        for cf in "$f/*"; do
            ln -snfv "$DOTPATH/$cf" "$HOME/$cf"
        done
        continue
    fi

    echo "$f"
    ln -snfv "$DOTPATH/$f" "$HOME/$f"
done
