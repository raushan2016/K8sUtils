# make sure etcd process has write access to this directory
# remove this directory if the cluster is new; keep if restarting etcd
# rm -rf /tmp/etcd/s4
export ETCDCTL_API=3

etcd --name s4 --data-dir ./s4/tmp/etcd \
  --listen-client-urls https://localhost:32379 \
  --advertise-client-urls https://localhost:32379 \
  --listen-peer-urls https://localhost:32380 \
  --initial-advertise-peer-urls https://localhost:32380 \
	--initial-cluster-state existing \
  --initial-cluster-token tkn \
  --client-cert-auth \
  --trusted-ca-file ./ca_certs/etcd-root-ca.pem \
  --cert-file ./certs/s4/s4.pem \
  --key-file ./certs/s4/s4-key.pem \
  --peer-client-cert-auth \
  --peer-trusted-ca-file ./ca_certs/etcd-root-ca.pem \
  --peer-cert-file ./certs/s4/s4.pem \
  --peer-key-file ./certs/s4/s4-key.pem \
  --initial-cluster s1=https://localhost:2380,s2=https://localhost:22380,s4=https://localhost:32380 \


