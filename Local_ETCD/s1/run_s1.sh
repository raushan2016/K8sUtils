# make sure etcd process has write access to this directory
# remove this directory if the cluster is new; keep if restarting etcd
# rm -rf /tmp/etcd/s1
export ETCDCTL_API=3

etcd --name s1 \
  --data-dir ./s1/tmp/etcd \
  --listen-client-urls https://localhost:2379 \
  --advertise-client-urls https://localhost:2379 \
  --listen-peer-urls https://localhost:2380 \
  --initial-advertise-peer-urls https://localhost:2380 \
  --discovery https://discovery.etcd.io/928a89fcb686f1b33affb840b617956e \
  --initial-cluster-token tkn \
  --initial-cluster-state new \
  --client-cert-auth \
  --trusted-ca-file ./ca_certs/etcd-root-ca.pem \
  --cert-file ./certs/s1/s1.pem \
  --key-file ./certs/s1/s1-key.pem \
  --peer-client-cert-auth \
  --peer-trusted-ca-file ./ca_certs/etcd-root-ca.pem \
  --peer-cert-file ./certs/s1/s1.pem \
  --peer-key-file ./certs/s1/s1-key.pem \
#  --initial-cluster s1=https://localhost:2380 \
 # -force-new-cluster


