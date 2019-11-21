#! /bin/bash
#
#  Copyright Murex S.A.S., 2003-2013. All Rights Reserved.
#
#  This software program is proprietary and confidential to Murex S.A.S and its
#  affiliates ("Murex") and, without limiting the generality of the foregoing
#  reservation of rights, shall not be accessed, used, reproduced or
#  distributed without the express prior written consent of Murex and subject
#  to the applicable Murex licensing terms. Any modification or removal of this
#  copyright notice is expressly prohibited.
#
#!/bin/sh

# Murex: Jun  2003
# launchmxj.app 2.10 version
# Mx G2000 Environment variables setup
# set -x

 GC_Param() {
   # Jimmy Oei: 20 Oct 15
   # Return the common GC param to be used for all launchers.
   # The input is the launcher name, which will be used to set the GC log filename
   # Sample usage: "GC_Param MXML"
   echo  " -verbose:gc -XX:+PrintGCDateStamps -XX:+PrintGCDetails -Xloggc:logs/GC_$1_$(date +%Y%m%d_%H%M%S).log "
}

OS_TYPE=`uname`

if [ "$OS_TYPE" = "SunOS" ]; then
JAVAHOME=u:\devtools\java\jdk1.7.0_51
fi
if [ "$OS_TYPE" = "AIX" ]; then
JAVAHOME=u:\devtools\java\jdk1.7.0_51
JAVAHOME_64=/usr/local/java/java7_SR6_FP1_64
export JAVAHOME_64
fi
if [ "$OS_TYPE" = "HP-UX" ]; then
JAVAHOME=u:\devtools\java\jdk1.7.0_51
fi
if [ "$OS_TYPE" = "Linux" ]; then
JAVAHOME=/proj/oracle/jdk1.7.0_51
JAVAHOME_64=/proj/oracle/jdk1.7.0_51
export JAVAHOME_64
fi

export JAVAHOME

# Sybase home used to locate interface files and Open Client dynamic libraries
SYBASE=u:\tools\sybase\15.7-ebf21006
export SYBASE

# Oracle Home used to locate Oracle Client dynamic libraries
ORACLE_HOME=/proj/oracle/install/OracleClient/11.2
export ORACLE_HOME
NLS_LANG=AMERICAN_AMERICA.AL32UTF8
export NLS_LANG

# Python home used to locate python dynamic library and its modules
PYTHONHOME=@PYTHONHOME_PATH@
export PYTHONHOME
# Openssl home used to locate ssl & crypto dynamic libraries for MACS
# If unset, system libraries will be used
OPENSSL_HOME=
export OPENSSL_HOME

# Path to gfortran used for Risk Var BLAS enhanced library
PATH_TO_GFORTRAN=
export PATH_TO_GFORTRAN

#MXG2000_HOME=/apps/murfx2000_new
#export MXG2000_HOME

#MXJ_JDK_OR_JRE=jdk
#MXJ_JDK_OR_JRE=jre

# Define the encrypted password for the monitor
MXJ_PASSWORD=00d0003100b000870077

# Define your default Mx G2000 File Server environment
# Warning : Take care of the MXJ_FILESERVER_HOST in case of running on different host.
MXJ_FILESERVER_HOST=MUREXHOSTNAME
MXJ_FILESERVER_PORT=10000

MXJ_FILESERVER_TIME_ADJUSTMENT=1

# Optional File ServerTLS/SSL settings
MXJ_FILESERVER_TLS_PORT=
MXJ_FILESERVER_TLS_CLIENT_AUTH=N

# Optional arguments passed to the FileServer.
# " " are mandatory if several args.
FILESERVER_ARGS=

# Define your default Mx G2000 XmlServer environment
#Backward compatibility with Version 2.2.9
#Leave it blank with 2.2.10.
MXJ_HOST=
MXJ_PORT=

