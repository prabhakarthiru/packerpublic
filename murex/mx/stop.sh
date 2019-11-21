./launchmxj.app -killall
sleep 5 
fuser -k mx mxjboot.jar fs murexnet

./launchmxj.app -s
rm -rf ./logs/*
