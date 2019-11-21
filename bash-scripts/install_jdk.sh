#!/bin/sh -x

aws --region ap-southeast-2 s3 cp s3://${SOURCE_ARTEFACT_BUCKET}/jdk1.7.0_51.tar.gz /tmp/
cd /proj/oracle
tar xvfz /tmp/jdk1.7.0_51.tar.gz > /dev/null

cat <<"EOF" >> /etc/profile.d/java.sh
#!/bin/sh 
export JAVAHOME=/proj/oracle/jdk1.7.0_51
export JAVAHOME_64=/proj/oracle/jdk1.7.0_51
export JAVA_HOME=/proj/oracle/jdk1.7.0_51
export JAVA_HOME_64=/proj/oracle/jdk1.7.0_51
export PATH=${JAVAHOME}/bin:${PATH}
EOF

chmod 0644 /etc/profile.d/java.sh

chmod -R ugo+rX /proj/oracle/

sh -x /etc/profile.d/java.sh

