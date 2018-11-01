# consul-rpm-builder

## How to build

```bash
# create base image
$ make base

# please choose version
$ docker build --no-cache -t consul-rpm-builder/consul:1.2.0 consul/1.2.0
$ docker run consul-rpm-builder/consul:1.2.0 > tmp/consul-1.2.0.x86_64.rpm
```

* Installs no service (use supervisord or else according to your purpose)

### Just check files

```bash
$ docker run consul-rpm-builder/consul:1.2.0 rpm -qlp /var/tmp/consul.rpm
/etc/consul.d
/etc/consul.json
/usr/bin/consul
/var/consul/data
```

### Just try install

```bash
$ docker run consul-rpm-builder/consul:1.2.0 /bin/bash -c 'yum -y install /var/tmp/consul.rpm && consul version'
```

### Available components and versions

- consul:0.4.1
- consul:0.5.0
- consul:0.6.0
- consul:0.6.4
- consul:0.7.1
- consul:0.7.4
- consul:0.7.5
- consul:0.8.0
- consul:0.8.1
- consul:0.8.2
- consul:0.8.3
- consul:0.8.4
- consul:1.2.0
- consul:1.3.0
- consul-web_ui:0.4.1
- consul-web_ui:0.5.0
- consul-web_ui:0.6.0
- consul-web_ui:0.6.4
- consul-web_ui:0.7.1
- consul-web_ui:0.7.4
- consul-web_ui:0.7.5
- consul-web_ui:0.8.0
- consul-web_ui:0.8.1
- consul-web_ui:0.8.2
- consul-web_ui:0.8.3
- consul-web_ui:0.8.4
