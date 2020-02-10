
DIR=s1
CAPATH=./ca_certs
CPATH=./certs/${DIR}
mkdir -p ${CPATH}

cat > ${CPATH}/s1-ca-csr.json <<EOF
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
  "CN": "s1",
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
  ${CPATH}/s1-ca-csr.json | cfssljson --bare ${CPATH}/s1

# verify
openssl x509 -in ${CPATH}/s1.pem -text -noout



DIR=s2
CAPATH=./ca_certs
CPATH=./certs/${DIR}
mkdir -p ${CPATH}

cat > ${CPATH}/s2-ca-csr.json <<EOF
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
  "CN": "s2",
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
  ${CPATH}/s2-ca-csr.json | cfssljson --bare ${CPATH}/s2

# verify
openssl x509 -in ${CPATH}/s2.pem -text -noout



DIR=s3
CAPATH=./ca_certs
CPATH=./certs/${DIR}
mkdir -p ${CPATH}

cat > ${CPATH}/s3-ca-csr.json <<EOF
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
  "CN": "s3",
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
  ${CPATH}/s3-ca-csr.json | cfssljson --bare ${CPATH}/s3

# verify
openssl x509 -in ${CPATH}/s3.pem -text -noout