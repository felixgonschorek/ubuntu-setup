#!/usr/bin/env bash

set -e

###############################################################################
# ZSH Shell with Oh My ZSH
###############################################################################
# URL: http://ohmyz.sh/
###############################################################################

NAME="ZSH with Oh My ZSH"
MARKER="oh-my-zsh"
VERSION="current"

###############################################################################

# THEME_DIR
[ -z "${THEME_DIR}" ] && THEME_DIR="powerlevel9k"

# THEME_GIT
[ -z "${THEME_GIT}" ] && THEME_GIT="https://github.com/bhilburn/powerlevel9k.git"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y  zsh \
    && if [ ! -d ~/.oh-my-zsh ]; then git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh; fi \
    && chsh -s /bin/zsh \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi