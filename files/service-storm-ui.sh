#!/usr/bin/env bash
# chkconfig: 2345 81 81
export PATH=$PATH:/opt/jdk1.7.0_45/bin
STORM_HOME=/opt/apache-storm-0.9.4
start() {
    echo "starting storm ui ..."
    su -l dev -c "$STORM_HOME/bin/storm ui > $STORM_HOME/ui.out &"
    echo "started storm ui"
}
stop(){
    echo "stopping storm ui ..."
    ps -ef | grep storm.ui.core | grep -v grep | awk '{print $2}' |xargs sudo kill -9 
    echo "stopped storm ui"
}
restart(){
   stop
   start
}

status(){
   echo "unimplement..."
}
case "$1" in
start)
    start
    ;;
stop)
    stop
    ;;
restart)
    restart
    ;;
*)
    echo $"Usage $0 {start|stop|restart}"
	exit 2
esac
