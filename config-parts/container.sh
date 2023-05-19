#!/bin/vbash

# Container networks
set container network containers prefix '10.5.0.0/24'

# cloudflare-ddns
set container name cloudflare-ddns allow-host-networks
set container name cloudflare-ddns environment CF_API_TOKEN value "${SECRET_CLOUDFLARE_DYNDNS_TOKEN}"
set container name cloudflare-ddns environment DOMAINS value 'ipv4.greyrock.io'
set container name cloudflare-ddns environment IP6_PROVIDER value "none"
set container name cloudflare-ddns environment TZ value 'America/New_York'
set container name cloudflare-ddns environment PGID value "1000"
set container name cloudflare-ddns environment PUID value "1000"
set container name cloudflare-ddns image 'docker.io/favonia/cloudflare-ddns:1.9.2'
set container name cloudflare-ddns memory '0'
set container name cloudflare-ddns restart 'on-failure'
set container name cloudflare-ddns shared-memory '0'

# bind
set container name bind cap-add 'net-bind-service'
set container name bind image 'docker.io/internetsystemsconsortium/bind9:9.19'
set container name bind command '/usr/sbin/named -4 -f -c /etc/bind/named.conf -u bind'
set container name bind memory '0'
set container name bind network containers address '10.5.0.3'
set container name bind restart 'on-failure'
set container name bind shared-memory '0'
set container name bind volume config destination '/etc/bind'
set container name bind volume config source '/config/containers/bind/config'
set container name bind volume config mode 'ro'
set container name bind volume cache source '/tmp/bind/cache'
set container name bind volume cache destination '/var/cache/bind'
set container name bind volume cache mode 'rw'

# dnsdist
# set container name dnsdist cap-add 'net-bind-service'
# set container name dnsdist environment TZ value 'America/New_York'
# set container name dnsdist image 'docker.io/powerdns/dnsdist-18:1.8.0'
# set container name dnsdist arguments '--log-timestamps'
# set container name dnsdist memory '0'
# set container name dnsdist network containers address '10.5.0.4'
# set container name dnsdist restart 'on-failure'
# set container name dnsdist shared-memory '0'
# set container name dnsdist volume config source '/config/containers/dnsdist/config/dnsdist.conf'
# set container name dnsdist volume config destination '/etc/dnsdist/dnsdist.conf'
# set container name dnsdist volume config mode 'ro'

# ctrld
set container name ctrld cap-add 'net-bind-service'
set container name ctrld environment TZ value 'America/New_York'
set container name ctrld image 'ghcr.io/doonga/ctrld:1.2.0'
set container name ctrld memory '512'
set container name ctrld network containers address '10.5.0.4'
set container name ctrld restart 'on-failure'
set container name ctrld shared-memory '0'
set container name ctrld volume config destination '/config/ctrld.toml'
set container name ctrld volume config source '/config/containers/ctrld/config/ctrld.toml'
set container name ctrld volume config mode 'ro'
set container name ctrld volume logs destination '/dev/log'
set container name ctrld volume logs source '/dev/log'

# haproxy-k8s-api
set container name haproxy-k8s-api image 'docker.io/library/haproxy:2.7.8'
set container name haproxy-k8s-api memory '0'
set container name haproxy-k8s-api network containers address '10.5.0.2'
set container name haproxy-k8s-api restart 'on-failure'
set container name haproxy-k8s-api shared-memory '0'
set container name haproxy-k8s-api volume config source '/config/containers/haproxy/config/haproxy.cfg'
set container name haproxy-k8s-api volume config destination '/usr/local/etc/haproxy/haproxy.cfg'
set container name haproxy-k8s-api volume config mode 'ro'

