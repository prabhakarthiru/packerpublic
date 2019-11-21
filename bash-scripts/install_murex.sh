#!/bin/sh -x

export JAVAHOME=/proj/oracle/jdk1.7.0_51
export JAVAHOME_64=/proj/oracle/jdk1.7.0_51
export PATH=${JAVAHOME}/bin:${PATH}

echo "Pulling down artefacts"
ls -l /tmp/murex/
mkdir -p /proj/murex/install/ && cd /proj/murex/install/
aws s3 cp s3://${SOURCE_ARTEFACT_BUCKET}/primary-as-3.1.34-4028627-170622-0816-2602454.jar  .
aws s3 cp s3://${SOURCE_ARTEFACT_BUCKET}/secondary-as-3.1.34-4028627-170622-0816-2602454.jar .
aws s3 cp s3://${SOURCE_ARTEFACT_BUCKET}/murex-lic-prod-mx-3-1-34.jar .
cp /tmp/murex/wizardconfig-mxPrimary.xml .
cp /tmp/murex/wizardconfig-mxSecondary.xml .
cp /tmp/murex/tnsnames.ora /proj/oracle/install/OracleClient/11.2/network/admin/
cp /tmp/murex/replace.sh .
chmod -R ugo+rX /proj/oracle/

ls -la

echo "Running install jars"
mkdir =p /proj/murex/mx && cd /proj/murex/mx
java -jar /proj/murex/install/primary-as-3.1.34-4028627-170622-0816-2602454.jar  -wizardconfig:/proj/murex/install/wizardconfig-mxPrimary.xml -installtempdir /tmp
java -jar /proj/murex/install/secondary-as-3.1.34-4028627-170622-0816-2602454.jar -wizardconfig:/proj/murex/install/wizardconfig-mxSecondary.xml -installtempdir /tmp
mkdir -p /proj/murex/mx/fs/license && cd /proj/murex/mx/fs/license
jar -xvf /proj/murex/install/murex-lic-prod-mx-3-1-34.jar

echo "Overlaying files"
rsync -arI /tmp/murex/mx/* /proj/murex/mx/

echo "Setting user limits"
useradd murex
touch ~murex/.bash_profile

cat > ~murex/.bash_profile << EOF
ulimit -u 790527
ulimit -n 4096
export PS1='\u@\h \w$ '
cd /proj/murex/mx
EOF

chown -R murex:murex /proj/murex
chmod -R ugo+rx /proj/murex

