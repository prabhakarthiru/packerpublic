#!/bin/sh -x
set -e
echo Disabling selinux
grep  -e ^SELINUX= /etc/selinux/config
sed -i -e s/^SELINUX=.*/SELINUX=disabled/ /etc/selinux/config
grep  -e ^SELINUX= /etc/selinux/config
