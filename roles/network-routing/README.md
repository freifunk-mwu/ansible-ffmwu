# Ansible role network-routing

Diese Ansible role konfiguriert System Einstellung bzgl. IP Routing.

- konfiguriert statische Routen (systemd Unit)
  - Mesh Routen für die Routing Tabelle `mwu`
  - Blackhole Routes für die Routing Tabellen `internet` + `main`
- konfiguriert sysctl Parameter

## Benötigte Variablen

- Dictionary `meshes`
´´´
meshes:
  - id: xx
...
    site_name:
    ipv4_network:
    ipv6_ula
    ipv6_public:
´´´
- List `sysctl_settings_gateway` (Rollen-Variable)
```
sysctl_settings_routing:
  - name:       # sysctl-Parameter
    value:      # zu setzender Wert
...

´´´
- Host Variable `magic`
