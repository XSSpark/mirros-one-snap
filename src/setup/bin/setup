#!/bin/sh -e

# AP + persistent and predictable LAN connection name
SECRET_KEY_BASE=$(cat "$SNAP_DATA"/secret)
export SECRET_KEY_BASE
export RAILS_ENV=production
cd "$SNAP/api"
"$SNAP/wrapper" "$SNAP/api/bin/rails" mirros:setup:network_connections
