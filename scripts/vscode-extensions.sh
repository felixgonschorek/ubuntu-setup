#!/usr/bin/env bash

set -e

###############################################################################
# Visual Studio Code Editor Extensions
###############################################################################
# URL: https://code.visualstudio.com/
###############################################################################

NAME="Visual Studio Code Extensions"
MARKER="vscode-extensions"
VERSION="current"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    code --install-extension 2gua.rainbow-brackets \
    && code --install-extension PeterJausovec.vscode-docker \
    && code --install-extension Zignd.html-css-class-completion \
    && code --install-extension dbaeumer.vscode-eslint \
    && code --install-extension donjayamanne.githistory \
    && code --install-extension flowtype.flow-for-vscode \
    && code --install-extension ms-vscode.go \
    && code --install-extension msjsdiag.debugger-for-chrome \
    && code --install-extension robertohuertasm.vscode-icons \
    && code --install-extension robinbentley.sass-indented \
    && code --install-extension rust-lang.rust \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi
