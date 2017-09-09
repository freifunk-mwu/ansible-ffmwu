# Ansible role service-rclocal

Diese Ansible role schreibt die rc.local.
Über die rc.local werden im Moment noch sämtliche IP rules sowie statischen IP-Routen konfiguriert.

All dieses sollte in Zukunft durch systemd units abgelöst werden.

## Benötigte Variablen

- Dictionary `meshes`
´´´
meshes:
  xx:
...
    site_name: # string
    ipv4_network:
    ipv6:
      ula:
        - # string
      public:
        - # string
    iface_mtu: # integer
´´´
- Host Variable `magic`
- Host Variable `ffrl_public_ipv4_nat`
- Host Dictionary `ffrl_exit_server`
