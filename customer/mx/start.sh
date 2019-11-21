echo 'hostname is:'
hostname

echo 'running as'
whoami

./launchmxj.app -fs
sleep 5
./launchmxj.app -xmls
sleep 55
./launchmxj.app -l
sleep 5

##################
# non-basic services

./launchmxj.app -murexnet
sleep 5
./launchmxj.app -mandatory
sleep 5
./launchmxj.app -mxml
sleep 5
./launchmxj.app -aagent
sleep 5
./launchmxj.app -warehouse
sleep 5
./launchmxj.app -mxhibernate
sleep 5
./launchmxj.app -mxrepository
sleep 5
./launchmxj.app -mxosp
sleep 5
./launchmxj.app -l /MXJ_CONFIG_FILE:public.mxres.common.launcherireporting.mxres
sleep 5
./launchmxj.app -l /MXJ_CONFIG_FILE:public.mxres.common.launchermxdatapublisher.mxres
sleep 5


##################

sleep 5
./launchmxj.app -s
