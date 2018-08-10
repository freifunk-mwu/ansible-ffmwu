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

- List `sysctl_settings_routing` (Rollen-Variable)

```
sysctl_settings_routing:
  - name:       # sysctl-Parameter
    value:      # zu setzender Wert
...
- Host Variable `ffrl_public_ipv4_nat` # Format ip-adresse/prefix
- Host Dictionary `ffrl_exit_server
```

- Host Variable `magic`
