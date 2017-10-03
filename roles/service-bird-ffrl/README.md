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
    tunnel_ipv6_network: # IPv6 Transfernetz
  ffrl-b-ak-ber:
    public_ipv4_address: 185.66.195.1
    tunnel_ipv4_network:
    tunnel_ipv6_network:
  ffrl-a-ix-dus:
    public_ipv4_address: 185.66.193.0
    tunnel_ipv4_network:
    tunnel_ipv6_network:
  ffrl-b-ix-dus:
    public_ipv4_address: 185.66.193.1
    tunnel_ipv4_network:
    tunnel_ipv6_network:
  ffrl-a-fra2-fra:
    public_ipv4_address: 185.66.194.0
    tunnel_ipv4_network:
    tunnel_ipv6_network:
  ffrl-b-fra2-fra:
    public_ipv4_address: 185.66.194.1
    tunnel_ipv4_network:
    tunnel_ipv6_network:
´´´
- Host Variable `ffrl_public_ipv4_nat` # Format ip-adresse/prefix
- Host Variable `magic`

## Benötigte roles

- service-bird
