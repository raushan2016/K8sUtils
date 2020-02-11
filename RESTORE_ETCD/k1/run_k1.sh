# make sure etcd process has write access to this directory
# remove this directory if the cluster is new; keep if restarting etcd
# rm -rf /tmp/etcd/k1
export ETCDCTL_API=3

etcd --name k1 \
  --data-dir ./k1/tmp/etcd \
  --listen-client-urls https://localhost:2378 \
  --advertise-client-urls https://localhost:2378 \
  --listen-peer-urls https://localhost:2381 \
  --initial-advertise-peer-urls https://localhost:2381 \
  --initial-cluster-token new-etcd-cluster-1 \
  --initial-cluster-state new \
  --client-cert-auth \
  --trusted-ca-file ./ca_certs/etcd-root-ca.pem \
  --cert-file ./certs/k1/k1.pem \
  --key-file ./certs/k1/k1-key.pem \
  --peer-client-cert-auth \
  --peer-trusted-ca-file ./ca_certs/etcd-root-ca.pem \
  --peer-cert-file ./certs/k1/k1.pem \
  --peer-key-file ./certs/k1/k1-key.pem \
  --initial-cluster k1=https://localhost:2381 \
 # -force-new-cluster
#  --discovery https://discovery.etcd.io/928a89fcb686f1b33affb840b617956e \

