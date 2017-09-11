# Ansible role service-bird-ffrl

Diese Ansible role ergänzt die benötigte bird + bird6 Konfiguration für den Internet-Uplink über Freifunk Rheinland.

- schreibt ffrl_ipv4.conf + ffrl_ipv6.conf
- schreibt ffrl_ipv4_peers.conf + ffrl_ipv6_peers.conf

## Benötigte Variablen

- Variable `as_public_ffrl` # Public ASN Freifunk Rheinland
- Dictionary `meshes`
```
meshes:
  xx:
...
    ipv6:
      public:
        - # Public IPv6-Netzwerk
```
- Host Dictionary `ffrl_exit_server`
´´´
ffrl_exit_server:
  ffrl-a-ak-ber:
    public_ipv4_address: 185.66.195.0
    tunnel_ipv4_network: # Tunnel-Netzwerk in CIDR
    tunnel_ipv4_address: # Eigene Tunnel IPv4 Adresse
    tunnel_ipv4_netmask: 255.255.255.254
    tunnel_ipv6_network: # IPv6 Transfernetz
    tunnel_ipv6_netmask: 64
  ffrl-b-ak-ber:
    public_ipv4_address: 185.66.195.1
    tunnel_ipv4_network:
    tunnel_ipv4_address:
    tunnel_ipv4_netmask: 255.255.255.254
    tunnel_ipv6_network:
    tunnel_ipv6_netmask: 64
  ffrl-a-ix-dus:
    public_ipv4_address: 185.66.193.0
    tunnel_ipv4_network:
    tunnel_ipv4_address:
    tunnel_ipv4_netmask: 255.255.255.254
    tunnel_ipv6_network:
    tunnel_ipv6_netmask: 64
  ffrl-b-ix-dus:
    public_ipv4_address: 185.66.193.1
    tunnel_ipv4_network:
    tunnel_ipv4_address:
    tunnel_ipv4_netmask: 255.255.255.254
    tunnel_ipv6_network:
    tunnel_ipv6_netmask: 64
  ffrl-a-fra2-fra:
    public_ipv4_address: 185.66.194.0
    tunnel_ipv4_network:
    tunnel_ipv4_address:
    tunnel_ipv4_netmask: 255.255.255.254
    tunnel_ipv6_network:
    tunnel_ipv6_netmask: 64
  ffrl-b-fra2-fra:
    public_ipv4_address: 185.66.194.1
    tunnel_ipv4_network:
    tunnel_ipv4_address:
    tunnel_ipv4_netmask: 255.255.255.254
    tunnel_ipv6_network:
    tunnel_ipv6_netmask: 64
´´´
- Host Variable `ffrl_public_ipv4_nat` # IPv4 NAT Adresse für das Gateway
- Host Variable `magic`

## Benötigte roles

- service-bird
