#!/bin/sh
$SNAP/bin/nmcli -f NAME c show --active | grep glancrsetup