# node-exporter
set container name node-exporter environment procfs value '/host/proc'
set container name node-exporter environment rootfs value '/host/rootfs'
set container name node-exporter environment sysfs value '/host/sys'
set container name node-exporter image 'quay.io/prometheus/node-exporter:v1.5.0'
set container name node-exporter memory '0'
set container name node-exporter allow-host-networks
set container name node-exporter restart 'on-failure'
set container name node-exporter shared-memory '0'
set container name node-exporter volume procfs destination '/host/proc'
set container name node-exporter volume procfs mode 'ro'
set container name node-exporter volume procfs source '/proc'
set container name node-exporter volume rootfs destination '/host/rootfs'
set container name node-exporter volume rootfs mode 'ro'
set container name node-exporter volume rootfs source '/'
set container name node-exporter volume sysfs destination '/host/sys'
set container name node-exporter volume sysfs mode 'ro'
set container name node-exporter volume sysfs source '/sys'

# speedtest-exporter
set container name speedtest-exporter image 'ghcr.io/miguelndecarvalho/speedtest-exporter:v3.5.3'
set container name speedtest-exporter memory '0'
set container name speedtest-exporter allow-host-networks
set container name speedtest-exporter restart 'on-failure'
set container name speedtest-exporter shared-memory '0'

# udp-broadcast-relay-mdns
set container name udp-broadcast-relay-mdns allow-host-networks
set container name udp-broadcast-relay-mdns cap-add 'net-raw'
set container name udp-broadcast-relay-mdns environment CFG_DEV value 'eth2.10;eth2.20;eth2.40'
set container name udp-broadcast-relay-mdns environment CFG_ID value '2'
set container name udp-broadcast-relay-mdns environment CFG_MULTICAST value '224.0.0.251'
set container name udp-broadcast-relay-mdns environment CFG_PORT value '5353'
set container name udp-broadcast-relay-mdns environment SEPARATOR value ';'
set container name udp-broadcast-relay-mdns image 'ghcr.io/onedr0p/udp-broadcast-relay-redux:1.0.27'
set container name udp-broadcast-relay-mdns memory '0'
set container name udp-broadcast-relay-mdns restart 'on-failure'
set container name udp-broadcast-relay-mdns shared-memory '0'

# onepassword-connect
set container name onepassword-connect image 'docker.io/1password/connect-api:1.7.0'
set container name onepassword-connect environment TZ value 'America/New_York'
set container name onepassword-connect memory '0'
set container name onepassword-connect network containers address '10.5.0.5'
set container name onepassword-connect shared-memory '0'
set container name onepassword-connect volume credentials source '/config/secrets/1password-credentials.json'
set container name onepassword-connect volume credentials destination '/home/opuser/.op/1password-credentials.json'
set container name onepassword-connect volume credentials mode 'ro'
set container name onepassword-connect volume data source '/tmp/onepassword/data'
set container name onepassword-connect volume data destination '/home/opuser/.op/data'
set container name onepassword-connect volume data mode 'rw'

# onepassword-sync
set container name onepassword-sync image 'docker.io/1password/connect-sync:1.7.0'
set container name onepassword-sync environment TZ value 'America/New_York'
set container name onepassword-sync memory '0'
set container name onepassword-sync shared-memory '0'
set container name onepassword-sync network containers address '10.5.0.6'
set container name onepassword-sync volume credentials source '/config/secrets/1password-credentials.json'
set container name onepassword-sync volume credentials destination '/home/opuser/.op/1password-credentials.json'
set container name onepassword-sync volume credentials mode 'ro'
set container name onepassword-sync volume data source '/tmp/onepassword/data'
set container name onepassword-sync volume data destination '/home/opuser/.op/data'
set container name onepassword-sync volume data mode 'rw'

# bind-exporter
set container name bind-exporter arguments '--bind.stats-url http://10.5.0.3:8080 --bind.stats-groups server,view'
set container name bind-exporter image 'quay.io/prometheuscommunity/bind-exporter:v0.6.1'
set container name bind-exporter network containers address '10.5.0.7'
set container name bind-exporter memory '0'
set container name bind-exporter restart 'on-failure'
set container name bind-exporter shared-memory '0'

