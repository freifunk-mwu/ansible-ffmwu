# Ansible role network-routing

Diese Ansible role konfiguriert System Einstellung bzgl. IP Routing.

- konfiguriert statische Routen (systemd Unit)
  - Mesh Routen für die Routing Tabelle `mwu`
  - Blackhole Routes für die Routing Tabellen `internet` + `main`
- konfiguriert IP rules (systemd Unit)
- konfiguriert sysctl Parameter

## Benötigte Variablen

- Dictionary `meshes`

```
meshes:
  - id: xx
...
    site_name:
    ipv4_network:
    ipv6_ula:
    ipv6_public:
```

- Listen `sysctl_settings_routing_basic` und `sysctl_settings_routing_gateway` (Rollen-Variablen)

```
sysctl_settings_routing_(basic|gateway):
  - name:       # sysctl-Parameter
    value:      # zu setzender Wert
...
```
- Host Variable `ffrl_public_ipv4_nat` # Format ip-adresse/prefix

- Host Dictionary `ffrl_exit_server`

- Host Variable `magic`

- Host Variable `ffmwu_server_type`
