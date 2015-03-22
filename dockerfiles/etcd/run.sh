#!/bin/bash
echo Start etcd
etcd -name=etcd -data-dir=/etcd -bind-addr=0.0.0.0:4001 -addr=${ETCD}:4001 -peer-addr=${ETCD}:7001
