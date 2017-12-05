# Ansible role service-bind-slave

Diese Ansible role installiert und konfiguriert den DNS Server BIND auf einem Freifunk Gateway.
Die Gateways agieren lediglich als Slave-DNS Server.

- installiert BIND Pakete
- schreibt named.conf + named.conf.options + named.conf.logging
- schreibt named.conf.icvpn nur wenn noch nicht vorhanden
- schreibt für jedes Mesh eine Konfigurationsdatei named.conf.$site_code
  - Forward-Zones müssen im `meshes`-Dict angegeben werden
  - Reverse DNS Zones werden automatisch aus den benutzten IP-Subnetzen erzeugt

## Benötigte Variablen

- Dictionary `meshes`
´´´
meshes:
  - id: xx
...
    site_code: # string
    ipv4_network:
    ipv6_ula:
      - # ULA-Prefix
      - ...
    dns:
      master: # IP-Adresse des DNS Masters
      forward_zones:
        - name: $zone # DNS-Domain
          master: # optional: IP-Adresse des DNS Masters, wenn die vom übergeordneten abweicht.
      
´´´
- Variable `icvpn_ipv4_transfer_net`
- Variable `icvpn_ipv6_transfer_net`
- Host Variable `magic`

## Benötigte roles

- git-repos
