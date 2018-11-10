#!/usr/bin/env bash

set -e

###############################################################################
# Git Extras
###############################################################################
# URL: https://git-scm.com/
###############################################################################

NAME="Git Extras"
MARKER="git-extras"
VERSION="current"
###############################################################################

print_install_start $NAME $VERSION

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y --no-install-recommends \
        tig \
        meld \
    && wget --no-check-certificate -q  https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh \
    && sudo bash gitflow-installer.sh install stable \
    && rm gitflow-installer.sh \
    && wget --no-check-certificate -q https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -O $HOME/bin/diff-so-fancy \
    && chmod +x $BIN_DIRECTORY/diff-so-fancy \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi