#!/bin/sh -e

# AP + persistent and predictable LAN connection name
export RAILS_ENV=production
cd "$SNAP/api"
"$SNAP/wrapper" "$SNAP/api/bin/rails" mirros:setup:network_connections
