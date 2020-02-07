#!/bin/bash

echo ${ETCD_DATADIR}
echo ${SNAPSHOT_PATH}
echo ${CERT_PATH}
echo "Starting snapshot restore" 
etcdctl --endpoints=https://127.0.0.1:2379 --cacert=${CERT_PATH}/ca.crt --cert=${CERT_PATH}/etcdclient.crt --key=${CERT_PATH}/etcdclient.key snapshot restore ${SNAPSHOT_PATH}

echo "Restore permission to the db"
chown -R etcd:etcd default.etcd

echo "Copy db files from snapshot to etcd datadir"
cp -rp default.etcd/member/ ${ETCD_DATADIR}

echo "Restart master node"
reboot