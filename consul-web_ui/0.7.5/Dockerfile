FROM consul-rpm-builder-base:latest

ENV CONSUL_VERSION 0.7.5
ENV RPM_EPOCH 1

RUN mkdir -p /rootfs/var/consul/web_ui
RUN curl -L https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_web_ui.zip > /usr/local/src/consul-${CONSUL_VERSION}_web_ui.zip
ADD postinst.rpm /usr/local/bin/postinst.sh

WORKDIR /usr/local/src
RUN unzip -o -u consul-${CONSUL_VERSION}_web_ui.zip && mv index.html static /rootfs/var/consul/web_ui

WORKDIR /

RUN fpm -s dir -t rpm -n consul-web_ui -v ${CONSUL_VERSION} -p /var/tmp/consul-web_ui.rpm \
    --rpm-compression bzip2 --rpm-os linux \
    --force \
    --iteration $(date +%Y%m%d) \
    --after-install /usr/local/bin/postinst.sh \
    --epoch $RPM_EPOCH \
    --url https://www.consul.io/ \
    --description "Consul Web UI - Consul is a tool for service discovery and configuration. Consul is distributed, highly available, and extremely scalable." \
    --maintainer "Uchio KONDO <udzura@udzura.jp>" \
    --license "MPLv2.0" \
    --vendor "hashicorp" -a amd64 \
    /rootfs/=/

CMD ["/usr/bin/cat", "/var/tmp/consul-web_ui.rpm"]
