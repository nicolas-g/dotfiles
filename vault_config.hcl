ui = true

listener "tcp" {
  address = "127.0.0.1:8200"
  tls_disable = 1
}

storage "file" {
  path = "/Users/{{ user }}/Dropbox/hv.db"
}

#telemetry {
# statsite_address = "127.0.0.1:8125"
# disable_hostname = true
#}
