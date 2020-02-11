#!/bin/bash
export ETCDCTL_API=3

etcdctl snapshot --data-dir ./k1/tmp/etcd restore ./local.db \
  --name k1 \
  --initial-cluster k1=https://localhost:2381 \
  --initial-cluster-token new-etcd-cluster-1 \
  --initial-advertise-peer-urls https://localhost:2381 \

# etcdserver/membership: added member 11ff305b03a9845c 
# [https://localhost:2381] to cluster 2336210f54499314