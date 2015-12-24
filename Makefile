CONSUL_VERSION ?= *

base:
	docker build -t consul-rpm-builder-base - < Dockerfile.base

compile-all: base
	find */* -name "$(CONSUL_VERSION)" -type d | while read dname; do docker build --no-cache -t consul-rpm-builder/"$${dname/\//:}" $$dname ;done

all: compile-all
	mkdir -p tmp
	rm -vrf tpm/*.rpm
	find */* -name "$(CONSUL_VERSION)" -type d | while read dname; do docker run consul-rpm-builder/"$${dname/\//:}" > tmp/"$${dname/\//-}".x86_64.rpm ;done

test: compile-all
	find */* -name "$(CONSUL_VERSION)" -type d | while read dname; do ( docker run consul-rpm-builder/"$${dname/\//:}" rpm -qlip /var/tmp/consul*.rpm ) && echo OK ; done