# Optional arguments passed to the XmlServer such as forcing attachment to
# a specific IP adrress. " " are mandatory if several args.
#XML_SERVER_ARGS="-Djava.rmi.server.hostname=mxapp"
XML_SERVER_ARGS=

# Define your default Mx G2000 Site and Hub environment
#Define your site name, must be defined in site.mxres.
#Leave it by default.
MXJ_SITE_NAME=site1

#Define your hub name, must be defined in site.mxres.
#Leave it by default.
MXJ_HUB_NAME=hub1

# Optional arguments passed to the Hub home such as forcing attachment to
# a specific IP adrress. " " are mandatory if several args.
#HUB_HOME_ARGS="-Djava.rmi.server.hostname=X.X.X.X"
HUB_HOME_ARGS=

# Define your default Mx G2000 MxMlExchange environment
# Optional arguments passed to the MxMlExchange Servers.
# " " are mandatory if several args.
#MXML_SERVER_ARGS="$MXML_SERVER_ARGS -Djava.rmi.server.hostname=X.X.X.X"

# Optional arguments passed to MxMlExchangeAll, MxMlExchangeSpaces, MxMlExchangeSecondary, and MxMlWorker.
MXML_JVM_ARGS="$MXML_JVM_ARGS -XX:MaxPermSize=512M -Xmx1G `GC_Param MxML_Exchange`"
#MXML_JVM_ARGS="$MXML_JVM_ARGS -verbose:gc -XX:+PrintGCTimeStamps"
#MXMLSPACES_JVM_ARGS="$MXMLSPACES_JVM_ARGS -verbose:gc -XX:+PrintGCTimeStamps"
#MXMLSECONDARY_JVM_ARGS="$MXMLSECONDARY_JVM_ARGS -verbose:gc -XX:+PrintGCTimeStamps"
#MXMLWORKER_JVM_ARGS="$MXMLWORKER_JVM_ARGS -verbose:gc -XX:+PrintGCTimeStamps"

#JAVA Agent for the DD monitoring
#DD_MONITORING_JAVA_AGENT="-javaagent:jar/aspectjweaver-1.7.4.jar"

# Define your default Mx G2000 AmendmentAgent environment
# Optional arguments passed to the AmendmentAgent Server.
# " " are mandatory if several args.
#AAGENT_SERVER_ARGS="$AAGENT_SERVER_ARGS -Djava.rmi.server.hostname=X.X.X.X"
#AAGENT_JVM_ARGS="$AAGENT_JVM_ARGS -verbose:gc -XX:+PrintGCTimeStamps"

# Define your default Mx G2000 AlertEngine environment
# Optional arguments passed to the AlertEngine Server.
# " " are mandatory if several args.
#ALERT_SERVER_ARGS="$ALERT_SERVER_ARGS -Djava.rmi.server.hostname=X.X.X.X"
#ALERT_JVM_ARGS="$ALERT_JVM_ARGS -verbose:gc -XX:+PrintGCTimeStamps"

# Define your default Mx G2000 FEDERATION environment
# Optional arguments passed to the FEDERATION Server.
# " " are mandatory if several args.
#FEDERATION_SERVER_ARGS="$FEDERATION_SERVER_ARGS -Djava.rmi.server.hostname=X.X.X.X"
#FEDERATION_JVM_ARGS="$FEDERATION_JVM_ARGS -verbose:gc -XX:+PrintGCTimeStamps"

# Define your default Mx G2000 MPC environment
# Optional arguments passed to the MPC Server.
# " " are mandatory if several args.
#MPC_SERVER_ARGS="$MPC_SERVER_ARGS -Djava.rmi.server.hostname=X.X.X.X"
#MPC_JVM_ARGS="$MPC_JVM_ARGS -verbose:gc -XX:+PrintGCTimeStamps"

# Define your default Mx G2000 WAREHOUSE environment
# Optional arguments passed to the WAREHOUSE Server.
# " " are mandatory if several args.
#WAREHOUSE_SERVER_ARGS="$WAREHOUSE_SERVER_ARGS -Djava.rmi.server.hostname=X.X.X.X"
#WAREHOUSE_JVM_ARGS="$WAREHOUSE_JVM_ARGS -verbose:gc -XX:+PrintGCTimeStamps"

