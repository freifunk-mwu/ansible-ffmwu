# Ansible role service-radvd

Diese Ansible role installiert und konfiguriert den radvd daemon.

- installiert radvd
- aktiviert systemd unit
- schreibt radvd.conf

## Benötigte Variablen

- Dictionary `meshes`

```
meshes:
  - id: xx
...
    ipv6_ula:
      - # ULA-Prefix - String
    ipv6_public:
      - # Public-Prefix - String
    iface_mtu: # Integer
```

- Host Variable `magic`
