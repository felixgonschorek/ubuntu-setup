#!/usr/bin/env bash

set -e

###############################################################################
# Rustlang Programming Language
###############################################################################
# URL: https://rust-lang.org/
###############################################################################

NAME="Rust Lang"
MARKER="rustlang"
VERSION="current"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl https://sh.rustup.rs -sSf | sh \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi
