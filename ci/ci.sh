#!/bin/bash
make base
docker build --no-cache -t consul-rpm-builder/consul:0.8.4 consul/0.8.4
docker run consul-rpm-builder/consul:0.8.4 > tmp/consul-0.8.4.x86_64.rpm
