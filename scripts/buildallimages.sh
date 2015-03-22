#!/bin/bash
export MYIP=$(ip a s dev eth0|sed -n 's/^ *inet \([0-9\.]\+\)\/.*$/\1/p')
DOCKERFILESDIR=../dockerfiles

for i in ${DOCKERFILESDIR}/*
do
    cd $i
    bash build.sh
    cd -
done
