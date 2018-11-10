#!/usr/bin/env bash

set -e

###############################################################################
# Auto Lock on Suspend XPS 9560 with i3lock
###############################################################################
# URL: https://wiki.archlinux.org/index.php/Dell_XPS_15_9560
###############################################################################

NAME="Lock on Suspend (XPS 9560)"
MARKER="xps9560-lock"
VERSION="n/a"

###############################################################################

print_install_start $NAME $VERSION

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y i3lock \
    && echo "[Unit]
Description=Lock·on Suspend
Before=sleep.target
 
[Service]
User=%I
Type=simple
Environment=DISPLAY=:0
ExecStart=/usr/bin/i3lock -n -c 000000
ExecStartPost=/bin/sleep 1

[Install]
WantedBy=suspend.target" | sudo tee /etc/systemd/system/suspend@$USER.service
    sudo systemctl enable suspend@$USER.service \
    && write_marker $NAME $VERSION $MARKER
else
    echo "$NAME is already installed"
fi
