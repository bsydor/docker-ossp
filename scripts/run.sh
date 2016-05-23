#!/bin/bash

echo Set host-specific variables
MYHOSTNAME=$(hostname)
MYIP=$(ip a s dev eth0|sed -n 's/^ *inet \([0-9\.]\+\)\/.*$/\1/p'|head -n1)
PROJECT=infra
FIGDIR=../figfiles

for f in ${FIGDIR}/*.yml
do 
    sed -i "s/dockerX/${MYHOSTNAME}/" $f
    sed -i "s/ETCD_IP_ADDR/${MYIP}/" $f
    sed -i "s/DB_IP_ADDR/${MYIP}/" $f
done

echo Start etcd, proxy, and mysql containers
for c in db etcd proxy
do
    docker-compose -p ${PROJECT} -f ${FIGDIR}/${c}.yml up -d
done

echo Set mysql credentials
docker exec  infra_db_1 mysql -e "grant all on *.* to 'root'@'%' identified by 'ossp.2015';"
docker exec  infra_db_1 mysql -e "create database wp;"
docker exec  infra_db_1 mysql -e "grant all on wp.* to 'wp'@'%' identified by 'ossp.2015';"
