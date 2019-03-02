# Ansible role service-bird

Diese Ansible role installiert und konfiguriert den bird daemon.

- installiert bird
- aktiviert systemd units bird + bird6
- schreibt bird.conf + bird6.conf
- konfiguriert bird für iBGP mit allen anderen FFMWU-Servern
- konfiguriert Router Advertisements für die Mesh Interfaces

Im iBGP peeren wir mangels separatem Transfernetz (im Moment) im Mainzer Mesh Netz.

## Benötigte Variablen

- Variable `bgp_loopback_net` # IPv4-Range des Mainzer Meshes, hieraus werden die Loopback Adressen gewählt.
- Variable `loopback_net_ipv4` # IPv4-Subnetz für Loopback-Adressen
- Variable `loopback_net_ipv6` # IPv6-Subnetz für Loopback-Adressen
- Variable `anycast_ipv4` # Anycast IPv4-Adresse
- Variable `anycast_ipv6` # Anycast IPv6-Adresse
- Variable `bgp_ipv4_transfer_net` # IPv4-Range des Mainzer Meshes, das aktuell als Transfernetz benutzt wird.
- Variable `bgp_ipv6_transfer_net` # IPv6-Range des Mainzer Meshes, das aktuell als Transfernetz benutzt wird.
- Variable `bgp_as_private` # Private ASN von Freifunk MWU
- Liste `bgp_groups` # List von Hostgruppen zu denen eine Verbindung aufgebaut werden soll
- Liste `internal_prefixes`
- Dictionary `bgp_legacy_servers`

```
  spinat: # kurzer Hostname des Peers
    ipv4: 10.37.0.7 # IPv4-Adresse des Peers
    ipv6: fd37:b4dc:4b1e::a25:7 # IPv6-Adresse des Peers
...
```

- Dictionary `meshes`

```
meshes:
  - id: xx
...
    ipv4_network:
    ipv6_ula:
      - # IPv6-ULA Network
    ipv6_public:
      - # IPv6-Public Network
    radvd:
      maxrtradvinterval: <integer> # seconds
      advvalidlifetime: <integer> # seconds
      advpreferredlifetime: <integer> # seconds

```

- Host Variable `magic`
