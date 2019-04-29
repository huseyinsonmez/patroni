consul {
  # token = "<CONSUL-ACL-SECRETID>"
  address = "127.0.0.1:8500"
  retry {
    enabled = true
    attempts = 0
    backoff = "250ms"
  }
}

template {
  source = "/etc/consul-template.d/templates/haproxy.ctmpl"
  destination = "/etc/haproxy/haproxy.cfg"
  command = "haproxy -f /etc/haproxy/haproxy.cfg -p /var/run/haproxy.pid -D -sf $(cat /var/run/haproxy.pid)"
  # perms = 0644
  # backup = true
  wait {
    min = "2s"
    max = "10s"
  }
}
