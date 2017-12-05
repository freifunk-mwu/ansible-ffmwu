# Ansible role network-ffrl

Diese Ansible role konfiguriert die GRE-Tunnel Interfaces, die für den Internet-Exit über Freifunk Rheinland benötigt werden.

## Benötigte Variablen
- Dictionary `ffrl_exit_server` (Host Variable)
´´´
ffrl_exit_server:
  ffrl-a-ak-ber:
    public_ipv4_address: 185.66.195.0
    tunnel_ipv4_network: # IPv4 Tunnel Transfernetz
    tunnel_ipv6_network: # IPv6 Tunnel Transfernetz
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
