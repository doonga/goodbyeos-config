#!/bin/vbash

# General configuration
set firewall state-policy established action 'accept'
set firewall state-policy related action 'accept'
set firewall all-ping enable
set firewall broadcast-ping disable

# Address Groups
set firewall group address-group homekit-devices address '10.1.2.12'
set firewall group address-group homekit-devices address '10.1.2.15'
set firewall group address-group homekit-devices address '10.1.2.17'
set firewall group address-group homekit-devices address '10.1.2.18'
set firewall group address-group homekit-devices address '10.1.2.19'
set firewall group address-group homekit-devices address '10.1.2.20'
set firewall group address-group homekit-devices address '10.1.2.21'
set firewall group address-group homekit-devices address '10.1.2.22'
set firewall group address-group homekit-devices address '10.1.5.23'
set firewall group address-group homekit-devices address '10.1.5.24'
set firewall group address-group homekit-devices address '10.1.5.25'

set firewall group address-group ios_devices address '10.1.2.12'
set firewall group address-group ios_devices address '10.1.2.13'
set firewall group address-group ios_devices address '10.1.2.15'
set firewall group address-group ios_devices address '10.1.2.26'

set firewall group address-group jellyfin_clients address '10.1.2.10'
set firewall group address-group jellyfin_clients address '10.1.2.11'
set firewall group address-group jellyfin_clients address '10.1.2.12'
set firewall group address-group jellyfin_clients address '10.1.2.13'
set firewall group address-group jellyfin_clients address '10.1.2.14'

set firewall group address-group k8s_api address '10.5.0.2'

set firewall group address-group k8s_awnet address '10.45.0.26'

set firewall group address-group k8s_ingress address '10.45.0.1'

set firewall group address-group k8s_ingress_allowed address '10.1.3.198'

set firewall group address-group k8s_jellyfin address '10.45.0.21'

set firewall group address-group k8s_mqtt address '10.45.0.10'

set firewall group address-group k8s_nodes address '10.1.1.4'
set firewall group address-group k8s_nodes address '10.1.1.5'
set firewall group address-group k8s_nodes address '10.1.1.6'
set firewall group address-group k8s_nodes address '10.1.1.7'
set firewall group address-group k8s_nodes address '10.1.1.8'
set firewall group address-group k8s_nodes address '10.1.1.9'
set firewall group address-group k8s_nodes address '10.1.3.7'
set firewall group address-group k8s_nodes address '10.1.3.8'
set firewall group address-group k8s_nodes address '10.1.3.9'

set firewall group address-group k8s_hass address '10.1.3.151'
set firewall group address-group k8s_plex address '10.45.0.20'

set firewall group address-group k8s_vector_aggregator address '10.45.0.2'

set firewall group address-group mqtt_clients address '10.1.3.20'
set firewall group address-group mqtt_clients address '10.1.3.21'
set firewall group address-group mqtt_clients address '10.1.3.22'
set firewall group address-group mqtt_clients address '10.1.3.23'
set firewall group address-group mqtt_clients address '10.1.3.24'

set firewall group address-group hass_clients address '10.1.4.12'

set firewall group address-group nas address '10.1.1.3'

set firewall group address-group omada address '10.1.1.11'

set firewall group address-group plex_clients address '10.1.2.11'
set firewall group address-group plex_clients address '10.1.2.12'
set firewall group address-group plex_clients address '10.1.2.13'
set firewall group address-group plex_clients address '10.1.2.14'
set firewall group address-group plex_clients address '10.1.2.15'
set firewall group address-group plex_clients address '10.1.5.23'
set firewall group address-group plex_clients address '10.1.2.24'
set firewall group address-group plex_clients address '10.1.3.25'

set firewall group address-group printers address '10.1.3.13'

set firewall group address-group scanners address '10.1.3.13'

set firewall group address-group scrypted address '10.1.3.153'

set firewall group address-group vector_journald_allowed address '10.1.3.60'

set firewall group address-group vyos_coredns address '10.5.0.3'

set firewall group address-group vyos_dnsdist address '10.5.0.4'

set firewall group address-group weather_stations address '10.1.3.198'

set firewall group address-group zigbee_coordinator address '10.1.3.196'

# Network groups
set firewall group network-group k8s_services network '10.45.0.0/16'

# Port groups
set firewall group port-group wireguard port '51820'
