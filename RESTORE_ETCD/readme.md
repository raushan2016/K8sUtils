
#### Restore from snapshot in case of entire cluster failure.
https://blog.containership.io/etcd/  
https://github.com/etcd-io/etcd/blob/master/Documentation/op-guide/recovery.md  
1. We will restore the snapshot to create the state of a new cluster with only one node.

    `./restore.sh`

2. Start the etcd pointing to the data-dir in the first step.

     `./k1/run_k1.sh`
3. Add new members to the cluster.

    1.    `etcdctl ${ETCDCTLCMD} member add K2 --peer-urls=https://localhost:22381`
    ETCD_NAME="K2"  
    ETCD_INITIAL_CLUSTER="k1=https://localhost:2381,K2=https://localhost:22381"  
    ETCD_INITIAL_ADVERTISE_PEER_URLS="https://localhost:22381"  
    ETCD_INITIAL_CLUSTER_STATE="existing"  
    Set the environment variables from output and start etcd on k2  
    `./k2/run_k2.sh`

    2. `etcdctl ${ETCDCTLCMD} member add K3 --peer-urls=https://localhost:32381`
ETCD_NAME="K3"
ETCD_INITIAL_CLUSTER="k1=https://localhost:2381,K3=https://localhost:32381,k2=https://localhost:22381"
ETCD_INITIAL_ADVERTISE_PEER_URLS="https://localhost:32381"
ETCD_INITIAL_CLUSTER_STATE="existing"  
        Set the environment variables from output and start etcd on k3

        `./k3/run_k3.sh`


#### Running lucas
`docker run -it -p 8088:8080 --network="host" -v /home/raushank/go/src/github.com/raushan2016/K8sUtils/RESTORE_ETCD/:/etc/kubernetes/pki/etcd/ -e CA_FILE=/etc/kubernetes/pki/etcd/ca_certs/etcd-root-ca.pem -e CERT_FILE=/etc/kubernetes/pki/etcd/certs/k1/k1.pem -e KEY_FILE=/etc/kubernetes/pki/etcd/certs/k1/k1-key.pem -e ENDPOINTS="https://127.0.0.1:2378" raushan2016/etcdexplore:latest`


