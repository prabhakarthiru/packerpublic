#!/bin/sh
echo Hostname is `hostname`. Adding reverse lookup to /etc/hosts
ifconfig | grep eth -A 2|grep "inet addr" | cut -d: -f2 | awk '{ print $1 "\t" "'''$HOSTNAME'''"}' >> /etc/hosts
