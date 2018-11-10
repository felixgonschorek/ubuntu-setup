#!/usr/bin/env bash

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

print_install_start () {
    echo ""
    echo ""
    echo -e "$GREEN"
    echo -e "###############################################################################"
    echo -e "#$BLUE Trying to install $GREEN$1 $BLUE($GREEN$2$BLUE)$GREEN"
    echo -e "###############################################################################"
    echo -e "$NC"
}

write_marker () {
    echo "$(date)\n$2" > $MARKER_DIRECTORY/$3
    echo ""
    echo -e "$GREEN"
    echo -e "###############################################################################"
    echo -e "#$BLUE Finished installing $GREEN$1 $BLUE($GREEN$2$BLUE)$GREEN"
    echo -e "###############################################################################"
    echo -e "$NC"
}
