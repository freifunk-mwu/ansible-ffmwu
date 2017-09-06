# Ansible role service-radvd

Diese Ansible role installiert und konfiguriert den radvd daemon.

- installiert radvd
- aktiviert systemd unit
- schreibt radvd.conf

## Benötigte Variablen

- Dictionary `meshes`
´´´
meshes:
  xx:
...
    ipv6:
      ula:
        - # ULA-Prefix - String
      public:
        - # Public-Prefix - String
    iface_mtu: # Integer
´´´
- Host Variable `magic`
