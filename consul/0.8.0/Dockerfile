FROM consul-rpm-builder-base:latest

ENV CONSUL_VERSION 0.8.0
ENV RPM_EPOCH 1

RUN mkdir -p /rootfs/var/consul/data \
    /rootfs/etc/consul.d \
    /rootfs/usr/bin
ADD default.json /rootfs/etc/consul.json
ADD postinst.rpm /usr/local/bin/postinst.sh

RUN curl -L https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip > /usr/local/src/consul-${CONSUL_VERSION}_linux_amd64.zip
RUN unzip -o -u /usr/local/src/consul-${CONSUL_VERSION}_linux_amd64.zip -d /rootfs/usr/bin

RUN fpm -s dir -t rpm -n consul -v ${CONSUL_VERSION} -p /var/tmp/consul.rpm \
    --rpm-compression bzip2 --rpm-os linux \
    --force \
    --iteration $(date +%Y%m%d) \
    --after-install /usr/local/bin/postinst.sh \
    --epoch $RPM_EPOCH \
    --url https://www.consul.io/ \
    --description "Consul is a tool for service discovery and configuration. Consul is distributed, highly available, and extremely scalable." \
    --maintainer "Uchio KONDO <udzura@udzura.jp>" \
    --license "MPLv2.0" \
    --vendor "hashicorp" -a amd64 \
    --config-files /etc/consul.json \
    /rootfs/=/

CMD ["/usr/bin/cat", "/var/tmp/consul.rpm"]
