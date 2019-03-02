# Ansible role prerequisites

Diese Ansible role prüft ob die Voraussetzungen für ein Freifunk Gateway erfüllt sind.

- Forward-DNS Eintrag $FQDN == ausgelesener IPv4-Adresse
- Forward-DNS Eintrag $FQDN == ausgelesener IPv6-Adresse
- CNAME Eintrag gate$magic.freifunk-mwu.de == $FQDN
- CNAME Eintrag icvpn$magic.freifunk-mwu.de == $FQDN
- Linux Distribution == Debian
- Debian Version == 9

## Benötigte Variablen

Die folgenden Variablen werden über einen DNS Lookup gesetzt:
- Variable `dns_host_ipv4_address` (Rollen-Variable)
- Variable `dns_host_ipv6_address` (Rollen-Variable)
- Variable `dns_gate_num_cname` (Rollen-Variable)
- Variable `dns_gate_icvpn_cname` (Rollen-Variable)
- Variable `server_type`
