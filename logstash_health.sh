#!/bin/sh
export IP_PRIVATE=$(ip addr show eth0 | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}')
nc -z $IP_PRIVATE 5000 &> /dev/null
exit $?