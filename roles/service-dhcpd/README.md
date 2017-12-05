# Ansible role service-dhcpd

Diese Ansible role installiert und konfiguriert den isc dhcp daemon.
Wir nutzen diesen nur zur Verteilung von IPv4-Adressen.

- installiert isc-dhcp-server
- setzt interfaces in /etc/default/isc-dhcp-server
- schreibt dhcpd.conf

## Benötigte Variablen

- Dictionary `meshes`
´´´
meshes:
  - id: xx
...
    site_name: # string
    site_code: # string
    ipv4_network:
    dnssl:
      - $domain # string
    iface_mtu: # integer
´´´
- Host Variable `magic`
- Host Variable `ipv4_dhcp_range`

## DHCP Range

In der Host-Variable `ipv4_dhcp_range` wird als Integer die Nummer des /22 Blocks aus `ipv4_network` definiert, welcher als DHCP Range verwendet werden soll. Dem Gateway Lotuswurzel ist die DHCP-Range 10.X.16.0-10.X.19.255 zugewiesen. Diese ist der 4. /22er Block, also wird in der Host-Variable für die Lotuswurzel `4` geschrieben.
