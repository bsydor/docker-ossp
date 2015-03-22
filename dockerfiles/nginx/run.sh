#!/bin/bash

# Fail hard and fast
set -eo pipefail

echo "[nginx] booting container. ETCD: $ETCD"

# Loop until confd has updated the nginx config
until confd -onetime -node ${ETCD}:4001 -config-file /etc/confd/conf.d/wp-nginx.toml; do
  echo "[nginx] waiting for confd to refresh nginx.conf"
  sleep 5
done

# Run confd in the background to watch the upstream servers
confd -interval 10 -node ${ETCD}:4001 -config-file /etc/confd/conf.d/wp-nginx.toml &
echo "[nginx] confd is listening for changes on etcd..."
nginx
