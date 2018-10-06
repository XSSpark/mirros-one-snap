#!/bin/sh
# set -e

# Run any commands needed to setup the snap.
# This could be downloading a list of dynamic configuration options or creating a database.
cd $SNAP/api

# Generates an individual secret for each snap installation. Environment variables set here might not be present at all times across revisions, so we store it in a file.
$SNAP/bin/rails secret > $SNAP_DATA/secret
cat $SNAP_DATA/secret

SECRET_KEY_BASE=$(cat $SNAP_DATA/secret) RAILS_ENV=production $SNAP/bin/rails db:create db:migrate db:seed
echo "done with setup"
