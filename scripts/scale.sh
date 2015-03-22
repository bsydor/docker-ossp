#!/bin/bash
MYIP=$(ip a s dev eth0|sed -n 's/^ *inet \([0-9\.]\+\)\/.*$/\1/p')
FIGDIR=../figfiles

fig -p app -f ${FIGDIR}/wp.yml scale wp=$1
