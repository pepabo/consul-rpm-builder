FROM centos:7

ENV CONSUL_VERSION 0.4.1
ENV RPM_EPOCH 1
RUN yum -y update
RUN yum -y install curl git unzip \
    ruby rubygem-bundler ruby-devel \
    gcc make rpm-build
RUN gem install fpm --no-rdoc --no-ri

RUN mkdir -p /rootfs/var/consul/web_ui
RUN curl -L http://dl.bintray.com/mitchellh/consul/${CONSUL_VERSION}_web_ui.zip > /usr/local/src/consul-${CONSUL_VERSION}_web_ui.zip

WORKDIR /usr/local/src
RUN unzip -o -u consul-${CONSUL_VERSION}_web_ui.zip && mv dist/* /rootfs/var/consul/web_ui

WORKDIR /

RUN fpm -s dir -t rpm -n consul-web_ui -v ${CONSUL_VERSION} -p /var/tmp/consul-web_ui.rpm \
    --rpm-compression bzip2 --rpm-os linux \
    --force \
    --iteration $(date +%s) \
    --epoch $RPM_EPOCH \
    --url https://www.consul.io/ \
    --description "Consul Web UI - Consul is a tool for service discovery and configuration. Consul is distributed, highly available, and extremely scalable." \
    --maintainer "Uchio KONDO <udzura@udzura.jp>" \
    --license "MPLv2.0" \
    --vendor "hashicorp" -a amd64 \
    /rootfs/=/

CMD ["/usr/bin/cat", "/var/tmp/consul-web_ui.rpm"]
