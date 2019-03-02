# Ansible role network-loopback

Diese Ansible role konfiguriert das FFMWU Loopback Interface.

- dummy interface
- Loopback IP

## Benötigte Variablen

- loopback_net_ipv4 # IPv4-Subnetz aus dem die Loopback IPs berechnet werden
- loopback_net_ipv6 # IPv6-Subnetz aus dem die Loopback IPs berechnet werden
