#!/bin/sh
# set -e

# AP setup
nmcli c add type wifi ifname '*' con-name glancrsetup autoconnect no ssid "glancr setup" mode ap -- ipv4.method manual ipv4.addresses 192.168.8.1 ipv4.dns 192.168.8.1 ipv4.gateway 192.168.8.1

cd $SNAP/api
SECRET_KEY_BASE=$(cat $SNAP_DATA/secret) RAILS_ENV=production $SNAP/bin/bundle exec rails runner "Openweathermap::Engine.load_seed" 