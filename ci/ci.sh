#!/bin/bash

VERSION=0.8.4

make base
docker build --no-cache -t consul-rpm-builder/consul:${VERSION} consul/${VERSION}
docker run consul-rpm-builder/consul:${VERSION} > consul-${VERSION}.x86_64.rpm
