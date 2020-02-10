ETCDCTL_API=3 etcdctl snapshot restore etcd-snapshot-golden.db \
  --name s1 \
  --initial-cluster s1=https://localhost:2380 \
  --initial-cluster-token tkn \
  --initial-advertise-peer-urls https://localhost:2380

ETCDCTL_API=3 etcdctl snapshot restore etcd-snapshot-golden.db \
  --name s2 \
  --initial-cluster s1=https://localhost:2380,s2=https://localhost:22380 \
  --initial-cluster-token tkn \
  --initial-advertise-peer-urls https://localhost:22380

ETCDCTL_API=3 etcdctl snapshot restore etcd-snapshot-golden.db \
  --name s3 \
  --initial-cluster s1=https://localhost:2380,s2=https://localhost:22380,s3=https://localhost:32380 \
  --initial-cluster-token tkn \
  --initial-advertise-peer-urls https://localhost:32380