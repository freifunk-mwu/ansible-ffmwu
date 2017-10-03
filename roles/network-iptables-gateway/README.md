# Ansible role network-iptables-gateway

Diese Ansible role konfiguriert iptables Regeln für IPv4+IPv6 eines Freifunk Gateways.

- installiert iptables+iptables-persistent
- schreibt rules.v4 + rules.v6
- setzt netfilter sysctl parameter

## Benötigte Variablen

- List `sysctl_settings_netfilter` (Rollen Variable)
´´´
sysctl_settings_netfilter:
  - name:       # sysctl-Parameter
    value:      # zu setzender Wert

´´´
- Dictionary `meshes`
´´´
meshes:
  xx:
...
    ipv4_network:
...

´´´
- Variable `internet_exit_mtu_ipv4`
- Variable `internet_exit_mtu_ipv6`
- Host Variable `ffrl_public_ipv4_nat` # Format ip-adresse/prefix
