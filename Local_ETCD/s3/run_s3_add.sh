# make sure etcd process has write access to this directory
# remove this directory if the cluster is new; keep if restarting etcd
# rm -rf /tmp/etcd/s3
export ETCDCTL_API=3

export ETCD_NAME="s3"
export ETCD_INITIAL_CLUSTER="s1=https://localhost:2380,s3=https://localhost:32380,s2=https://localhost:22380"
export ETCD_INITIAL_ADVERTISE_PEER_URLS="https://localhost:32380"
export ETCD_INITIAL_CLUSTER_STATE="existing"

echo ${ETCD_NAME}

etcd --data-dir ./s3/tmp/etcd \
  --listen-client-urls https://localhost:32379 \
  --advertise-client-urls https://localhost:32379 \
  --listen-peer-urls https://localhost:32380 \
  --initial-advertise-peer-urls https://localhost:32380 \
  --initial-cluster-token tkn \
  --client-cert-auth \
  --trusted-ca-file ./ca_certs/etcd-root-ca.pem \
  --cert-file ./certs/s3/s3.pem \
  --key-file ./certs/s3/s3-key.pem \
  --peer-client-cert-auth \
  --peer-trusted-ca-file ./ca_certs/etcd-root-ca.pem \
  --peer-cert-file ./certs/s3/s3.pem \
  --peer-key-file ./certs/s3/s3-key.pem \
#  --initial-cluster s1=https://localhost:2380,s2=https://localhost:22380,s3=https://localhost:32380 \


