#!/usr/bin/env bash

set -e

###############################################################################
# Vim - the ubiquitous text editor
###############################################################################
# URL: https://www.vim.org/
###############################################################################

NAME="Vim"
MARKER="vim"
VERSION="distro version"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y --no-install-recommends vim \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi
