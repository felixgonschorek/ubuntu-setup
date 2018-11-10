#!/usr/bin/env bash

set -e

###############################################################################
# Yarn Dependency Management Tool
###############################################################################
# URL: https://yarnpkg.com/en/
###############################################################################

NAME="Yarn Package Manager"
MARKER="yarn"
VERSION="ppa version"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
    && sudo apt-get update \
    && sudo apt-get install --no-install-recommends yarn \
    && write_marker "$NAME" "$VERSION" "$MARKER"

else
    echo "$NAME is already installed"
fi