# Define your default MDSS environment
# Optional arguments passed to the MDSS Server.
# " " are mandatory if several args.
#MDSS_JVM_ARGS="$MDSS_JVM_ARGS -verbose:gc"

# Define your default Livebook environment
# Optional arguments passed to the Livebook Server.
# " " are mandatory if several args.
#LIVEBOOK_JVM_ARGS="$LIVEBOOK_JVM_ARGS -verbose:gc"

# Define your default Mx G2000 MANDATORY environment
# Optional arguments passed to the MANDATORY Server.
# " " are mandatory if several args.
#MANDATORY_SERVER_ARGS="$MANDATORY_SERVER_ARGS -Djava.rmi.server.hostname=X.X.X.X"
#MANDATORY_JVM_ARGS="$MANDATORY_JVM_ARGS -verbose:gc -XX:+PrintGCTimeStamps"

# Define your default Mx3 OSP environment
# Optional arguments passed to the OSP Server.
# " " are mandatory if several args.
#OSP_SERVER_ARGS="$OSP_SERVER_ARGS -Djava.rmi.server.hostname=X.X.X.X"
#OSP_JVM_ARGS="$OSP_JVM_ARGS -verbose:gc -XX:+PrintGCTimeStamps"

# Optional arguments passed to the MXMARKETRISK services
#MR_MANAGER_JVM_ARGS="$MR_MANAGER_JVM_ARGS"
#MR_ORCHESTRATOR_JVM_ARGS="$MR_ORCHESTRATOR_JVM_ARGS"
#MR_ENGINE_JVM_ARGS="$MR_ENGINE_JVM_ARGS"
#MR_ENGINE_MX_JVM_ARGS="$MR_ENGINE_MX_JVM_ARGS"
#MR_VARIATIONS_PROVIDER_JVM_ARGS="$MR_VARIATIONS_PROVIDER_JVM_ARGS"
#MR_REGISTRY_JVM_ARGS="$MR_REGISTRY_JVM_ARGS"
#MR_MPC_JVM_ARGS="$MR_MPC_JVM_ARGS"

# Optional arguments passed to the Clearing Orchestrator
#CLEARING_ORCHESTRATOR_JVM_ARGS="$CLEARING_ORCHESTRATOR_JVM_ARGS -XX:MaxPermSize=512M -verbose:gc -XX:+PrintGCTimeStamps"

# Define your default Mx G2000 Launcher environment
# Optional arguments passed to launcher.
# " " are mandatory if several args.
LAUNCHER_ARGS=

# Define your default Mx G2000 Murexnet environment
# Warning : Must be the same as specified into the murexnet.mxres configuration file
# by /IPHOST:namedhost:8000
# The Murexnet usually run on 8000 port, but you can use another one.
MUREXNET_PORT=10003

#Optional arguments passed to the murexnet such as forcing attachment to
# a specific IP adrress or logs." " are mandatory if several args.
#MUREXNET_ARGS="/IPALTADDR:10.10.8.150 /IPLOG"
MUREXNET_ARGS=

# Variable to set the DISPLAY for X window rticachesession display.
# Leave it dynamic.
RTISESSION_XWIN_DISP=`echo $DISPLAY`
RTICACHESESSION_XWIN_DISP=`echo $DISPLAY`

# Optional arguments passed to the MDCServer such changing the JVM memory
# allocation args.
#MDCS_JVM_ARGS="$MDCS_JVM_ARGS -Xmx2g"

#Core name format  settings.
if [ "$OS_TYPE" = "SunOS" ]; then
sleep 1
#coreadm -p core.%f.%n.%p.%t $$
fi
if [ "$OS_TYPE" = "AIX" ]; then
sleep 1
#export CORE_NAMING=true
fi

