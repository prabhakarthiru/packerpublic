#!/bin/sh -x
set -e

echo Changing system limits

cat > /etc/security/limits.conf << EOF
* hard  core    unlimited
* soft  core    unlimited 
* hard  nofile  4096
* soft  nofile  4096
* hard  stack   4096
* soft  stack   4096
* hard  nproc   790527
* soft  nproc   790527
EOF


ulimit -a
