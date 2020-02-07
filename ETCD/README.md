# K8sUtils





## ETCD Commands

### Backup
etcdctl --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/certs/ca.crt --cert=/etc/kubernetes/certs/etcdclient.crt --key=/etc/kubernetes/certs/etcdclient.key snapshot save /myawesomefileshare/clean_install.db

### Restore
`etcdctl --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/certs/ca.crt --cert=/etc/kubernetes/certs/etcdclient.crt --key=/etc/kubernetes/certs/etcdclient.key snapshot restore /myawesomefileshare/clean_install.db`

`chown -R etcd:etcd  /default.etcd`

`cp -rp /default.etcd/member/ /hostvar/lib/etcddisk`

 `reboot`

### Check logs
 `journalctl -u etcd.service `

 `sudo systemctl status etcd.service`

### ETCD health
 `etcdctl --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/etcdclient.crt --key=/etc/kubernetes/pki/etcd/etcdclient.key member list -w table`