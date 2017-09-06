# Ansible role network-meshbridge

Diese Ansible role konfiguriert die Linux Bridges für die Freifunk Meshes.

- linux bridge pro mesh inklusive IP-Konfiguration
- konfiguriert sysfs variablen:
  - hash_max

## Benötigte Variablen

- Dictionary `meshes`
´´´
meshes:
  xx:
...
    ipv4_network:
...
    ipv6:
      ula:
        - fdxx.../48 # ipv6 ula prefix
      public:
        - 2xxx.../48 # ipv6 public prefix

´´´
- Host Variable `magic`

## MAC-Adressen

Die MAC-Adressen der Interfaces werden aus dem IPv4-Subnetz sowie der `magic`-Nummer des Hosts berechnet.

xxBR-prefix: `02:10`
