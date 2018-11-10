#!/usr/bin/env bash

set -e

###############################################################################
# Git SCM
###############################################################################
# URL: https://git-scm.com/
###############################################################################

NAME="Git"
MARKER="git"
VERSION="distro version"
###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y --no-install-recommends \
        git \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi