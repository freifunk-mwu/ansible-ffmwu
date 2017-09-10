# Ansible role service-bird

Diese Ansible role installiert und konfiguriert den bird daemon.

- installiert bird
- aktiviert systemd units bird + bird6
- schreibt bird.conf + bird6.conf
- konfiguriert bird für iBGP mit allen anderen FFMWU-Servern

Im iBGP peeren wir mangels separatem Transfernetz (im Moment) im Mainzer Mesh Netz.

## Benötigte Variablen

- Variable `bgp_loopback_net` # IPv4-Range des Mainzer Meshes, hieraus werden die Loopback Adressen gewählt.
- Variable `bgp_ipv4_transfer_net` # IPv4-Range des Mainzer Meshes, das aktuell als Transfernetz benutzt wird.
- Variable `bgp_ipv6_transfer_net` # IPv6-Range des Mainzer Meshes, das aktuell als Transfernetz benutzt wird.
- Variable `bgp_as_private_mwu` # Private ASN von Freifunk MWU
- Dictionary `bgp_mwu_servers`
```
  spinat: # kurzer Hostname des Peers
    ipv4: 10.37.0.7 # IPv4-Adresse des Peers
    ipv6: fd37:b4dc:4b1e::a25:7 # IPv6-Adresse des Peers
...

```
- Dictionary `meshes`
´´´
meshes:
  xx:
...
    ipv4_network:
    ipv6:
      ula:
        - # IPv6-ULA Network
´´´
- Host Variable `magic`
