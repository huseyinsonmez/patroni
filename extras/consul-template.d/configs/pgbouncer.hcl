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
  source = "/etc/consul-template.d/templates/pgbouncer.ctmpl"
  destination = "/etc/pgbouncer/pgbouncer.ini"
  command = "systemctl reload pgbouncer"
  # perms = 0644
  # backup = true
  wait {
    min = "2s"
    max = "10s"
  }
}
