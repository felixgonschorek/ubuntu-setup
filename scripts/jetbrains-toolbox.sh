#!/usr/bin/env bash

set -e

###############################################################################
# JetBrains Toolbox
###############################################################################
# URL: https://www.jetbrains.com/toolbox/
###############################################################################

NAME="JetBrains Toolbox"
MARKER="jetbrains-toolbox"

###############################################################################

# JETBRAINS_TOOLBOX_VERSION
[ -z "${JETBRAINS_TOOLBOX_VERSION}" ] && JETBRAINS_TOOLBOX_VERSION="1.11.4269"

###############################################################################

print_install_start "$NAME" "$JETBRAINS_TOOLBOX_VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L https://download.jetbrains.com/toolbox/jetbrains-toolbox-${JETBRAINS_TOOLBOX_VERSION}.tar.gz -o /tmp/jbtb.tar.gz \
    && sudo tar xvfz /tmp/jbtb.tar.gz -C /opt/ \
    && rm /tmp/jbtb.tar.gz \
    && write_marker "$NAME" "$JETBRAINS_TOOLBOX_VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi
