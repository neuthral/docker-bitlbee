#!/bin/sh

set -x

DEBIAN_FRONTEND=noninteractive

echo 'deb http://code.bitlbee.org/debian/master/jessie/amd64/ ./' > /etc/apt/sources.list.d/bitlbee.list
echo 'deb http://download.opensuse.org/repositories/home:/jgeboski/Debian_8.0 ./' > /etc/apt/sources.list.d/jgeboski.list

apt-key add /build/bitlbee.key
apt-key add /build/jgeboski.key

apt-get -qy --force-yes update
apt-get -qy --force-yes dist-upgrade
apt-get -qy --force-yes upgrade
apt-get -qy --force-yes install bitlbee
apt-get -qy --force-yes install bitlbee-facebook
apt-get -qy autoremove

rm -rf /tmp/* /var/tmp/*
apt-get -qy clean
rm -rf /var/lib/apt/lists/*
