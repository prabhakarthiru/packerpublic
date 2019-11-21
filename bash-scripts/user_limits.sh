#!/bin/sh -x
set -e

echo Changing hard user limits
cat >>  /etc/security/limits.conf <<EOF
*	hard	core	0
*	hard 	nofile	4096
*	hard	stack	4096
EOF
