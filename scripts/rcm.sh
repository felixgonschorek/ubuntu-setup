#!/usr/bin/env bash

set -e

###############################################################################
# ThoughtBot RCM Dotfile Management
###############################################################################
# URL: https://github.com/thoughtbot/rcm
###############################################################################

NAME="RCM"
MARKER="rcm"
VERSION="ppa version"

###############################################################################

# DOTFILES_REPO
# There is no default value!

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo add-apt-repository -y ppa:martin-frost/thoughtbot-rcm \
    && sudo apt-get update \
    && sudo apt-get install -y rcm \
    && git clone $DOTFILES_REPO $HOME/.dotfiles \
    && rcup \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi
