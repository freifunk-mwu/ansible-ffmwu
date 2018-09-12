# Ansible role network-fastd

Diese Ansible role konfiguriert Netzwerk Interfaces für die definierten fastd Instanzen.

Es wird zwischen node- und backbone-Instanzen unterschieden.

## Interface-Benamung
- Node-Interfaces: _$mesh.id_ + vpn + '-' + _$mesh.fastd.nodes.instances.xx.mtu_, z.B. "mzvpn-1312"
- Backbone-Interfaces: _$mesh.id_ + 'ig' + vpn + '-' + _$mesh.fastd.backbone.instances.xx.mtu_, z.B. "mzigvpn-1312"

## Benötigte Variablen

- Dictionary `meshes`

```
meshes:
  - id: xx
...
    ipv4_network:
...
    fastd:
      nodes:
        instances:
          - id: 0 # integer
            mtu: # integer
          ...
      backbone:
        instances:
          - id: 0 # integer
            mtu: # integer
          ...

```

- Host Variable `magic`

- Host Variable `ffmwu_server_type`

## MAC-Adressen

Die MAC-Adressen der Interfaces werden aus dem IPv4-Subnetz sowie der `magic`-Nummer des Hosts berechnet. x = ID der fastd-Instanz.

- xxvpn-$mtu prefix: `02:2x`
- xxigvpn-$mtu prefix: `02:3x` 
