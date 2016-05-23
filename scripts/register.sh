#!/bin/bash
export MYIP=$(ip a s dev eth0|sed -n 's/^ *inet \([0-9\.]\+\)\/.*$/\1/p'|head -n1)
FIGDIR=../figfiles

# UPSTREAM=($(docker-compose -p app -f ${FIGDIR}/wp.yml ps|tail -n+3|awk '{ print $NF}'| sed -n "s/^0\.0\.0\.0\:\([0-9]\+\)-.\+$/${MYIP}:\1/p"))
REQUPSTREAM=($(docker-compose -p app -f ${FIGDIR}/wp.yml ps|tail -n+3| perl -ne '/^(app_wp_\d+) \s+ \S+ \s+ Up \s+ 0\.0\.0\.0\:(\d+)-.+$/ && print $1, ":", $ENV{MYIP},":", $2, "\n"'))
CURUPSTREAM=($(etcdctl ls /upstream))

for i in ${REQUPSTREAM[@]}
do
    k=$(echo $i|cut -d: -f1)
    v=$(echo $i|cut -d: -f2-)
    echo etcdctl set --ttl 15 /upstream/${k} ${v}
    etcdctl set --ttl 15 /upstream/${k} ${v}
done
