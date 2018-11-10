#!/usr/bin/env bash

set -e

###############################################################################
# Oh My ZSH theme Powerlevel9k with Powerline font
###############################################################################
# URL: http://ohmyz.sh/
###############################################################################

NAME="Oh My ZSH Theme Powerlevel9k"
MARKER="oh-my-zsh-powerlevel9k"
VERSION="current"

###############################################################################

# THEME_DIR
[ -z "${THEME_DIR}" ] && THEME_DIR="powerlevel9k"

# THEME_GIT
[ -z "${THEME_GIT}" ] && THEME_GIT="https://github.com/bhilburn/powerlevel9k.git"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    git clone https://github.com/powerline/fonts.git --depth=1 /tmp/powerline \
    && bash /tmp/powerline/install.sh \
    && rm -rf /tmp/powerline \
    && git clone $THEME_GIT $HOME/.oh-my-zsh/custom/themes/$THEME_DIR \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi