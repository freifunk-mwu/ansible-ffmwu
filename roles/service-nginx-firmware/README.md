# Ansible role service-nginx-firmware

Diese Ansible role konfiguriert die Firmware Synchronisation und die erforderlichen nginx vHosts.

- verwaltet `/var/www/html/firmware`
- installiert und konfiguriert den systemd timer firmware-sync
- schreibt firmware.conf

## Benötigte Variablen

- Variable `http_domain_external` # string: Externe Freifunk MWU Domain
- Variable `http_domain_internal` # string: Interne Freifunk MWU Domain
- Dictionary `meshes`
´´´
meshes:
  - id: xx
...
    site_name: # string
...
    http_domain_external: # string: Externe Mesh Domain
    http_domain_internal: # string: Interne Mesh Domain
´´´
