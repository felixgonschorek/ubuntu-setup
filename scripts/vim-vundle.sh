#!/usr/bin/env bash

set -e

###############################################################################
# Vundle, the plug-in manager for Vim
###############################################################################
# URL: https://github.com/VundleVim/Vundle.vim
###############################################################################

NAME="Vundle"
MARKER="vundle"
VERSION="v0.10.2"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    mkdir -p ~/.vim/bundle/ \
    && git clone -b $VERSION https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi
