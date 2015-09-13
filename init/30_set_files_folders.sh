#!/bin/bash
mkdir -p /config/pid /config/log

if [ ! -f "/config/bin/ovpn-init" ]; then
cp -pr /usr/local/openvpn_as/* /config/
rm /config/etc/as.conf
find /config/scripts -type f -print0 | xargs -0 sed -i 's#/usr/local/openvpn_as#/config#g'
find /config/bin -type f -print0 | xargs -0 sed -i 's#/usr/local/openvpn_as#/config#g'
sed -i 's#=openvpn_as#=abc#g' /config/etc/as_templ.conf
fi

if [ -f "/config/pid/openvpn.pid" ]; then
rm /config/pid/openvpn.pid
fi

chown -R abc:abc /config/pid /config/log
