
### Use Discovery URL 
https://github.com/etcd-io/etcd/blob/master/Documentation/dev-internal/discovery_protocol.md

##### Create cluster size discovery url 
`curl https://discovery.etcd.io/new?size=3`
https://discovery.etcd.io/928a89fcb686f1b33affb840b617956e

##### Run your own discovery 
https://www.cybertec-postgresql.com/en/introduction-and-how-to-etcd-clusters-for-patroni/

Run a ETCD which acts as discovery and is accessible from all nodes
bash # etcd --name bootstrapper --listen-client-urls=http://0.0.0.0:2379 --advertise-client-urls=http://0.0.0.0:2379

bash # UUID=$(uuidgen)

bash # echo $UUID

860a192e-59ae-4a1a-a73c-8fee7fe403f9

bash # curl -X PUT http://10.88.0.1:2379/v2/keys/_etcd/registry/${UUID}/_config/size -d value=3

discovery: 'http://10.88.0.1:2379/v2/keys/_etcd/registry/860a192e-59ae-4a1a-a73c-8fee7fe403f9/'

Check discovery

curl http://10.88.0.1:2379/v2/keys/_etcd/registry/860a192e-59ae-4a1a-a73c-8fee7fe403f9/

#### Certificates
Generate certificates for each node using the same ca authority.
Make sure the "CN" has the cluster-id which will be used to start etcd
Make sure the "hosts" has the dns or IP address listed.

Run the startup script in each cluster

Validate cluster is healthy

`export ETCDCTL_API=3
 export ETCDCTLCMD="--endpoints localhost:2379,localhost:22379,localhost:32379 --cacert ./ca_certs/etcd-root-ca.pem --cert ./certs/s1/s1.pem --key ./certs/s1/s1-key.pem"`

`etcdctl ${ETCDCTLCMD} endpoint health -w table`

#### Add remove cluster
 https://github.com/etcd-io/etcd/blob/master/Documentation/demo.md#member

 https://github.com/etcd-io/etcd/blob/master/Documentation/op-guide/runtime-configuration.md#remove-a-member

`etcdctl ${ETCDCTLCMD} endpoint status -w table`

`etcdctl ${ETCDCTLCMD} member remove 19067bb071877edf`

Add the new member
`etcdctl ${ETCDCTLCMD} member add s4 --peer-urls=https://localhost:32380`

Set the environment variables from output and start etcd on s4


#### Take a backup
`etcdctl ${ETCDCTLCMD} snapshot save local.db`

`etcdstatus`

`etcdctl ${ETCDCTLCMD} member remove 19067bb071877edf`

`etcdctl ${ETCDCTLCMD} member add s4 --peer-urls=https://localhost:32380`


#### Running lucas
`docker run -it -p 8088:8080 --network="host" -v /home/raushank/go/src/github.com/raushan2016/K8sUtils/Local_ETCD/:/etc/kubernetes/pki/etcd/ -e CA_FILE=/etc/kubernetes/pki/etcd/ca_certs/etcd-root-ca.pem -e CERT_FILE=/etc/kubernetes/pki/etcd/certs/s1/s1.pem -e KEY_FILE=/etc/kubernetes/pki/etcd/certs/s1/s1-key.pem -e ENDPOINTS="https://127.0.0.1:2379" raushan2016/etcdexplore:latest`


