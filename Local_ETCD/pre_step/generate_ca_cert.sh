
cat > ./certs/etcd-root-ca-csr.json <<EOF
{
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "O": "etcd",
      "OU": "etcd Security",
      "L": "San Francisco",
      "ST": "California",
      "C": "USA"
    }
  ],
  "CN": "etcd-root-ca"
}
EOF
cfssl gencert --initca=true ./certs/etcd-root-ca-csr.json | cfssljson --bare ./certs/etcd-root-ca

# verify
openssl x509 -in ./certs/etcd-root-ca.pem -text -noout


# cert-generation configuration
cat > ./certs/etcd-gencert.json <<EOF
{
  "signing": {
    "default": {
        "usages": [
          "signing",
          "key encipherment",
          "server auth",
          "client auth"
        ],
        "expiry": "87600h"
    }
  }
}
EOF
