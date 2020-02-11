8# make sure etcd process has write access to this directory
# remove this directory if the cluster is new; keep if restarting etcd
# rm -rf /tmp/etcd/k2
export ETCDCTL_API=3

export ETCD_NAME="k2"
export ETCD_INITIAL_CLUSTER="k1=https://localhost:2381,k2=https://localhost:22381"
export ETCD_INITIAL_ADVERTISE_PEER_URLS="https://localhost:22381"
export ETCD_INITIAL_CLUSTER_STATE="existing"

etcd --data-dir ./k2/tmp/etcd \
  --listen-client-urls https://localhost:22378 \
  --advertise-client-urls https://localhost:22378 \
  --listen-peer-urls https://localhost:22381 \
  --initial-advertise-peer-urls https://localhost:22381 \
  --initial-cluster-token tkn \
  --client-cert-auth \
  --trusted-ca-file ./ca_certs/etcd-root-ca.pem \
  --cert-file ./certs/k2/k2.pem \
  --key-file ./certs/k2/k2-key.pem \
  --peer-client-cert-auth \
  --peer-trusted-ca-file ./ca_certs/etcd-root-ca.pem \
  --peer-cert-file ./certs/k2/k2.pem \
  --peer-key-file ./certs/k2/k2-key.pem

