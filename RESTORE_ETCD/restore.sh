#!/bin/bash
export ETCDCTL_API=3

etcdctl snapshot --data-dir ./k1/tmp/etcd restore ./local.db \
  --name k1 \
  --initial-cluster nodename=https://localhost:2381 \
  --initial-cluster-token new-etcd-cluster-1 \
  --initial-advertise-peer-urls https://localhost:2381 \
  --force-new-cluster
# Error: couldn't find local name "k1" in the initial cluster configuration