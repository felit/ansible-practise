#!/usr/bin/env bash
# chkconfig: 2345 83 83
export PATH=$PATH:/opt/jdk1.7.0_45/bin
STORM_HOME=/opt/apache-storm-0.9.4
start() {
    echo "starting storm supervisor ..."
    su -l dev -c "$STORM_HOME/bin/storm supervisor > $STORM_HOME/supervisor.out &"
    echo "started storm supervisor"
}
stop(){
    echo "stopping storm supervisor ..."
    ps -ef | grep storm.daemon.supervisor | grep -v grep | awk '{print $2}' |xargs sudo kill -9 
    echo "stopped storm supervisor"
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
