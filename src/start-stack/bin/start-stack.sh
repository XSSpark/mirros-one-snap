#!/bin/sh
# set -e

cd "$SNAP/api" || return

export SECRET_KEY_BASE=$(cat $SNAP_DATA/secret)
bin/rails server -e production -b 127.0.0.1

