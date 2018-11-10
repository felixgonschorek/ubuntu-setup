#!/usr/bin/env bash

set -e

###############################################################################
# Mercurial SCM
###############################################################################
# URL: https://www.mercurial-scm.org/
###############################################################################

NAME="Mercurial"
MARKER="mercurial"
VERSION="distro version"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y \
        mercurial \
        python-keyring \
        python-pip \
    && mkdir -p ~/.hgext \
    && curl -L https://bitbucket.org/yujiewu/hgflow/downloads/hgflow-v0.9.8.2.tar.bz2 -o - | tar -xj -C ~/.hgext/ \
    && curl -L -o ~/.hgext/mercurial_keyring.py http://bitbucket.org/Mekk/mercurial_keyring/raw/default/mercurial_keyring.py \
    && pip install mercurial_extension_utils \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi
