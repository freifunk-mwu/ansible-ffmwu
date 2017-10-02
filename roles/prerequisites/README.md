# Ansible role prerequisites

Diese Ansible role prüft ob die Voraussetzungen für ein Freifunk Gateway erfüllt sind.

- Forward-DNS Eintrag == ausgelesener IPv4-Adresse
- Forward-DNS Eintrag == ausgelesener IPv6-Adresse
- Linux Distribution == Debian
- Debian Version == 9

## Benötigte Variablen

- Variable `dns_host_ipv4_address` (Rollen-Variable)
```
dns_host_ipv4_address: "{{ lookup('dig', inventory_hostname, 'qtype=A') }}"
```
- Variable `dns_host_ipv6_address` (Rollen-Variable)
```
dns_host_ipv6_address: "{{ lookup('dig', inventory_hostname, 'qtype=AAAA') }}"
```
