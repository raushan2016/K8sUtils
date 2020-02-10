
`export ETCDCTL_API=3
 export ETCDCTLCMD="--endpoints localhost:2379,localhost:22379,localhost:32379 --cacert ./ca_certs/etcd-root-ca.pem --cert ./certs/s1/s1.pem --key ./certs/s1/s1-key.pem"`

`etcdctl ${ETCDCTLCMD} endpoint health -w table`


`curl https://discovery.etcd.io/new?size=3`
https://discovery.etcd.io/563d6cc963f30e7c83cf85ded1eb3988



docker run -it -p 8088:8080 --network="host" -v /home/raushank/go/src/github.com/raushan2016/K8sUtils/Local_ETCD/:/etc/kubernetes/pki/etcd/ -e CA_FILE=/etc/kubernetes/pki/etcd/ca_certs/etcd-root-ca.pem -e CERT_FILE=/etc/kubernetes/pki/etcd/certs/s1/s1.pem -e KEY_FILE=/etc/kubernetes/pki/etcd/certs/s1/s1-key.pem -e ENDPOINTS="https://127.0.0.1:2379" raushan2016/etcdexplore:latest


