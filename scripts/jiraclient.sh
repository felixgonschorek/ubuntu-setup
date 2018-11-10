#!/usr/bin/env bash

set -e

###############################################################################
# Almworks JiraClient
###############################################################################
# URL: http://almworks.com/jiraclient/overview.html
###############################################################################

NAME="JIRAClient"
MARKER="jiraclient"

###############################################################################

# JIRACLIENT_VERSION
[ -z "${JIRACLIENT_VERSION}" ] && JIRACLIENT_VERSION="3_8_4"

###############################################################################

print_install_start "$NAME" "$JIRACLIENT_VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L http://d1.almworks.com/.files/jiraclient-${JIRACLIENT_VERSION}_without_jre.tar.gz -o /tmp/jiraclient.tar.gz \
    && sudo tar xvfz /tmp/jiraclient.tar.gz -C /opt/ \
    && mkdir -p $HOME/bin \
    && ln -s /opt/jiraclient-${JIRACLIENT_VERSION}/bin/jiraclient.sh $HOME/bin/jiraclient \
    && write_marker "$NAME" "$JIRACLIENT_VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi
