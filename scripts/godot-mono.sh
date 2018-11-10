#!/usr/bin/env bash

set -e

###############################################################################
# Godot 3.0.6 Game engine with Mono Support
###############################################################################
# URL: https://godotengine.org/
###############################################################################

NAME="Godot with Mono-Support"
MARKER="godot-mono"

###############################################################################

# GODOT_VERSION
[ -z "${GODOT_VERSION}" ] && GODOT_VERSION=3.0.6

###############################################################################

GODOT_NAME="Godot_v${GODOT_VERSION}-stable_mono_x11_64"
GODOT_EXECUTABLE="Godot_v${GODOT_VERSION}-stable_mono_x11.64"
GODOT_MONO_URL=https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/mono/${GODOT_NAME}.zip

print_install_start "$NAME" "$GODOT_VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L ${GODOT_MONO_URL} -o /tmp/${GODOT_NAME}.zip \
    && sudo unzip /tmp/${GODOT_NAME}.zip -d /opt \
    && mkdir -p $HOME/bin \
    && ln -s /opt/${GODOT_NAME}/${GODOT_EXECUTABLE} $BIN_DIRECTORY/godot \
    && write_marker "$NAME" "$GODOT_VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi
