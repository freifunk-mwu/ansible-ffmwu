# Ansible role service-dhcpd

Diese Ansible role installiert und konfiguriert den kea dhcp daemon.
Wir nutzen diesen nur zur Verteilung von IPv4-Adressen.

- installiert kea-dhcp4-server
- schreibt kea-dhcp4.conf

## Benötigte Variablen

- Dictionary `meshes`

```
meshes:
  - id: xx
...
    site_name: # string
    site_code: # string
    ipv4_network:
    dnssl:
      - $domain # string
    kea_dnssl_binary: # kea < 1.2 only supports dnssl data in hex format
    iface_mtu: # integer
```

- Host Variable `magic`
- Host Variable `ipv4_dhcp`

## DHCP Range

In der Host-Variable `ipv4_dhcp` wird als Integer die Nummer des /22 Blocks aus `ipv4_network` definiert, welcher als DHCP Range verwendet werden soll. Dem Gateway Lotuswurzel ist die DHCP-Range 10.X.16.0-10.X.19.255 zugewiesen. Diese ist der 4. /22er Block, also wird in der Host-Variable für die Lotuswurzel `4` geschrieben.