# Proxy settings used by some connectors (for example, ICE) to connect to external resources/servers
PROXY_HOST=
PROXY_PORT=
# If you need proxy authentication, PROXY_AUTH should be set to "true"
# otherwise it should be false
PROXY_AUTH=false
# If your proxy needs authentication, please provide the following parameters
PROXY_USER=
PROXY_PASSWORD=

# Proxy settings needed for the connection to locally installed Secure Connect (UBS connector)
SC_PROXY_HOST=
SC_PROXY_PORT=
# If you need proxy authentication, PROXY_AUTH should be set to "true"
# otherwise it should be false
SC_PROXY_AUTH=false
# If your proxy needs authentication, please provide the following parameters
SC_PROXY_USER=
SC_PROXY_PASSWORD=
# SC proxy settings grouped
SC_PROXY_SETTINGS="-DmxUbsProxyAuth=$SC_PROXY_AUTH -DmxUbsProxyHost=$SC_PROXY_HOST -DmxUbsProxyPort=$SC_PROXY_PORT -DmxUbsProxyUser=$SC_PROXY_USER -DmxUbsProxyPassword=$SC_PROXY_PASSWORD"
# Optional reconnection settings for the reconnection logic of the UBS task
# Interval (in ms) between reconnection attempts in normal mode. Default is 120000.
UBS_RECONNECT_TIME=
# Number of normal reconnection attempts. Default is 30.
UBS_RECONNECT_ATTEMPTS=
# Interval (in ms) between reconnection attempts in backup mode. Default is 3600000.
UBS_BACKUP_RECONNECT_TIME=
# Number of backup reconnection attempts. Default is 48.
UBS_BACKUP_RECONNECT_ATTEMPTS=
# UBS reconnection settings grouped
UBS_RECONNECTION_SETTINGS="-DmxUbsReconnectTime=$UBS_RECONNECT_TIME -DmxUbsReconnectAttempts=$UBS_RECONNECT_ATTEMPTS -DmxUbsBackupReconnectTime=$UBS_BACKUP_RECONNECT_TIME -DmxUbsBackupReconnectAttempts=$UBS_BACKUP_RECONNECT_ATTEMPTS"
# Arguments used for the launcher of the UBS task
UBS_LAUNCHER_ARGS="$SC_PROXY_SETTINGS $UBS_RECONNECTION_SETTINGS"

# Path to client Tibco Datasynpase GridServer 6.0 libraries
DS_CLIENTLIB_PATH=@DS_CLIENTLIB_PATH@

# Path to client Platform Computing Symphony 4.1 libraries
SYM_CLIENTLIB_PATH=@SYM_CLIENTLIB_PATH@

SOAM_HOME=.
export SOAM_HOME
EGO_CONFDIR=$SOAM_HOME/sym31_conf
export EGO_CONFDIR

# settings for PFE services
# this can be used to point to a set of evaluation libraries
# that are different from the FO libraries
PFE_MACS_LIB_PATH="./macs-pfe"
PFE_MACS_PYPATH="$PFE_MACS_LIB_PATH/py"
PFE_MACS_OCLPATH="$PFE_MACS_LIB_PATH/cl"

# Settings for MLC Services
######################################################################
# Logger for mlc integrated with commons logging
MXJ_MLC_LOGGER_FILE=public.mxres.mxmlc.loggers.service_logger.mxres

