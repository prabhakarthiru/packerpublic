#!/bin/sh -x
set -e

echo Installing rng-tools
yum install -y rng-tools
cat >>  /etc/sysconfig/rngd << EOF
EXTRAOPTIONS="-r /dev/urandom"
EOF
service rngd restart
chkconfig rngd on

