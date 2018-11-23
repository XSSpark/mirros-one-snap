#!/bin/sh
# set -e

if [ "$(id -u)" != "0" ]; then
   echo "Must be run as root since root owns the database" 1>&2
   exit 1
fi

# AP setup
nmcli c add type wifi ifname '*' con-name glancrsetup autoconnect no ssid "glancr setup" mode ap -- ipv4.method manual ipv4.addresses 192.168.8.1 ipv4.dns 192.168.8.1 ipv4.gateway 192.168.8.1

echo "Stopping backend for OWM cities seed"
snapctl stop mirros-one.backend

cd $SNAP/api
echo "Commencing seed of OWM cities table. Might take a while ..."

SECRET_KEY_BASE=$(cat $SNAP_DATA/secret) RAILS_ENV=production $SNAP/bin/bundle exec rails runner "Openweathermap::Engine.load_seed"

echo "Finished OWM seed, restarting backend"
snapctl start mirros-one.backend