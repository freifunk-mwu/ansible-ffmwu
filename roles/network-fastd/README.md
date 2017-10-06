# Ansible role network-fastd

Diese Ansible role konfiguriert Netzwerk Interfaces für fastd.

- xxVPN pro Mesh
- xxigVPN pro Mesh

## Benötigte Variablen

- Dictionary `meshes`
´´´
meshes:
  - id: xx
...
    ipv4_network:
...

´´´
- Host Variable `magic`

## MAC-Adressen

Die MAC-Adressen der Interfaces werden aus dem IPv4-Subnetz sowie der `magic`-Nummerdes Hosts berechnet.

xxVPN-prefix: `02:11`
xxigVPN-prefix: `02:12`
