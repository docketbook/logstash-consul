#!/bin/sh
healthCheck() {
	export IP_PRIVATE=$(ip addr show eth0 | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}')
	nc -z $IP_PRIVATE 5000 &> /dev/null
	exit $?
}

preStart() {
	consul-template \
        -once \
        -dedup \
        -consul ${CONSUL_ADDRESS}:8500 \
        -template "/usr/logstash/logstash.conf.ctmpl:/usr/logstash/logstash.conf"
}

until
    cmd=$1
    shift 1
    $cmd "$@"
    [ "$?" -ne 127 ]
do
    exit
done