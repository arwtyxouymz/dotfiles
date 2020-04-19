#!/usr/bin/env bash

if ! is_exists npm; then
    log_error "Failed to setup node.js: Command not found"
    exit
fi

npm install -g neovim
npm install -g bash-language-server
