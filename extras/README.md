### confd

`confd` directory contains HAProxy and pgBouncer template files for the [confd](https://github.com/kelseyhightower/confd) -- lightweight configuration management tool
You need to copy content of `confd` directory into /etcd/confd and run confd service:
```bash
$ confd -prefix=/service/$PATRONI_SCOPE -backend etcd -node $PATRONI_ETCD_URL -interval=10
```
It will periodically update haproxy.cfg and pgbouncer.ini with the actual list of Patroni nodes from `etcd` and "reload" haproxy and pgbouncer.ini when it is necessary.


### startup-scripts

`startup-scripts` directory contains startup scripts for various OSes and management tools for Patroni.


### consul-template

`consul-template.d` directory contains HAProxy and pgBouncer template files for the [consul-template](https://github.com/hashicorp/consul-template) -- lightweight configuration management tool
You need to copy content of `consul-template.d` directory into /etc/ and run haproxy-ctmpl.service or pgbouncer-ctmpl.service or both.

For HAProxy:
```bash
$ consul-template -config=/etc/consul-template.d/configs/haproxy.hcl
```

With systemd service:
```bash
$ systemctl enable --now haproxy-ctmpl.service
```

For pgBouncer:
```bash
$ consul-template -config=/etc/consul-template.d/configs/pgbouncer.hcl
```
It will periodically update haproxy.cfg and pgbouncer.ini with the actual list of Patroni nodes from `consul` and "reload" HAProxy and pgBouncer when it is necessary.

With systemd service:
```bash
$ systemctl enable --now pgbouncer-ctmpl.service
```
