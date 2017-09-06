# Ansible role network-ffrl

Diese Ansible role konfiguriert die GRE-Tunnel Interfaces, die für den Internet-Exit über Freifunk Rheinland benötigt werden.

## Benötigte Variablen
- Dictionary `ffrl_exit_server` (Host Variable)
´´´
ffrl_exit_server:
  ffrl-a-ak-ber:
    public_ipv4_address: 185.66.195.0
    tunnel_ipv4_network: # Tunnel-Netzwerk in CIDR
    tunnel_ipv4_address: # Eigene Tunnel IPv4 Adresse
    tunnel_ipv4_netmask: 255.255.255.254
    tunnel_ipv6_address: # Eigene Tunnel IPv6 Adresse
    tunnel_ipv6_netmask: 64
  ffrl-b-ak-ber:
    public_ipv4_address: 185.66.195.1
    tunnel_ipv4_network: 
    tunnel_ipv4_address: 
    tunnel_ipv4_netmask: 255.255.255.254
    tunnel_ipv6_address: 
    tunnel_ipv6_netmask: 64
  ffrl-a-ix-dus:
    public_ipv4_address: 185.66.193.0
    tunnel_ipv4_network: 
    tunnel_ipv4_address: 
    tunnel_ipv4_netmask: 255.255.255.254
    tunnel_ipv6_address: 
    tunnel_ipv6_netmask: 64
  ffrl-b-ix-dus:
    public_ipv4_address: 185.66.193.1
    tunnel_ipv4_network: 
    tunnel_ipv4_address: 
    tunnel_ipv4_netmask: 255.255.255.254
    tunnel_ipv6_address: 
    tunnel_ipv6_netmask: 64
  ffrl-a-fra2-fra:
    public_ipv4_address: 185.66.194.0
    tunnel_ipv4_network: 
    tunnel_ipv4_address: 
    tunnel_ipv4_netmask: 255.255.255.254
    tunnel_ipv6_address: 
    tunnel_ipv6_netmask: 64
  ffrl-b-fra2-fra:
    public_ipv4_address: 185.66.194.1
    tunnel_ipv4_network: 
    tunnel_ipv4_address: 
    tunnel_ipv4_netmask: 255.255.255.254
    tunnel_ipv6_address: 
    tunnel_ipv6_netmask: 64
´´´
