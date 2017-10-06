# Ansible role network-batman

Diese Ansible role konfiguriert batman-adv Netzwerk Interfaces.

- dummy interface pro mesh
- batman-adv interface pro mesh
- konfiguriert sysfs variablen:
  - Hop Penalty pro batman-adv interface

## Benötigte Variablen

- Dictionary `meshes`
´´´
meshes:
  - id: xx
...
    ipv4_network:
...
    batman:
      it: # integer: originator interval
      gw: # string: gateway mode
      mm: # boolean: multicast mode
      dat: # boolean: distributed arp table

´´´
- Host Variable `magic`

## MAC-Adressen

Die MAC-Adressen der Interfaces werden aus dem IPv4-Subnetz sowie der `magic`-Nummer des Hosts berechnet.

xx0-prefix: `02:00`
xxBAT-prefix: `02:01`
