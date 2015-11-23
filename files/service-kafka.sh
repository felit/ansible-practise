#!/usr/bin/env bash
# chkconfig: 2345 60 60
# description: kafka daemon.
KAFKA_HOME=/opt/kafka_2.11-0.8.2.1
START_SCRIPT=$KAFKA_HOME/bin/kafka-server-start.sh
# echo "$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties > $KAFKA_HOME/nohup.out"
start() {
    echo "starting kafka ..."
    su -l dev -c "$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties > $KAFKA_HOME/kafka.out &"
    echo "started kafka"
}
stop(){
    echo "stop kafka ..."
    ps -ef | grep kafka | grep -v grep | awk '{print $2}' | xargs sudo kill -9
    # $KAFKA_HOME/bin/kafka-server-stop.sh
    echo "stopped kafka"
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
