#!/bin/sh -x
cat /proc/partitions

mkdir -p /proj/oracle /proj/murex /proj/logs
mkfs.ext4 /dev/xvdg -L PROJ_ORACLE
mkfs.ext4 /dev/xvdh -L PROJ_LOGS
mkfs.ext4 /dev/xvdi -L PROJ_MUREX

cat <<"EOF" >> /etc/fstab 
/dev/xvdg /proj/oracle ext4 defaults 1 2
/dev/xvdh /proj/logs ext4 defaults 1 2 
/dev/xvdi /proj/murex ext4 defaults 1 2 
EOF

cat /etc/fstab
mount -a
mount
chmod -R 775 /proj

dd if=/dev/zero of=/swapfile bs=1024 count=1000000
mkswap /swapfile
chmod 600 /swapfile
swapon /swapfile
sed -i '$ a\/swapfile swap swap defaults 0 0' /etc/fstab

