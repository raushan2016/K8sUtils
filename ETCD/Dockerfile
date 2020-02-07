FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
    && rm -rf /var/lib/apt/lists/* \
    && curl -L https://github.com/etcd-io/etcd/releases/download/v3.1.12/etcd-v3.1.12-linux-amd64.tar.gz -o /tmp/etcd-v3.1.12-linux-amd64.tar.gz \
    && mkdir -p /usr/share/etcd \
    && tar xzvf /tmp/etcd-v3.1.12-linux-amd64.tar.gz -C /usr/share/etcd --strip-components=1 \
    && rm /tmp/etcd-v3.1.12-linux-amd64.tar.gz \
    && ln -s /usr/share/etcd/etcdctl /usr/bin/etcdctl

WORKDIR /app
COPY ./scripts /app/

ENTRYPOINT [ "/app/restore.sh"]