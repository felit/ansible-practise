#!/usr/bin/env bash
# chkconfig: 2345 82 82
export PATH=$PATH:/opt/jdk1.7.0_45/bin
STORM_HOME=/opt/apache-storm-0.9.4
# START_SCRIPT=$/bin/nimbus
start() {
    echo "starting storm nimbus ..."
    su -l dev -c "$STORM_HOME/bin/storm nimbus > $STORM_HOME/nimbus.out &"
    echo "started storm"
}
stop(){
    echo "stopping storm ..."
    ps -ef | grep storm.daemon.nimbus | grep -v grep | awk '{print $2}' |xargs sudo kill -9 
    echo "stopped storm"
}
restart(){
   stop
   start
}

case "$1" in
start)
    start
    ;;
status)
    pid=`ps -ef | grep storm.ui.core | grep -v grep | awk '{print $2}'`
    if [ -n "$pid" ]
        then
           echo "storm-nimbus (pid  $pid) is running..."
        else
           echo "storm-nimbus is stopped"
    fi
    
    ;;
stop)
    stop
    ;;
restart)
    restart
    ;;
*)
    echo $"Usage $0 {start|status|stop|restart}"
        exit 2
esac