#!/bin/sh -e

# AP setup
nmcli c add type wifi ifname '*' con-name glancrsetup autoconnect no ssid "glancr setup" mode ap -- ipv4.method manual ipv4.addresses 192.168.8.1 ipv4.dns 192.168.8.1 ipv4.gateway 192.168.8.1

# Persistent and predictable LAN connection name
nmcli c add type ethernet ifname '*' con-name glancrlan autoconnect yes

nmcli d disconnect eth0
