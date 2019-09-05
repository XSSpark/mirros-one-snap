#!/bin/sh
# set -e

cd "$SNAP/api" || return

SECRET_KEY_BASE=$(cat "$SNAP_DATA/secret")
export SECRET_KEY_BASE
RAILS_RELATIVE_URL_ROOT=/api
export RAILS_RELATIVE_URL_ROOT
bin/rails server -e production -b 127.0.0.1