# JVM settings for MLC and LRB
if ([ "$OS_TYPE" = "SunOS" ] || [ "$OS_TYPE" = "Linux" ]); then
        MXMLC_JVM_ARGS="-server -Xms32M -Xmx2G -XX:MaxPermSize=256M -XX:PermSize=256M -XX:+DisableExplicitGC -Dsun.rmi.dgc.client.gcInterval=60000 -Dsun.rmi.dgc.server.gcInterval=60000 -XX:+CMSParallelRemarkEnabled -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:CMSInitiatingOccupancyFraction=70 -Djava.awt.headless=true -verbose:gc -Xloggc:logs/mxmlc/mxmlc/mxmlc.gc.log -XX:+PrintGCDetails -XX:+PrintGCTimeStamps"
        LRB_JVM_ARGS="-server -Xms32M -Xmx512M -XX:MaxPermSize=256M -XX:PermSize=256M -XX:+DisableExplicitGC -Dsun.rmi.dgc.client.gcInterval=60000 -Dsun.rmi.dgc.server.gcInterval=60000 -XX:+CMSParallelRemarkEnabled -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:CMSInitiatingOccupancyFraction=70 -Djava.awt.headless=true -verbose:gc -Xloggc:logs/mxlrb/mxlrb/mxlrb.gc.log -XX:+PrintGCDetails -XX:+PrintGCTimeStamps"
fi
if [ "$OS_TYPE" = "AIX" ]; then
        MXMLC_JVM_ARGS="-Xms32M -Xmx2g -Djava.awt.headless=true -Dsun.rmi.dgc.client.gcInterval=3600000 -Dsun.rmi.dgc.server.gcInterval=3600000 -verbose:gc -Xverbosegclog:logs/mxmlc/mxmlc/mxmlc.gc.log"
        LRB_JVM_ARGS="-Xms32M -Xmx512m -Djava.awt.headless=true -Dsun.rmi.dgc.client.gcInterval=3600000 -Dsun.rmi.dgc.server.gcInterval=3600000 -verbose:gc -Xverbosegclog:logs/mxlrb/mxlrb/mxlrb.gc.log"
fi

# JVM settings for Session Management
if ([ "$OS_TYPE" = "SunOS" ] || [ "$OS_TYPE" = "Linux" ]); then
        SESSIONMGMT_SERVICE_JVM_ARGS="-server -Xms32M -Xmx2G -XX:MaxPermSize=256M -Djava.awt.headless=true -Dsun.rmi.dgc.client.gcInterval=60000 -Dsun.rmi.dgc.server.gcInterval=60000 -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:+UseParNewGC -verbose:gc -Xloggc:logs/mxmlc/mxmlc/mxmlc_session.gc.log -XX:+PrintGCDetails -XX:+PrintGCTimeStamps"
fi
if [ "$OS_TYPE" = "AIX" ]; then
        SESSIONMGMT_SERVICE_JVM_ARGS="-Xms32m -Xmx2g -Djava.awt.headless=true -Dsun.rmi.dgc.client.gcInterval=60000 -Dsun.rmi.dgc.server.gcInterval=60000 -verbosegc -Xverbosegclog:logs/mxmlc/mxmlc/mxmlc_session.gc.log"
fi

# Setting for Markit Credit Service
# MARKIT_CREDIT_JVM_ARGS="-Xms64M -Xmx512M"
# if ([ "$OS_TYPE" = "SunOS" ] || [ "$OS_TYPE" = "Linux" ]); then
#   MARKIT_CREDIT_JVM_ARGS="-server $MARKIT_CREDIT_JVM_ARGS"
# fi

# Setting for Markit Equity Service
# MARKIT_EQUITY_JVM_ARGS="-Xms64M -Xmx512M"
# if ([ "$OS_TYPE" = "SunOS" ] || [ "$OS_TYPE" = "Linux" ]); then
#   MARKIT_EQUITY_JVM_ARGS="-server $MARKIT_EQUITY_JVM_ARGS"
# fi

# Setting for Bloomberg Security Import Service
# SET BSIS_JVM_ARGS="-Xms64M -Xmx512M"
# if ([ "$OS_TYPE" = "SunOS" ] || [ "$OS_TYPE" = "Linux" ]); then
#   BSIS_JVM_ARGS="-server $BSIS_JVM_ARGS"
# fi

RTBS_JVM_ARGS="-Xmx1024M -Dsun.rmi.dgc.client.gcInterval=36000000 -Dsun.rmi.dgc.server.gcInterval=36000000"
