#!/bin/sh

mkdir -p /proj/oracle/install
cd /proj/oracle/install
aws s3 cp s3://${SOURCE_ARTEFACT_BUCKET}/OracleClient.tar.gz .
tar xvfz OracleClient.tar.gz --exclude="OracleClient/11.2/*" --exclude="OracleClient/OraInventory/*" --exclude="OracleClient/OraInventory_old" && rm -f OracleClient.tar.gz

ls -l OracleClient

export LD_LIBRARY_PATH=/proj/oracle/install/OracleClient/11.2/lib:.:${LD_LIBRARY_PATH}
export ORACLEHOME=/proj/oracle/install/OracleClient/11.2
export PATH=${ORACLEHOME}/bin:${PATH}

cat <<"EOF" >> /etc/profile.d/oracle_client.sh
#!/bin/sh 
export LD_LIBRARY_PATH=/proj/oracle/install/OracleClient/11.2/lib:.:${LD_LIBRARY_PATH}
export ORACLEHOME=/proj/oracle/install/OracleClient/11.2
export PATH=${ORACLEHOME}/bin:${PATH}
EOF

chmod 0644 /etc/profile.d/oracle_client.sh
sh -x /etc/profile.d/oracle_client.sh
set | grep -i ORACLE

ls -l

groupadd oinstall
groupadd dba
useradd  -g oinstall -G dba oracle


cat <<"EOF" >> /proj/oracle/install/client_install.rsp
ORACLE_BASE=/proj/oracle/install/OracleClient
ORACLE_HOME=/proj/oracle/install/OracleClient/11.2
ORACLE_HOSTNAME=`hostname`.${localdomain}
INVENTORY_LOCATION=/proj/oracle/install/OracleClient/OraInventory
UNIX_GROUP_NAME=oinstall
SELECTED_LANGUAGES=en
oracle.install.responseFileVersion=/oracle/install/rspfmt_clientinstall_response_schema_v11_2_0 
oracle.install.client.installType=Administrator
oracle.install.client.upgrading=false
oracle.installer.autoupdates.option=SKIP_UPDATES
EOF

mkdir -p /proj/oracle/install/OracleClient/client/response
chown -R oracle:oinstall /proj/oracle
rm -rf /proj/oracle/install/OracleClient/OraInventory/*
rm -rf /proj/oracle/install/OracleClient/11.2/*

which gcc
# compat-libstdc++
# 8GB swap
blah=$(su - oracle -c '/proj/oracle/install/OracleClient/client/runInstaller -silent -responseFile /proj/oracle/install/client_install.rsp ; wait' || true)

chmod -R ugo+rX /proj/oracle

ls -l /proj/oracle/install/OracleClient/OraInventory/logs/
#cat /proj/oracle/install/OracleClient/OraInventory/logs/*.log
sh -x /proj/oracle/install/OracleClient/OraInventory/orainstRoot.sh

#ls -lR /proj/oracle/install/OracleClient/OraInventory

