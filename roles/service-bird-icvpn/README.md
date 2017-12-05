# Ansible role service-bird-icvpn

Diese Ansible role ergänzt die benötigte bird + bird6 Konfiguration für das Freifunk Intercity VPN.

- installiert bird
- schreibt icvpn_ipv4.conf + icvpn_ipv6.conf
- schreibt initiale ICVPN peers config (nur wenn nicht vorhanden)
- schreibt initiale ICVPN ROA config (nur wenn nicht vorhanden)

## Benötigte Variablen

- Variable `icvpn_ipv4_transfer_net` # IPv4-Range des ICVPN Transfer Netzes
- Variable `icvpn_ipv6_transfer_net` # IPv6-Range des ICVPN Transfer Netzes
- Host Variable `magic`

## Benötigte roles

- git-repos
- service-bird
