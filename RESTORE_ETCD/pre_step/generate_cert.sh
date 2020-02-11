
DIR=k1
CAPATH=./ca_certs
CPATH=./certs/${DIR}
mkdir -p ${CPATH}

cat > ${CPATH}/k1-ca-csr.json <<EOF
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
  "CN": "k1",
  "hosts": [
    "127.0.0.1",
    "localhost"
  ]
}
EOF
cfssl gencert \
  --ca ${CAPATH}/etcd-root-ca.pem \
  --ca-key ${CAPATH}/etcd-root-ca-key.pem \
  --config ${CAPATH}/etcd-gencert.json \
  ${CPATH}/k1-ca-csr.json | cfssljson --bare ${CPATH}/k1

# verify
openssl x509 -in ${CPATH}/k1.pem -text -noout



DIR=k2
CAPATH=./ca_certs
CPATH=./certs/${DIR}
mkdir -p ${CPATH}

cat > ${CPATH}/k2-ca-csr.json <<EOF
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
  "CN": "k2",
  "hosts": [
    "127.0.0.1",
    "localhost"
  ]
}
EOF
cfssl gencert \
  --ca ${CAPATH}/etcd-root-ca.pem \
  --ca-key ${CAPATH}/etcd-root-ca-key.pem \
  --config ${CAPATH}/etcd-gencert.json \
  ${CPATH}/k2-ca-csr.json | cfssljson --bare ${CPATH}/k2

# verify
openssl x509 -in ${CPATH}/k2.pem -text -noout



DIR=k3
CAPATH=./ca_certs
CPATH=./certs/${DIR}
mkdir -p ${CPATH}

cat > ${CPATH}/k3-ca-csr.json <<EOF
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
  "CN": "k3",
  "hosts": [
    "127.0.0.1",
    "localhost"
  ]
}
EOF
cfssl gencert \
  --ca ${CAPATH}/etcd-root-ca.pem \
  --ca-key ${CAPATH}/etcd-root-ca-key.pem \
  --config ${CAPATH}/etcd-gencert.json \
  ${CPATH}/k3-ca-csr.json | cfssljson --bare ${CPATH}/k3

# verify
openssl x509 -in ${CPATH}/k3.pem -text -noout

DIR=k4
CAPATH=./ca_certs
CPATH=./certs/${DIR}
mkdir -p ${CPATH}

cat > ${CPATH}/k4-ca-csr.json <<EOF
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
  "CN": "k4",
  "hosts": [
    "127.0.0.1",
    "localhost"
  ]
}
EOF
cfssl gencert \
  --ca ${CAPATH}/etcd-root-ca.pem \
  --ca-key ${CAPATH}/etcd-root-ca-key.pem \
  --config ${CAPATH}/etcd-gencert.json \
  ${CPATH}/k4-ca-csr.json | cfssljson --bare ${CPATH}/k4

# verify
openssl x509 -in ${CPATH}/k4.pem -text -noout