#!/usr/bin/env bash

set -e

###############################################################################
# Node Version Manager
###############################################################################
# URL: https://github.com/creationix/nvm
###############################################################################

NAME="Node Version Manager (nvm)"
MARKER="nvm"

###############################################################################

# NVM_VERSION
[ -z "${NVM_VERSION}" ] && NVM_VERSION="0.33.11"

###############################################################################

print_install_start "$NAME" "$NVM_VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v${NVM_VERSION}/install.sh | bash \
    && write_marker "$NAME" "$NVM_VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi
